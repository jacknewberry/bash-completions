
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
      # This list was retrieved via " list-envs names | awk '{printf "%s ", $1}' " on January 11th 2018.
      options="elcerrito monaco kingcity murrieta southlaketahoe amadorcity havana missionviejo clayton lapuente palosverdesestates colfax coachella hughson walnutcreek ranchomirage biggs bradbury huron luxembourg palmdesert redlands"
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
