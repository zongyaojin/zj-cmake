# zj-cmake

[![GitHub license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/zongyaojin/zj-cmake/blob/main/LICENSE)

---

Refer to:

- [templates/1-rool-level-CMakeLists.txt](./templates/1-root-level-CMakeLists.txt.in) for the *root-level* `CMakeLists.txt` file
- [templates/2-lib-level-CMakeLists.txt](./templates/2-lib-level-CMakeLists.txt.in) for a *library-level* `CMakeLists.txt` file
- [templates/project-name-config.cmake/in](./templates/project-name-config.cmake.in) for the *install-needed* `xxx-config.cmake.in` file
  - zj-cmake ignores `installation/*.cmake.in`, so it doesn't store the `cmake.in` file for client packages;
  - in `cmake/installation/zj_install_helpers.cmake`, it looks for client package's `cmake.in` file at:
    - `${CMAKE_CURRENT_SOURCE_DIR}/cmake-in/${PROJECT_NAME}-config.cmake.in`
    - client package should put their `cmake.in`` file there so zj-cmake can use it to install

---

Refer to:

- [zj-cmake-template](https://github.com/zongyaojin/zj-cmake-template) for the usage of this package in a minimal Cpp/CMake project
