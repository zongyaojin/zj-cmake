# ZJ CMake Tools

[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects.

- The **root level** `CMakeLists.txt` file template can be found in [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in)
- The **library level** `CMakeLists.txt` template can be found in [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in)
- The **install component** `xxx-config.cmake.in` template can be found in [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in)

See also:

- [zj-base](https://github.com/zongyaojin/zj-base) as an example for how to create a modularized C++ project with this package.
