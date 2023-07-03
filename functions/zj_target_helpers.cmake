include_guard(GLOBAL)

# ######################################################################################################################

function(zj_target_include_directories_genex targetName relativeIncludeDirectories)

    # * Note that the following is NOT correct: $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/${libRelIncDirs}>
    # * Because ${CMAKE_SOURCE_DIR}/${libRelIncDirs} will just concatenate the values of CMAKE_SOURCE_DIR and
    #   libRelIncDirs together, you'll end up with something like
    #   "/path/to/source/include_dir1;include_dir2;include_dir3", which is not what you want.
    # * Adding the $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}> is necessary; otherwise, the headers will be
    #   installed, but the config file wont include their path
    # * You cannot first pack all generator expressions to a list, then apply it as a single variable, since unwrapping
    #   will make them absolute paths again, and will not be able to use for installation
    foreach(relIncDir IN LISTS relativeIncludeDirectories)
        target_include_directories(${libName} PUBLIC $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/${relIncDir}>
                                                     $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
    endforeach()

endfunction()
