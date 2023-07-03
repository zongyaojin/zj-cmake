include_guard(GLOBAL)

# No need to wrap the input variable name by "${theInputVariableName}", see below <variable indirection>
function(zj_variable_prune inOutVariable)

    # * The ${${inOutVariable}} syntax is known as <variable indirection>: https://stackoverflow.com/a/32631237
    # * Expression ${inOutVariable} gives you the name of the variable that was passed into the function.
    # * Expression ${${inOutVariable}} gives you the value of the variable whose name was passed into the function.
    # * This is necessary because you don't want to call zj_variable_prune("${myVar}"), since "${myVar}" is literally
    #   the whole value list such as "a;b;c;d", which will lose its variable name, so the modified value cannot be
    #   written to the original variable
    set(var "${${inOutVariable}}")

    # remove duplicates
    list(REMOVE_DUPLICATES var)
    # remove empty entires, by only including strings with one or more characters
    list(FILTER var INCLUDE REGEX ".+")

    # update the variable
    set(${inOutVariable} ${var} PARENT_SCOPE)

    # if an optional 2nd argument is presented, it will be print as a caller's indicator, together with the debug
    # information (ARGV0 is the 1st argument, ARGV1 is the 2nd, etc.)
    if(${ARGV1})
        message(DEBUG "[zj_variable_prune | ${ARGV1}]")
        foreach(item IN LISTS var)
            message(DEBUG "---- ${item}")
        endforeach()
        message(DEBUG "")
    endif()

endfunction()
