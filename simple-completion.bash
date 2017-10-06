
# This is a generic bash completion script for commands with a fixed set of options.

# To use this completion script, it must be discoverable by bash
# Add the following line to ~/.bash_it/custom/custom.completion.bash:
# source ~/workspace/bash-completions/simple-completion.bash "my_script" "my_script --get-completions"

# if your script has an option to echo its completion options:
# source ~/workspace/bash-completions/simple-completion.bash "my_script" "my_script --get-completions"

# if you need to hard-code the completion options:
# source ~/workspace/bash-completions/simple-completion.bash "my_script" "echo one two three four"

#eval "someprefix_${bname}() { echo test; }"

#target_cmd=$1
#get_completions_cmd=$2

eval "_target_cmd_${1}=$1"
eval "_get_completions_${$2}=$2"

echo "Setting simple completions for:" _target_cmd_${1} "    with:" _get_completions_${$2}

_docompletion()
{
    local cur_word prev_word type_list

    # COMP_WORDS is an array of words in the current command line.
    # COMP_CWORD is the index of the current word.
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    # Generate a list of completion options
    completion_list=`"_get_completions_${$2}=$2"`

    # Show completions only if this is the first argument
    #if [[ ${prev_word} == "_target_cmd_${1}" ]] ; then
        # COMPREPLY is the array of possible completions, generated with
        # the compgen builtin.
    COMPREPLY=( $(compgen -W "${completion_list}" -- ${cur_word}) )
    #else
    #    COMPREPLY=()
    #fi

    return 0
}

# Register this completion function for the appropriate command(s)
complete -F _docompletion $1
