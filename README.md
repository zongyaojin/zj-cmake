# ZJ CMake

[![CMake Format Lint](https://github.com/zongyaojin/zj-cmake/actions/workflows/cmake-format-lint.yml/badge.svg)](https://github.com/zongyaojin/zj-cmake/actions/workflows/cmake-format-lint.yml)
[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

This package provides some basic CMake tools for building and installing modularized C++ projects. It assumes a `$client_project` to have the following folder structure:

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

- see [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in) for the **root level** `CMakeLists.txt` template;
- see [templates/lib-level-CMakeLists.txt](./templates/lib-level-CMakeLists.txt.in) for the **library level** `CMakeLists.txt` template;
- see [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in) for the **install component** `${PACKAGE_NAME}-config.cmake.in` template.

Script style guide:

- for variables, use `fooBar`;
- for functions, use `foo_bar`;
- for compile definitions to the client C++ project, use `__ZJ_PKG_FOO_BAR__`;
- for CMake input arguments, use `ZJ_FOO_BAR`.

Filename style guide:

- for files that define functions, use `zj_foo_bar.cmake`;
- for files that set variables, use `ZJ-foo-bar.cmake`;
- `zj-include-all.cmake` is reserved to include all utility files, and is used by the client projects in their root `CMakeLists.txt` file based on the template [templates/root-level-CMakeLists.txt](./templates/root-level-CMakeLists.txt.in).
