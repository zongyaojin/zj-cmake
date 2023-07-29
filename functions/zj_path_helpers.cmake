include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

function(zj_paths_get_relative absoluteDirectories relativeDirectories)

    foreach(absDir IN LISTS absoluteDirectories)
        file(
            RELATIVE_PATH
            relDir
            ${CMAKE_SOURCE_DIR}
            ${absDir}
        )
        list(APPEND relativeDirs ${relDir})
    endforeach()

    zj_variable_prune(relativeDirs)
    set(${relativeDirectories} ${relativeDirs} PARENT_SCOPE)

    # ##################################################################################################################

    message(DEBUG "[zj_paths_get_relative]")
    foreach(item IN LISTS relativeDirs)
        message(DEBUG "---- ${item}")
    endforeach()
    message(DEBUG "")

endfunction()

# ######################################################################################################################

function(
    zj_paths_get_by_name_no_slash
    rootDirectories
    extensionDirectories
    totalDirectories
)

    foreach(rootDir IN LISTS rootDirectories)
        list(APPEND totalDirs ${rootDir}/${extensionDirectories})
    endforeach()

    zj_variable_prune(totalDirs)
    set(${totalDirectories} ${totalDirs} PARENT_SCOPE)

    # ##################################################################################################################

    message(DEBUG "[zj_paths_get_by_name_no_slash | ${extensionDirectories}]")
    foreach(item IN LISTS totalDirs)
        message(DEBUG "---- ${item}")
    endforeach()
    message(DEBUG "")

endfunction()

# ######################################################################################################################

function(zj_paths_get_inc_no_slash rootDirectories incDirecotires)

    zj_paths_get_by_name_no_slash("${rootDirectories}" "inc" output)
    set(${incDirecotires} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

function(zj_paths_get_inc_slash rootDirectories incDirecotires)

    zj_paths_get_by_name_no_slash("${rootDirectories}" "inc/" output)
    set(${incDirecotires} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

function(zj_paths_get_src_no_slash rootDirectories srcDirecotires)

    zj_paths_get_by_name_no_slash("${rootDirectories}" "src" output)
    set(${srcDirecotires} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

function(zj_paths_add_slash directories directoriesWithSlash)

    foreach(dir IN LISTS directories)
        list(APPEND dirsWithSlash ${dir}/)
    endforeach()

    set(${directoriesWithSlash} ${dirsWithSlash} PARENT_SCOPE)

endfunction()
