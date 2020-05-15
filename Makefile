PUBLISH_DIR=docs

all: clean build

clean:
	@echo "Cleaning..."
	rm -rf "$(PUBLISH_DIR)"

server:
	@echo "Starting local dev webserver..."
	hugo server -D

build:
	@echo "Generating site..."
	hugo --gc --minify -d "$(PUBLISH_DIR)"
