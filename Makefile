PUBLISH_DIR=docs

all: clean build

clean:
	@echo 'Cleaning...'
	rm -rf "$(PUBLISH_DIR)"

server:
	@echo 'Starting local dev webserver...'
	hugo server -D

build:
	@echo 'Generating site...'
	hugo --gc --minify -d "$(PUBLISH_DIR)"

deploy: clean build
	@echo 'Comminting changes site...'
	git add "$(PUBLISH_DIR)"
	git commit -m 'Regenerating the site'
	@echo 'Pushing changes site...'
	git push

update:
	@echo 'Updating submodules...'
	git submodule update --recursive --remote
