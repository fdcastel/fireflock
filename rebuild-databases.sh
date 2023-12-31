# /bin/bash

. ./settings.sh

OPT_TARGET=$FIREFLOCK_ROOT
OPT_PREFIX="test"
OPT_PAGESIZE=8192
OPT_CHARSET="UTF8"

# Parse command line arguments -- https://stackoverflow.com/a/14203146
while [[ $# -gt 0 ]]; do
  case $1 in
    -t|--target) OPT_TARGET="$2" ; shift ; shift ;;

    -p|--prefix) OPT_PREFIX="$2" ; shift ; shift ;;
    
    --pagesize) OPT_PAGESIZE="$2" ; shift ; shift ;;
    
    --charset) OPT_CHARSET="$2" ; shift ; shift ;;

    -h|--help)
      echo "Usage: $0 [-t|--target <target-folder>] [-p|--prefix <prefix>] [--pagesize <n>] [--charset <c>]"
      exit 1
      ;;

    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

declare -a ENGINES=("FB50" "FB40" "FB30")
for eng in ${ENGINES[@]}
do
    OPT_DATABASE="$OPT_TARGET/$OPT_PREFIX.$eng.fdb"
    rm -f $OPT_DATABASE

    BIN_PATH_ENV_NAME="${eng}_BIN_PATH"
    cat <<EOF | ${!BIN_PATH_ENV_NAME}/isql -quiet 2> /dev/null
        CREATE DATABASE '$OPT_DATABASE'
            USER 'SYSDBA' PASSWORD 'masterkey'
            PAGE_SIZE $OPT_PAGESIZE DEFAULT CHARACTER SET $OPT_CHARSET;
EOF
done
