#
# Define recipes for installing mdbook and other required tools.
#

# The required version of each tool used to build the book.
MDBOOK_VERSION := 0.4.18
ADMONISH_VERSION := 1.6.0
LINKCHECK_VERSION := 0.7.6

# Where to install mdbook and other required tools.
TOOLS_DIR := $(CURDIR)/mdbook

# The full path to each tool.
MDBOOK_CMD := $(TOOLS_DIR)/mdbook
ADMONISH_CMD := $(TOOLS_DIR)/mdbook-admonish
LINKCHECK_CMD := $(TOOLS_DIR)/mdbook-linkcheck

#
# Show instructions for using this Makefile.
#
help:
	@echo ''
	@echo 'USAGE: make <target>'
	@echo ''
	@echo 'TARGETS:'
	@echo ''
	@echo '    install:  Install mdbook and other required tools'
	@echo '    help:     Display this help message'
	@echo ''

#
# Install mdbook and other required tools.
#
install: $(MDBOOK_CMD) $(ADMONISH_CMD) $(LINKCHECK_CMD)

#
# Ensure that the tools directory exists.
#
$(TOOLS_DIR):
	mkdir -p $(TOOLS_DIR)

#
# Ensure that mdbook is installed.
#
$(MDBOOK_CMD): | $(TOOLS_DIR)
	curl -sSL $(MDBOOK_TGZ) | tar -xz --directory=$(TOOLS_DIR)

#
# Ensure that mdbook-admonish is installed.
#
$(ADMONISH_CMD): | $(TOOLS_DIR)
	curl -sSL $(ADMONISH_TGZ) | tar -xz --directory=$(TOOLS_DIR)

#
# Ensure that mdbook-linkcheck is installed.
#
$(LINKCHECK_CMD): | $(TOOLS_DIR)
	curl -sSL $(LINKCHECK_ZIP) -o linkcheck.zip
	unzip -d $(TOOLS_DIR) -o -q linkcheck.zip
	chmod u+x "$(TOOLS_DIR)/mdbook-linkcheck"
	rm linkcheck.zip

#
# Identify targets that are not file names.
#
.PHONY: help install



# The URLs from which each tool can be downloaded.
MDBOOK_TGZ := "https://github.com/rust-lang/mdBook/releases/download/v$(MDBOOK_VERSION)/mdbook-v$(MDBOOK_VERSION)-x86_64-unknown-linux-gnu.tar.gz"
ADMONISH_TGZ := "https://github.com/tommilligan/mdbook-admonish/releases/download/v$(ADMONISH_VERSION)/mdbook-admonish-v$(ADMONISH_VERSION)-x86_64-unknown-linux-gnu.tar.gz"
LINKCHECK_ZIP := "https://github.com/Michael-F-Bryan/mdbook-linkcheck/releases/download/v$(LINKCHECK_VERSION)/mdbook-linkcheck.x86_64-unknown-linux-gnu.zip"
