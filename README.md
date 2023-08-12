# ZJ CMake Tools

[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects.

- The **root level** `CMakeLists.txt` file template can be found in [templates/rool-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in)
- A **library level** `CMakeLists.txt` template can be found in [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in)
- The **install component** `xxx-config.cmake.in` template can be found in [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in)
  - in `cmake/installation/zj_install_helpers.cmake`, the install function will look for client package's `cmake.in` file at `${CMAKE_CURRENT_SOURCE_DIR}/cmake-in/${PROJECT_NAME}-config.cmake.in`
  - this way, client project doesn't have to put anything into this package's directory

See also:

- [ZJ C++ Tools](https://github.com/zongyaojin/zj-base) as an example for how to setup a modularized C++ project with this package.
