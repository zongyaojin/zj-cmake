include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/zj-cmake/definitions/ZJ-colors.cmake)

# ######################################################################################################################

if(CMAKE_COMPILER_IS_GNUCXX AND ZJ_CODE_COVERAGE)
    message(${zjBoldCyan} "-- Using ZJ_CODE_COVERAGE" ${zjColorReset})

    # * https://discourse.cmake.org/t/guideline-for-code-coverage/167
    add_compile_options(-fprofile-arcs -ftest-coverage)

    # * See https://stackoverflow.com/a/6090147
    # * And https://cmake.org/cmake/help/latest/variable/CMAKE_EXE_LINKER_FLAGS.html
    # * Without this flag, all executables will have to be linked to library "gcov" manually; otherwise, with the above
    #   compiler options, they will look for something in the "gcov" library which they cannot find if not linked
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-arcs -ftest-coverage")
endif()
