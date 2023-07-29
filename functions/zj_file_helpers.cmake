include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

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

function(zj_files_get_cpp sourceDirectoriesNoSlash sourceFiles)

    zj_files_get_by_pattern("${sourceDirectoriesNoSlash}" "*.cpp" output)
    set(${sourceFiles} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

function(zj_files_get_hpp sourceDirectoriesNoSlash sourceFiles)

    zj_files_get_by_pattern("${sourceDirectoriesNoSlash}" "*.hpp" output)
    set(${sourceFiles} ${output} PARENT_SCOPE)

endfunction()
