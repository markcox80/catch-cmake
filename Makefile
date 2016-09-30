prefix ?= /usr/local
destdir ?= /

makefile_path = $(abspath $(lastword $(MAKEFILE_LIST)))
source_path = $(shell dirname $(makefile_path))
catch_distribution = $(source_path)/catch
catch_cmake_config = $(source_path)/catch-config.cmake.in
share_path = $(prefix)/share/catch

all:

install: install-headers install-cmake

.PHONY: install-cmake
install-cmake:
	mkdir -p $(destdir)/$(share_path)
	m4 -DCATCH_INCLUDE_DIRECTORY=$(prefix)/include/catch $(catch_cmake_config) > $(destdir)/$(share_path)/catch-config.cmake

.PHONY: install-headers
install-headers:
	mkdir -p $(destdir)/$(prefix)/include/catch
	cp -rv $(catch_distribution)/include/* $(destdir)/$(prefix)/include/catch
