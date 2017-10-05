
# To use this completion script, it must be discoverable by bash
# Add the following line to ~/.bash_it/custom/custom.completion.bash:
# source ~/workspace/bash-completions/_fly_login.bash

_fly_login()
{
    local cur_word prev_word type_list

    # COMP_WORDS is an array of words in the current command line.
    # COMP_CWORD is the index of the current word (the one the cursor is
    # in). So COMP_WORDS[COMP_CWORD] is the current word; we also record
    # the previous word here, although this specific script doesn't
    # use it yet.
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    # Ask pss to generate a list of types it supports
    completion_list=`fly_login --get-completions`

    # Only perform completion if the current word starts with a dash ('-'),
    # meaning that the user is trying to complete an option.
    # if [[ ${cur_word} == -* ]] ; then
    #     # COMPREPLY is the array of possible completions, generated with
    #     # the compgen builtin.
    # else
    #     #COMPREPLY=()
    # fi

    # Show completions only if this is the first argument
    if [[ ${prev_word} == "fly_login" ]] ; then
        # COMPREPLY is the array of possible completions, generated with
        # the compgen builtin.
        COMPREPLY=( $(compgen -W "${completion_list}" -- ${cur_word}) )
    else
        COMPREPLY=()
    fi

    return 0
}

# Register this completion function for the appropriate command(s)
complete -F _fly_login fly_login
