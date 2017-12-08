
# for use with two-layer-completion.bash
# echo the desired completion options for cf_login script

layer=$1
prev_word=$2

case ${layer} in
  "1"*)
    echo "aws gcp"
    exit
    ;;
  "2"*)
    if [[ ${prev_word} == "aws" ]] ; then
      echo "cupcake swissroll victoriasponge"
      exit
    elif [[ ${prev_word} == "gcp" ]] ; then
      # This list was retrieved via " list-envs | awk '/gcp/ {printf "%s ", $1}' " on December 8th 2017, after the great Whisky fire.
      options="southlaketahoe amadorcity clayton colfax lapuente palmdesert redlands kingcity murrieta havana missionviejo coachella hughson"
      echo $options
      exit
    else
      #echo "COMPLETION_ERROR_Previous_word_not_recognised"
      exit
    fi
    ;;
  *)
  ;;
esac
