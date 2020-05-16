PUBLISH_DIR=docs

all: clean build

clean:
	@echo 'Cleaning...'
	find "$(PUBLISH_DIR)" ! -name 'CNAME' -delete

server:
	@echo 'Starting local dev webserver...'
	hugo server -D

build:
	@echo 'Generating site...'
	hugo --gc --minify -d "$(PUBLISH_DIR)"

gitcheck:
	$(if "$(shell git status -s)", @echo 'Please commit your changes first'; exit 1)

deploy: gitcheck clean build
	@echo 'Commiting changes...'
	git add "$(PUBLISH_DIR)"
	git commit -m 'Regenerating the site'
	@echo 'Pushing changes site...'
	git push

update:
	@echo 'Updating submodules...'
	git submodule update --recursive --remote
