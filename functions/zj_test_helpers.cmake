include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/zj-cmake/functions/zj_variable_helpers.cmake)

# ######################################################################################################################

# * zj_test_setup: Setup unit tests with GoogleTest
#
# * \arg[in] testFilesAndFoldersRelative | A set of tests either in a single cpp file or in a folder withou its own
#   CMakeList.txt file; if the test has to link against more than just GTest::GTest GTest::Main, they have to set up
#   their own CMakeList.txt for finding and linking to their case-specific libraries
function(zj_test_setup testFilesAndFoldersRelative)

    include(CTest)
    find_package(GTest REQUIRED)

    zj_variable_prune(testFilesAndFoldersRelative)
    foreach(zjTest IN LISTS testFilesAndFoldersRelative)

        # Get the full path for the file or directory
        set(testCaseFullPath ${CMAKE_SOURCE_DIR}/tests/${zjTest})

        if(EXISTS ${testCaseFullPath} AND NOT IS_DIRECTORY ${testCaseFullPath})
            # These single file tests cannot link to library other than the package and GTest; otherwise, put the test
            # in a folder and use a CMakeLists.txt file there to add custom options
            add_executable(${zjTest} ${testCaseFullPath})

            # Since the combined library is created by the install function, it can be used to link all libraries
            target_link_libraries(${zjTest} PUBLIC ${PROJECT_NAME}::${PROJECT_NAME} GTest::GTest GTest::Main)
            # Set runtime output directory
            set_target_properties(${zjTest} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/tests)
            # Specify the command to execute for running the test
            add_test(NAME ${zjTest} COMMAND ${CMAKE_BINARY_DIR}/tests/${zjTest})
        elseif(IS_DIRECTORY ${testCaseFullPath})
            # If it's a folder, add it as a subfolder so the custom CMake file configures the test
            add_subdirectory(${testCaseFullPath})
        else()
            # Otherwisre, report fatal error
            message(FATAL_ERROR "Test case input is neither a directory nor a file")
        endif()

    endforeach()

endfunction()
