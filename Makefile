all: clean build

clean:
	@echo 'Cleaning...'
	if [ -d 'public' ]; then rm -r 'public'; fi

server:
	@echo 'Starting local dev webserver...'
	hugo server --buildDrafts

build:
	@echo 'Generating...'
	hugo --gc --minify

update:
	@echo 'Updating submodules...'
	git submodule update --recursive --remote
