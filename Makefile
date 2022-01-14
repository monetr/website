SITE_DIRECTORIES=$(PWD)/layouts $(PWD)/static
SITE_FILES=$(foreach DIRECTORY,$(SITE_DIRECTORIES),$(shell find $(DIRECTORY) -type f))

PUBLIC_DIR=$(PWD)/public
PUBLIC_FILE_NAMES=index.html index.xml logo.png robots.txt sitemap.xml
PUBLIC_FILES=$(foreach FILE_NAME,$(PUBLIC_FILE_NAMES),$(PUBLIC_DIR)/$(FILE_NAME))

HUGO=$(shell which hugo)

$(PUBLIC_FILES) &: $(SITE_FILES)
	$(HUGO) --minify

build: $(PUBLIC_FILES)
