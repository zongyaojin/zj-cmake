include_guard(GLOBAL)

# ######################################################################################################################

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

function(zj_system_ubuntu_2004 output)
    zj_system_ubuntu("Ubuntu 20.04" res)
    set(${output} ${res} PARENT_SCOPE)
endfunction()

# ######################################################################################################################

function(zj_system_ubuntu_2204 output)
    zj_system_ubuntu("Ubuntu 22.04" res)
    set(${output} ${res} PARENT_SCOPE)
endfunction()
