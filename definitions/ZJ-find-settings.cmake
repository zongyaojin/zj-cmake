include_guard(GLOBAL)

include(${CMAKE_SOURCE_DIR}/cmake/zj-cmake/definitions/ZJ-colors.cmake)

# ######################################################################################################################

# Pack find package hints into a single variable
set(zjFindPkgHints
    ${CMAKE_PREFIX_PATH}/lib
    ${CMAKE_PREFIX_PATH}/lib64
    ${CMAKE_PREFIX_PATH}/lib64/cmake
    ${CMAKE_PREFIX_PATH}/share
)
