include_guard(GLOBAL)

# ######################################################################################################################

add_compile_definitions(__ZJ_PKG_SOURCE_PATH__="${CMAKE_SOURCE_DIR}/")
add_compile_definitions(__ZJ_PKG_BUILD_PATH__="${CMAKE_BINARY_DIR}/")

# Variable CMAKE_INSTALL_BINDIR is not a built-in variable in CMake, but it is defined in the GNUInstallDirs module,
# which provides many variables you can use to reference common destination directories in a platform-independent way.
include(GNUInstallDirs)
add_compile_definitions(__ZJ_PKG_INSTALL_BIN_PATH__="${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME}/")
