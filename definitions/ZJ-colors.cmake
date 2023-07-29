include_guard(GLOBAL)

# ######################################################################################################################

# cmake-format: off
if(NOT WIN32)
    string(ASCII 27 Esc)
    set(zjColorReset  "${Esc}[m")
    set(zjBold        "${Esc}[1m")
    set(zjRed         "${Esc}[31m")
    set(zjGreen       "${Esc}[32m")
    set(zjYellow      "${Esc}[33m")
    set(zjBlue        "${Esc}[34m")
    set(zjMagenta     "${Esc}[35m")
    set(zjCyan        "${Esc}[36m")
    set(zjWhite       "${Esc}[37m")
    set(zjBoldRed     "${Esc}[1;31m")
    set(zjBoldGreen   "${Esc}[1;32m")
    set(zjBoldYellow  "${Esc}[1;33m")
    set(zjBoldBlue    "${Esc}[1;34m")
    set(zjBoldMagenta "${Esc}[1;35m")
    set(zjBoldCyan    "${Esc}[1;36m")
    set(zjBoldWhite   "${Esc}[1;37m")
endif()
# cmake-format: on
