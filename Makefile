# This is not a config file, it is 
# just for handle the scripts automation 
# to copy from or to the current host system.

.DEFAULT_GOAL := help
help:
	@cat Makefile 

install:
	./scripts/install.sh

update-from-os:
	./scripts/update-from-os.sh

update-to-os:
	./scripts/update-to-os.sh
