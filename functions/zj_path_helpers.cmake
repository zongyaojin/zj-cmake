include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

# * zj_paths_get_relative: Get from absolute directires their directories relativet to the package
#
# * \arg[in] absoluteDirectories | Absolute directories
# * \arg[out] relativeDirectories | Directories relative to the package
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

# * zj_paths_get_by_name_no_slash: Get paths by concatenating a list of root directories with a extension directory
#
# * \arg[in] rootDirectories | Root directories
# * \arg[in] extensionDirectory | Extension directory
# * \arg[out] concatenatedDirectories | Concatenated directories
function(
    zj_paths_get_by_name_no_slash
    rootDirectories
    extensionDirectory
    concatenatedDirectories
)

    foreach(rootDir IN LISTS rootDirectories)
        list(APPEND totalDirs ${rootDir}/${extensionDirectory})
    endforeach()

    zj_variable_prune(totalDirs)
    set(${concatenatedDirectories} ${totalDirs} PARENT_SCOPE)

    # ##################################################################################################################

    message(DEBUG "[zj_paths_get_by_name_no_slash | ${extensionDirectory}]")
    foreach(item IN LISTS totalDirs)
        message(DEBUG "---- ${item}")
    endforeach()
    message(DEBUG "")

endfunction()

# ######################################################################################################################

# * zj_paths_get_inc_no_slash: Get paths by concatenating a list of root directories with `inc`
#
# * \arg[in] rootDirectories | Root directories
# * \arg[out] incDirecotires | Concatenated directories
function(zj_paths_get_inc_no_slash rootDirectories incDirecotires)

    zj_paths_get_by_name_no_slash("${rootDirectories}" "inc" output)
    set(${incDirecotires} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

# * zj_paths_get_src_no_slash: Get paths by concatenating a list of root directories with `src`
#
# * \arg[in] rootDirectories | Root directories
# * \arg[out] srcDirecotires | Concatenated directories
function(zj_paths_get_src_no_slash rootDirectories srcDirecotires)

    zj_paths_get_by_name_no_slash("${rootDirectories}" "src" output)
    set(${srcDirecotires} ${output} PARENT_SCOPE)

endfunction()

# ######################################################################################################################

# * zj_paths_add_slash: Add a trailing slash to directories
#
# * \arg[in] directories | Directories
# * \arg[out] directoriesWithSlash | Directories with a trailing slash
function(zj_paths_add_slash directories directoriesWithSlash)

    foreach(dir IN LISTS directories)
        list(APPEND dirsWithSlash ${dir}/)
    endforeach()

    set(${directoriesWithSlash} ${dirsWithSlash} PARENT_SCOPE)

endfunction()
