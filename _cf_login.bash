
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
      echo _-f #"oneAWScf anotherAWSFoundry"
      exit
    elif [[ ${prev_word} == "gcp" ]] ; then
      echo "londyhop locomotion lambada flamenco bolero pikachu reel charlston samba sousta"
      exit
    else
      echo "COMPLETION_ERROR_case_2_no_known_prev_word"
      exit
    fi
    ;;
  *)
  ;;
esac
