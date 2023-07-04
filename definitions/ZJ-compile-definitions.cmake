include_guard(GLOBAL)

# ######################################################################################################################
# These definitions are only visible to targets build in this CMake project, they won't be automatically visible to
# client targets that link to libraries built in this project; to make them visible to client targets (usually
# unnecessary), one can use: `target_compile_definitions(myLibrary PUBLIC __MY_VAR__)`
# ######################################################################################################################

add_compile_definitions(__ZJ_PKG_SOURCE_PATH__="${CMAKE_SOURCE_DIR}/")
add_compile_definitions(__ZJ_PKG_BUILD_PATH__="${CMAKE_BINARY_DIR}/")

# Variable CMAKE_INSTALL_BINDIR is not a built-in variable in CMake, but it is defined in the GNUInstallDirs module,
# which provides many variables you can use to reference common destination directories in a platform-independent way.
include(GNUInstallDirs)
add_compile_definitions(__ZJ_PKG_INSTALL_BIN_PATH__="${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME}/")