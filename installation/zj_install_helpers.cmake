include_guard(GLOBAL)

# ######################################################################################################################

function(
    zj_combine_install_library
    pkgNamespace
    libTargets
    relIncDirsSlash
    headerPatterns
    exampleExecutables
    dataFolders)

    add_library(${PROJECT_NAME} INTERFACE)
    target_link_libraries(${PROJECT_NAME} INTERFACE ${libTargets})

    add_library(${pkgNamespace}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

    # ##################################################################################################################

    include(GNUInstallDirs)
    install(
        TARGETS ${PROJECT_NAME} ${libTargets} ${exampleExecutables}
        EXPORT "${PROJECT_NAME}-targets"
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        INCLUDES
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    # Adding slash after the directory will create a flat installation: https://stackoverflow.com/a/23766303
    foreach(relDirWithSlash IN LISTS relIncDirsSlash)
        foreach(hp IN LISTS headerPatterns)
            install(
                DIRECTORY ${relDirWithSlash}
                DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}
                FILES_MATCHING
                PATTERN ${hp})
        endforeach()
    endforeach()

    include(CMakePackageConfigHelpers)
    write_basic_package_version_file("${PROJECT_NAME}-config-version.cmake" VERSION ${PACKAGE_VERSION}
                                     COMPATIBILITY AnyNewerVersion)

    install(
        EXPORT "${PROJECT_NAME}-targets"
        FILE "${PROJECT_NAME}-targets.cmake"
        NAMESPACE "${pkgNamespace}::"
        DESTINATION "lib/cmake/${PROJECT_NAME}")

    configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/installation/${PROJECT_NAME}-config.cmake.in"
                   "${PROJECT_NAME}-config.cmake" @ONLY)

    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
                  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake"
            DESTINATION "lib/cmake/${PROJECT_NAME}")

    # For other folders, copy and install them to build and install directories
    foreach(folder IN LISTS dataFolders)
        install(DIRECTORY ${CMAKE_SOURCE_DIR}/${folder} DESTINATION ${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME})
        file(COPY ${CMAKE_SOURCE_DIR}/${folder} DESTINATION ${CMAKE_BINARY_DIR})
    endforeach()

    # ##################################################################################################################

    message(DEBUG "[zj_combine_install_library | pkg namespace: ${pkgNamespace}]")

    message(DEBUG "---- [libTargets]")
    foreach(item IN LISTS libTargets)
        message(DEBUG "-------- ${item}")
    endforeach()

    message(DEBUG "---- [relIncDirsSlash]")
    foreach(item IN LISTS relIncDirsSlash)
        message(DEBUG "-------- ${item}")
    endforeach()

    message(DEBUG "---- [headerPatterns]")
    foreach(item IN LISTS headerPatterns)
        message(DEBUG "-------- ${item}")
    endforeach()

    message(DEBUG "---- [exampleExecutables]")
    foreach(item IN LISTS exampleExecutables)
        message(DEBUG "-------- ${item}")
    endforeach()

    message(DEBUG "---- [dataFolders]")
    foreach(item IN LISTS dataFolders)
        message(DEBUG "-------- ${item}")
    endforeach()

    message(DEBUG "")

endfunction()
