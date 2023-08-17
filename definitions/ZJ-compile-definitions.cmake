include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/zj-cmake/functions/zj_git_helpers.cmake)

# ######################################################################################################################
# These definitions are only visible to targets build in this CMake project, they won't be automatically visible to
# client targets that link to libraries built in this project; to make them visible to client targets (usually
# unnecessary), one can use: `target_compile_definitions(myLibrary PUBLIC __MY_VAR__)`
# ######################################################################################################################

add_compile_definitions(__ZJ_PKG_NAME__="${PROJECT_NAME}")
add_compile_definitions(__ZJ_PKG_SOURCE_PATH_NO_SLASH__="${CMAKE_SOURCE_DIR}")
add_compile_definitions(__ZJ_PKG_BUILD_PATH_NO_SLASH__="${CMAKE_BINARY_DIR}")

# Variable CMAKE_INSTALL_BINDIR is not a built-in variable in CMake, but it is defined in the GNUInstallDirs module,
# which provides many variables you can use to reference common destination directories in a platform-independent way.
include(GNUInstallDirs)
add_compile_definitions(
    __ZJ_PKG_INSTALL_BIN_PATH_NO_SLASH__="${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME}"
)

# Git and build info
zj_git_get_info(
    zjGitBranch
    zjGitCommitHash
    zjGitCommitTime
    zjGitTag
    zjCmakeCacheTime
)

# Add definitions
add_compile_definitions(__ZJ_PKG_GIT_BRANCH__="${zjGitBranch}")
add_compile_definitions(__ZJ_PKG_GIT_COMMIT_HASH__="${zjGitCommitHash}")
add_compile_definitions(__ZJ_PKG_GIT_COMMIT_TIME__="${zjGitCommitTime}")
add_compile_definitions(__ZJ_PKG_GIT_TAG__="${zjGitTag}")
add_compile_definitions(__ZJ_PKG_GIT_CMAKE_CACHE_TIME__="${zjCmakeCacheTime}")
