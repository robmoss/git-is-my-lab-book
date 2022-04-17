TEX_FILES = $(shell find . -type f -name '*.tex')
PDF_FILES := $(TEX_FILES:.tex=.pdf)
PNG_FILES := $(TEX_FILES:.tex=.png)

TEX_CLS := tikzfig.cls

TMP_EXTS := aux log
TMP_FILES := $(foreach EXT,$(TMP_EXTS),$(TEX_FILES:.tex=.$(EXT)))

# Convert PDFs to 150 dpi PNG images.
CONVERT_FLAGS := -density 150 -quality 90
# Ensure that PNG files are reproducible by excluding timestamps.
CONVERT_FLAGS += -define png:exclude-chunks=date,time

help:
	@echo ""
	@echo "Build figures for Git is my lab book"
	@echo ""
	@echo "    make all:        build all figures"
	@echo "    make clean:      remove temporary files"
	@echo "    make distclean:  remove all generated files"
	@echo ""

all: $(PNG_FILES)
	@for image in $(PNG_FILES); do cp $$image ../src/$$image; done

%.png: %.pdf
	@convert $(CONVERT_FLAGS) $< $@

%.pdf: %.tex $(TEX_CLS)
	@xelatex -output-directory=$(shell dirname "$@") $*

clean:
	@rm -f $(PDF_FILES) $(TMP_FILES)

distclean: clean
	@rm -f $(PNG_FILES)

.PHONY: all clean distclean
.SECONDARY: $(PDF_FILES)
