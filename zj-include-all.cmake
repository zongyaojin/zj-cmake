include_guard(GLOBAL)

# ######################################################################################################################

include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-colors.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-compiler-options.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-compile-definitions.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-find-settings.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/definitions/ZJ-code-coverage.cmake)

include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_file_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_path_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_target_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_system_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_git_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/functions/zj_test_helpers.cmake)

include(${CMAKE_SOURCE_DIR}/cmake/installation/zj_install_helpers.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/utilities/CCache.cmake)
