include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-colors.cmake)

# ######################################################################################################################

set(zjMinCompilerVersion "11.3")

if(CMAKE_C_COMPILER_VERSION VERSION_LESS ${zjMinCompilerVersion})
    message(FATAL_ERROR "C compiler version ${CMAKE_C_COMPILER_VERSION} less than required ${zjMinCompilerVersion}")
endif()

if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS ${zjMinCompilerVersion})
    message(FATAL_ERROR "C++ compiler version ${CMAKE_CXX_COMPILER_VERSION} less than required ${zjMinCompilerVersion}")
endif()

# ######################################################################################################################

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
