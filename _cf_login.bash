
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
      # This list was retrieved via " list-envs | awk '/gcp/ {printf "%s ", $1}' " on October 18th 2017
      options="ekitaguriro dhalo arkan bellydance chickendance kabuki lambada pikachu polka flamenco indlamu jig kathak macarena manipuri moonwalk moresca odissi sirtaki sousta plumber-testing plumbers-testing-1234 hullygully robot sattriya rumba giga mambo tango frevo tarantella zumba kiev rotterdam munich oradea porto toulouse bern innsbruck leeds minsk turin sofia liverpool nassau anakin obi-wan rey"
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
