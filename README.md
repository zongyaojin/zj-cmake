# ZJ CMake Tools

[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects. 

It is assumed that:

- this package is located in the following path in a client project `[client_project_root/cmake/zj-cmake/]`, for some paths and script inclusion are defined based on this assumption; and
- the client project's `project_name-config.cmake.in` file is located in `[client_project_root/cmake/in-files/]`, for the `installation/zj_install_helpers.cmake` will look for the config-in file from this location.

For the usage of this package:

- The **root level** `CMakeLists.txt` file template can be found in [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in)
- A **library level** `CMakeLists.txt` template can be found in [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in)
- The **install component** `xxx-config.cmake.in` template can be found in [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in)

See also:

- [zj-base](https://github.com/zongyaojin/zj-base) as an example for how to create a modularized C++ project with this package.
