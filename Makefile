REMOTEUSER ?= clyde
HOST ?= okeeffe.stat.duke.edu
DIR ?= /web/isds/docs/courses/Fall17/sta721
REMOTE ?= $(REMOTEUSER)@$(HOST):$(DIR)

.PHONY: clean
clean:
	rm -rf public/*

404:
	cp .htaccess public/.htaccess

push: 404
	rsync -azv --delete  public/* $(REMOTE)

unbind:
	lsof -wni tcp:4000

serve:
	hugo server --watch


