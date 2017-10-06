
# This is a generic bash completion script for commands with two layers of options.

# To use this completion script, it must be discoverable by bash
# Add the following line to ~/.bash_it/custom/custom.completion.bash:
# source ~/workspace/bash-completions/simple-completion.bash "my_script" "_my_script_completions"

# The completion script should expect two arguments: level, and prev_word
#   it should return a list of the options for completion
#   filename completion is not yet supported.
# TODO: accept filename completion

target_cmd=$1
get_completions_cmd=$2

echo "Setting layered completion for:" $target_cmd "     with:" $get_completions_cmd

_dolcompletion()
{
    local cur_word prev_word type_list

    # COMP_WORDS is an array of words in the current command line.
    # COMP_CWORD is the index of the current word.
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    # # Generate a list of completion options
    # completion_list=`$get_completions_cmd 1`
    #
    # # Only perform completion if the current word starts with a dash ('-'):
    # # if [[ ${cur_word} == -* ]] ; then
    # #     # COMPREPLY is the array of possible completions, generated with
    # #     # the compgen builtin.
    # # else
    # #     #COMPREPLY=()
    # # fi
    #
    # # Show completions only if this is the first argument
    # if [[ ${prev_word} == "$target_cmd" ]] ; then
    #     # COMPREPLY is the array of possible completions, generated with
    #     # the compgen builtin.
    #     COMPREPLY=( $(compgen -W "${completion_list}" -- ${cur_word}) )
    # else
    #     COMPREPLY=()
    # fi
    #
    # return 0

    # Generate a list of completion options depending on the level of argument
    completion_list=`$get_completions_cmd $COMP_CWORD $prev_word`
    COMPREPLY=( $(compgen -W "${completion_list}" -- ${cur_word}) )

    return 0 # not sure if this is important.
}

# Register this completion function for the appropriate command(s)
complete -F _dolcompletion $target_cmd
