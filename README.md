# ZJ CMake

[![CMake Format Lint](https://github.com/zongyaojin/zj-cmake/actions/workflows/cmake-format-lint.yml/badge.svg)](https://github.com/zongyaojin/zj-cmake/actions/workflows/cmake-format-lint.yml)
[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects. It assumes a client `$client_project` to have the following folder structure:

```text
$client_project/
    |-- cmake/
        |-- in-files/   (* cmake config-in file path)
        |-- zj-cmake/   (* this repository as a submodule)
    |-- examples/       (* examples that build executables)
    |-- libs/           (* libraries)
    |-- tests/          (* unit tests)
```

For details:

- See [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in) for the **root level** `CMakeLists.txt` template.
- See [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in) for the **library level** `CMakeLists.txt` template.
- See [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in) for the **install component** `${PACKAGE_NAME}-config.cmake.in` template.
