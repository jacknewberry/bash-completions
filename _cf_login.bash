
# for use with two-layer-completion.bash
# echo the desired completion options for cf_login script

layer=$1
prev_word=$2

case ${layer} in
  "0"*)
    echo "aws gcp"
    exit
    ;;
  "1"*)
    if [[ ${prev_word} == "aws" ]] ; then
      echo " "
      exit
    elif [[ ${prev_word} == "gcp" ]] ; then
      echo "londyhop locomotion lambada flamenco bolero pikachu reel charlston samba sousta"
      exit
    else
      echo "case_1_no_prev_word oh_no"
    fi
    ;;
  *)
    echo "first_arg_was_not_1_nor_0"
  ;;
esac
