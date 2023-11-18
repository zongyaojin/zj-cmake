# ZJ CMake

[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects.

- See [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in) for the **root level** `CMakeLists.txt` template.
- See [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in) for the **library level** `CMakeLists.txt` template.
- See [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in) for the **install component** `${PACKAGE_NAME}-config.cmake.in` template.

See also:

- [zj-base](https://github.com/zongyaojin/zj-base) as an example for how to create a modularized C++ project with this package.
