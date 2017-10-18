# This file is sourced into ~/.bash_it/custom/custom.completion.bash on some workstations.

# Working:
source ~/workspace/bash-completions/simple-completion.bash "fly_login" "fly_login --get-completions"

# In development:

source ~/workspace/bash-completions/two-layer-completion.bash "cf_login" "$HOME/workspace/bash-completions/_cf_login.bash"
