/* Implement tabbed code blocks for mdBook. */

function addTabsToGroup(group) {
    // Create the container for the tab buttons.
    const tab_bar = document.createElement("ul");
    tab_bar.className = "tab-bar";
    group.prepend(tab_bar);

    // Add a tab for each code block, and hide all but the first block.
    const pre_elements = group.querySelectorAll("pre");
    pre_elements.forEach((pre_elt, ix) => {
        const tab_elt = addTabForCodeBlock(tab_bar, pre_elements, pre_elt);
        if (ix > 0) {
            pre_elt.style.display = "none";
        } else {
            tab_elt.classList.add("active");
        }
    });
}

function addTabForCodeBlock(tab_bar, pre_elts, pre_elt) {
    // Find the code element, from which we can identify the language.
    const code_elt = pre_elt.querySelector("code");
    // Identify the code block language.
    const tab_text = document.createTextNode(getTabTextForCode(code_elt));

    // Create the button for this tab.
    const tab_elt = document.createElement("li");
    tab_elt.appendChild(tab_text);
    tab_bar.appendChild(tab_elt);

    // Add an event handler for switching between tabs.
    addTabEventHandler(tab_elt, tab_bar, pre_elts, pre_elt);

    return tab_elt;
}

function getTabTextForCode(code_elt) {
    // Identify the language based on the code element's class.
    if (code_elt.classList.contains("language-python")) {
        return "Python";
    } else if (code_elt.classList.contains("language-R")) {
        return "R";
    } else if (code_elt.classList.contains("language-cpp")) {
        return "C++";
    } else {
        return "Unknown language";
    }
}

function addTabEventHandler(tab_elt, tab_bar, pre_elts, pre_elt) {
    tab_elt.addEventListener("click", () => {
        // Hide all code blocks.
        pre_elts.forEach((pre_elt) => {
            pre_elt.style.display = "none";
        });
        // Show this code block.
        pre_elt.style.display = "block";

        // Mark this button as the active tab.
        tab_bar.querySelectorAll("li").forEach((elt) => {
            elt.classList.remove("active");
        });
        tab_elt.classList.add("active");
    });
}

// Create a tab bar for each group of code blocks.
window.addEventListener("DOMContentLoaded", (event) => {
    const tab_groups = document.querySelectorAll("div.tabbed-blocks");
    tab_groups.forEach(addTabsToGroup);
});
