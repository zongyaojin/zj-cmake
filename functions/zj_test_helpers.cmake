include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

function(zj_test_setup filesAndFolders)

    include(CTest)
    find_package(GTest REQUIRED)
    
    zj_variable_prune(filesAndFolders)
    foreach(zjTest IN LISTS zjAllTests)
        set(testFile ${CMAKE_SOURCE_DIR}/tests/${zjTest}.cpp)
        set(testFolder ${CMAKE_SOURCE_DIR}/tests/${zjTest})

        if(EXISTS ${testFile})
            add_executable(${zjTest} ${testFile})

            # Since the combined library is created by the install function, it can be used to link all libraries
            target_link_libraries(${zjTest} PUBLIC ${PROJECT_NAME}::${PROJECT_NAME} GTest::GTest GTest::Main)
            # Set runtime output directory
            set_target_properties(${zjTest} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/tests)
            # Specify the command to execute for running the test
            add_test(NAME ${zjTest} COMMAND ${CMAKE_BINARY_DIR}/tests/${zjTest})
        endif()

        if(IS_DIRECTORY ${testFolder})
            add_subdirectory(${testFolder})
        endif()

    endforeach()

endfunction()
