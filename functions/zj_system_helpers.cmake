include_guard(GLOBAL)

# ######################################################################################################################

# * zj_system_ubuntu: Check if the system is a specific distro of Linux
#
# * \arg[in] distroName | Distribution name
# * \arg[out] output | True of false
function(zj_system_ubuntu distroName output)
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        execute_process(COMMAND cat /etc/os-release RESULT_VARIABLE result OUTPUT_VARIABLE osInfo)
        if(NOT result AND osInfo MATCHES "${distroName}")
            set(${output} TRUE PARENT_SCOPE)
        else()
            set(${output} FALSE PARENT_SCOPE)
        endif()
    else()
        set(${output} FALSE PARENT_SCOPE)
    endif()
endfunction()

# ######################################################################################################################

# * zj_system_ubuntu_2004: Check if the system is Ubuntu 20.04
#
# * \arg[out] output | True of false
function(zj_system_ubuntu_2004 output)
    zj_system_ubuntu("Ubuntu 20.04" result)
    set(${output} ${result} PARENT_SCOPE)
endfunction()

# ######################################################################################################################

# * zj_system_ubuntu_2204: Check if the system is Ubuntu 22.04
#
# * \arg[out] output | True of false
function(zj_system_ubuntu_2204 output)
    zj_system_ubuntu("Ubuntu 22.04" result)
    set(${output} ${result} PARENT_SCOPE)
endfunction()
