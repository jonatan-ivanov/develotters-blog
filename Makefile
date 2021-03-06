PUBLISH_DIR=docs

all: clean build

clean:
	@echo 'Cleaning...'
	find "$(PUBLISH_DIR)" ! -name 'CNAME' -delete

server:
	@echo 'Starting local dev webserver...'
	hugo server -D

build:
	@echo 'Generating...'
	hugo --gc --minify -d "$(PUBLISH_DIR)"

gitcheck:
	git diff-index --quiet HEAD

deploy: gitcheck clean build
	@echo 'Commiting changes...'
	git add "$(PUBLISH_DIR)"
	git commit -m 'Regenerating the site'
	@echo 'Pushing changes...'
	git push
	@echo 'Giving some time to GH to start the deployment...'
	sleep 5
	open https://github.com/jonatan-ivanov/develotters-blog/deployments

update:
	@echo 'Updating submodules...'
	git submodule update --recursive --remote
