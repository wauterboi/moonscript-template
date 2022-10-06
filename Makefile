PACKAGE = moonscript-template
SRC_DIR = src/$(PACKAGE)
DIST_DIR = dist/$(PACKAGE)
DOCS_DIR = doc

SRC_FILES = $(wildcard $(SRC_DIR)/*.moon)
DIST_FILES = $(SRC_FILES:$(SRC_DIR)/%.moon=$(DIST_DIR))

all: mkdirs compile doc

mkdirs:
	mkdir -p $(SRC_DIR)
	mkdir -p $(DIST_DIR)
	mkdir -p $(DOCS_DIR)

compile: $(DIST_FILES)

$(DIST_DIR)/%.lua: $(SRC_DIR)/%.moon
	moonc -o $@ $<

.PHONY: doc
doc:
	ldoc $(SRC_DIR)

.PHONY: install
install:
	cp -r $(DIST_DIR) $(INST_LUADIR)/$(PACKAGE)
	cp -r $(DOCS_DIR) $(INST_PREFIX)

.PHONY: clean
clean:
	rm -rf $(DIST_DIR)
	rm -rf $(DOCS_DIR)
