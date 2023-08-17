include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/zj-cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

# * zj_files_get_by_pattern : Get files by pattern from directories
#
# * \arg[in] sourceDirectoriesNoSlash | Source directories without the trailing slash
# * \arg[in] pattern | Pattern used to extract files
# * \arg[out] sourceFiles | Source files extracted
function(
    zj_files_get_by_pattern
    sourceDirectoriesNoSlash
    pattern
    sourceFiles
)

    foreach(srcDirNoSlash IN LISTS sourceDirectoriesNoSlash)
        file(GLOB srcDirCppFiles ${srcDirNoSlash}/${pattern})
        list(APPEND srcFiles ${srcDirCppFiles})
    endforeach()

    set(${sourceFiles} ${srcFiles} PARENT_SCOPE)

    # ##################################################################################################################

    message(DEBUG "[zj_files_get_by_pattern | ${pattern}]")
    foreach(item IN LISTS srcFiles)
        message(DEBUG "---- ${item}")
    endforeach()
    message(DEBUG "")

endfunction()

# ######################################################################################################################

# * zj_files_get_cpp : Get *.cpp files by pattern from directories
#
# * \arg[in] sourceDirectoriesNoSlash | Source directories without the trailing slash
# * \arg[out] sourceFiles | Source files extracted
function(zj_files_get_cpp sourceDirectoriesNoSlash sourceFiles)

    zj_files_get_by_pattern("${sourceDirectoriesNoSlash}" "*.cpp" output)
    set(${sourceFiles} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

# * zj_files_get_hpp : Get *.hpp files by pattern from directories
#
# * \arg[in] sourceDirectoriesNoSlash | Source directories without the trailing slash
# * \arg[out] sourceFiles | Source files extracted
function(zj_files_get_hpp sourceDirectoriesNoSlash sourceFiles)

    zj_files_get_by_pattern("${sourceDirectoriesNoSlash}" "*.hpp" output)
    set(${sourceFiles} ${output} PARENT_SCOPE)

endfunction()
