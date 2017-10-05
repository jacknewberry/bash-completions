# source ~/workspace/bash-completions/_fly_login.bash
source ~/workspace/bash-completions/simple-completion.bash "fly_login" "fly_login --get-completions"
source ~/workspace/bash-completions/two-layer-completion.bash "cf_login" "~/workspace/bash-completions/_cf_login.bash"
