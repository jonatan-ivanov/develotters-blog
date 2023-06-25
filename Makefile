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

link-check:
	# npm install -g markdown-link-check
	# echo 'http://localhost:8080' | markdown-link-check --config .github/workflows/markdown-link-check.json
	@echo 'Checking links...'
	find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check --config .github/workflows/markdown-link-check.json --quiet
