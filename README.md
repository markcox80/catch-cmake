This project provides a Makefile for installing
[Catch](https://github.com/philsquared/Catch) and a CMake script which
introduces a ```catch``` target.

## Installation

```sh
$ git submodule init
$ git submodule update
$ make prefix=/tmp/somewhere install
```

## How to use it in CMake

```CMake
find_package(catch REQUIRED)

add_executable(my-tests my-tests.cpp)
target_link_libraries(my-tests catch)

add_custom_target(tests
                  COMMAND my-tests
                  DEPENDS my-tests
                  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
```

```sh
$ cmake -DCMAKE_PREFIX_PATH=/tmp/somewhere ......
```