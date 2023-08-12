include_guard(GLOBAL)

# ######################################################################################################################

# * zj_git_get_info : Get git information
#
# * \arg[out] branch | Branch
# * \arg[out] commitHash | Commit hash
# * \arg[out] commitTime | Commit time
# * \arg[out] tag | Hard tag
# * \arg[out] cmakeCacheTime | CMake cache creation time (when running `cmake ..`)
function(
    zj_git_get_info
    branch
    commitHash
    commitTime
    tag
    cmakeCacheTime
)

    if(NOT EXISTS "${CMAKE_SOURCE_DIR}/.git")
        return()
    endif()

    find_package(Git REQUIRED)

    # Retrieve the branch name
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE zjGitBranch
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    # Retrieve the commit hash
    execute_process(
        COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE zjGitCommitHash
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    # Retrieve the commit time
    execute_process(
        COMMAND ${GIT_EXECUTABLE} log -1 --format=%cd --date=iso
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE zjGitCommitTime
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    # * Retrieve the commit message
    # * --always: show uniquely abbreviated commit object as fallback
    # * https://git-scm.com/docs/git-describe
    execute_process(
        COMMAND ${GIT_EXECUTABLE} describe --tags --always
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE zjGitTag
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )

    # Retrieve the CMake cache creation time
    string(TIMESTAMP zjCMakeCacheCreationTime)

    set(${branch} ${zjGitBranch} PARENT_SCOPE)
    set(${commitHash} ${zjGitCommitHash} PARENT_SCOPE)
    set(${commitTime} ${zjGitCommitTime} PARENT_SCOPE)
    set(${tag} ${zjGitTag} PARENT_SCOPE)
    set(${cmakeCacheTime} ${zjCMakeCacheCreationTime} PARENT_SCOPE)

endfunction()
