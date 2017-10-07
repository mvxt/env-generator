##############################
# Makefile for env-generator #
##############################
.DEFAULT: setup

.PHONY: setup
setup:
	sh install_packages.sh
