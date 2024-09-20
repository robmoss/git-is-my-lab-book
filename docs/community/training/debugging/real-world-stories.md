# Real-world stories

## Rob Moss: pypfilt (Python)

Last week (Tues 17 Sep, 2024) I encountered an error when running model simulations with my [pypfilt](https://pypfilt.readthedocs.io/) Python library.
I used the breakpoint technique described on [the previous page](when-something-fails.md), and identified the cause in **less than 2 minutes**.

Here is the original stack trace that made me aware of the error:

```text linenums="1" hl_lines="11"
Traceback (most recent call last):
  File "./run_model_simulations.py", line 633, in <module>
  File "./run_model_simulations.py", line 56, in main
    results = run_simulations(
  File "./run_model_simulations.py", line 282, in run_simulations
    results = pypfilt.fit(ctx, filename=filename)
  File "venv/lib/python3.10/site-packages/pypfilt/__init__.py", line 536, in fit
    ctx.component['summary'].save_forecasts(ctx, results, filepath)
  File "venv/lib/python3.10/site-packages/pypfilt/summary.py", line 1523, in save_forecasts
    save_data(obs_group, key, value)
  File "venv/lib/python3.10/site-packages/pypfilt/summary.py", line 1467, in save_data
    raise ValueError(
ValueError: Error saving dataset "00_to_04" with value [...] and type ndarray
```

The error occurred on **line 1467** (highlighted above).
This [piece of code](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/blob/ada50f970e7787d97605dc11ed228640b0c72e1d/src/pypfilt/summary.py#L1458-L1469) looks like:

```python title="pypfilt/summary.py" linenums="1458"
try:
    if isinstance(value, np.ndarray):
        save_dataset(time_scale, g, name, value, **kwargs)
    else:
        g.create_dataset(name, data=value, **kwargs)
except TypeError:
    msg = (
        'Error saving dataset "{}" with value {} and type {}'
    )
    raise ValueError(
        msg.format(name, value, type(value).__name__)
    ) from None
```

So I added a `breakpoint()` call on line 1464 and ran the simulations again:

```python title="pypfilt/summary.py" linenums="1458" hl_lines="7"
try:
    if isinstance(value, np.ndarray):
        save_dataset(time_scale, g, name, value, **kwargs)
    else:
        g.create_dataset(name, data=value, **kwargs)
except TypeError:
    breakpoint()
    msg = (
        'Error saving dataset "{}" with value {} and type {}'
    )
    raise ValueError(
        msg.format(name, value, type(value).__name__)
    ) from None
```

- I observed that `value` was a NumPy array.

- This meant that `isinstance(value, np.ndarray)` returns `True`.

- So the `save_dataset()` function on line 1460 was failing.

- I called `save_dataset()` and stepped into the function.

- This allowed me to **identify the cause:**

    - When the `value` array was created, it originally had columns called `"arrival_date"` and `"count"`;

    - The `"arrival_date"` column contains date values;

    - Dates must be converted into strings when saving data as a HDF5 dataset;

    - Metadata was attached to the `value` array, to indicate how to convert `"arrival_date"` values;

    - But then the columns were then renamed to `"time"` and `"value"`;

    - The metadata **was not updated**, so the `"time"` values were not converted into strings; and

    - This caused `save_dataset()` to fail.

Here is the [faulty code](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/blob/ada50f970e7787d97605dc11ed228640b0c72e1d/src/pypfilt/obs.py#L450-L462) (in a different file!):

```python title="pypfilt/obs.py" linenums="450" hl_lines="4-12"
# Load the data table.
fields = [io.time_field(time_col), (value_col, np.float64)]
df = io.read_fields(time_scale, filename, fields)
# Rename the columns to 'time' and 'value'.
rename_to = {
    time_col: 'time',
    value_col: 'value',
}
new_names = tuple(
    rename_to.get(name, name) for name in df.dtype.names
)
df.dtype.names = new_names
return df
```

And here is [the fix](https://gitlab.unimelb.edu.au/rgmoss/particle-filter-for-python/-/commit/5463da78fe6a2dc41267575b12a72aa5a00d232c):

```python title="pypfilt/obs.py" linenums="450" hl_lines="4-8"
# Load the data table.
fields = [io.time_field(time_col), (value_col, np.float64)]
df = io.read_fields(time_scale, filename, fields)
# Rename the columns to 'time' and 'value', and ensure that the dtype
# metadata is updated to reflect the renamed columns.
fields_out = [io.time_field('time'), ('value', np.float64)]
dtype_out = io.fields_dtype(time_scale, fields_out)
return df.astype(dtype_out)
```

## Michael Lydeamore: ORCID publications (R)

I wrote the `get_publications_from_orcid()` function (shown below) to retrieve the publications associated with a specific [ORCID](https://orcid.org/) ID, using the [`rorcid`](https://cran.r-project.org/web/packages/rorcid/index.html) package.

!!! info "Retrieving research publications"

    This is now available as the [`publicationsscraper`](https://github.com/numbats/achievement-scraper) R package.

The function has some error-catching built in:

- If the ORCID ID doesn't exist (Error 404) then the function returns this error to the user (the `tryCatch` part, lines 26-35);

- If DOIs aren't returned for a publication, they are filled with `NA` (using `purrr::map`, lines 50-63); and

- If the `works` frame is empty, or doesn't exist, the function returns an empty frame (handled by the `if` statement on line 36).

```R linenums="1"
#' get_publications_from_orcid
#'
#' @description
#' The `get_publications_from_orcid` function retrieves publications for given ORCID IDs using the rorcid package.
#' It fetches all works associated with each ORCID ID and combines them into a single data frame.
#'
#' @param orcid_ids A character vector of ORCID IDs for which publication information is requested.
#'
#' @return A data frame containing all publications for the specified ORCID IDs.
#'
#' @importFrom rorcid orcid_works
#' @importFrom dplyr select bind_rows mutate
#' @importFrom tibble tibble
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{get_publications_from_orcid(c("0000-0003-2531-9408", "0000-0001-5738-1471"))}
#'
#' @name get_publications_from_orcid
#' @export
get_publications_from_orcid <- function(orcid_ids) {
  orcid_ids <- as.vector(orcid_ids)
  all_pubs <- list()

  for (orcid_id in orcid_ids) {
    pubs <- tryCatch(
      rorcid::orcid_works(orcid_id),
      error = function(e) {
        if (inherits(e, "http_404")) {
          stop(sprintf("Invalid ORCID ID: %s", orcid_id))
        } else {
          print(e)
        }
      }
    )
    if (!is.null(pubs[[1]]$works) && nrow(pubs[[1]]$works) > 0) {
      all_pubs[[orcid_id]] <- pubs[[1]]$works |>
        dplyr::select(
          title = `title.title.value`,
          DOI = `external-ids.external-id`,
          authors = `source.assertion-origin-name.value`,
          publication_year = `publication-date.year.value`,
          journal_name = `journal-title.value`
        ) |>
        dplyr::mutate(
          # the `external-ids` contains lots of things, not just DOI. It is a list containing a dataframe
          # Mapping over that list, we can filter out just the 'doi' type
          # Then pull it into a character vector
          # Overwrite DOI with this value
          DOI = purrr::map_chr(
            .x = DOI,
            .f = function(x) {
              if(length(x) == 0L)
                return(NA)
              doi <- dplyr::filter(x, `external-id-type` == "doi") |>
                dplyr::pull(`external-id-value`)

              if (length(doi) == 0L) {
                return (NA)
              } else {
                return (doi[1])
              }
            }
          ),
          orcid_id = orcid_id,
          publication_year = as.numeric(publication_year)
        )
    }
  }

  return(dplyr::bind_rows(all_pubs))
}
```

But I ran into an unusual error: this function failed for some ORCID IDs with valid works.

```text
> get_publications_from_orcid("0000-0001-9379-0010")
Error in `dplyr::select()`:
! Can't subset columns that don't exist.
✖ Column `source.assertion-origin-name.value` doesn't exist.
Hide Traceback
     ▆
  1. ├─global get_publications_from_orcid("0000-0001-9379-0010")
  2. │ ├─dplyr::mutate(...)
  3. │ ├─dplyr::select(...)
  4. │ └─dplyr:::select.data.frame(...)
  5. │   └─tidyselect::eval_select(expr(c(...)), data = .data, error_call = error_call)
  6. │     └─tidyselect:::eval_select_impl(...)
  7. │       ├─tidyselect:::with_subscript_errors(...)
  8. │       │ └─rlang::try_fetch(...)
  9. │       │   └─base::withCallingHandlers(...)
 10. │       └─tidyselect:::vars_select_eval(...)
 11. │         └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
 12. │           └─tidyselect:::eval_c(expr, data_mask, context_mask)
 13. │             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
 14. │               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
 15. │                 └─tidyselect:::as_indices_sel_impl(...)
 16. │                   └─tidyselect:::as_indices_impl(...)
 17. │                     └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
 18. │                       └─vctrs::vec_as_location(...)
 19. └─vctrs (local) `<fn>`()
 20.   └─vctrs:::stop_subscript_oob(...)
 21.     └─vctrs:::stop_subscript(...)
 22.       └─rlang::abort(...)
```

To debug this, I made liberal use of the `browser()` command and analysed each part of the `pubs` object.
This quickly revealed the cause of the error:

For ORCID works that **are not** journal publications (e.g., conference proceeedings), the `source.assertion-origin-name.value` column contains `NA` — in other words, these works **have no authors** defined.
And if there are no journal publications associated with the ORCID ID, the `source.assertion-origin-name.value` column **does not exist**!

The solution was to only select columns if they existed, by using `dplyr::matches()`:

``` r
all_pubs[[orcid_id]] <- pubs[[1]]$works |>
        dplyr::select(
          title = dplyr::matches("title.title.value"),
          DOI = dplyr::matches("external-ids.external-id"),
          authors = dplyr::matches("source.assertion-origin-name.value"),
          publication_year = dplyr::matches("publication-date.year.value"),
          journal_name = dplyr::matches("journal-title.value")
        )
```

and then adding any missing columns, filling them with a default value:

``` r
append_column_if_missing <- function(.data, column, default_value = NA) {

  current_columns <- colnames(.data)

  if (!column %in% current_columns) {
    return(
      .data |>
        mutate(!!column := default_value)
    )
  }

  return (.data)
}

# ... |>
append_column_if_missing("title", default_value = NA_character_) |>
append_column_if_missing("DOI", default_value = NA_character_) |>
append_column_if_missing("authors", default_value = NA_character_) |>
append_column_if_missing("publication_year", default_value = NA_integer_) |>
append_column_if_missing("journal_name", default_value = NA_character_) |>
# ...
```
