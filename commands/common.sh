NC='\033[0m'
CYAN='\033[0;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'

abort() {
  log "DOH! $1" 💥 $RED;
  exit 1;
}

log() {
  if [ "$3" == "" ]; then
    COLOR=$CYAN
  else
    COLOR=$3
  fi
  if [ "$2" != "" ]; then
    ICON="$2   "
    [ "$3" == "" ] && COLOR=$NC
  else
    ICON="==> "
  fi
  printf "$COLOR$ICON%s$NC\n" "$1";
}
logn()  { STRAP_STEP="$*"; printf "$CYAN==> %s$NC" "$*"; }
logk()  { STRAP_STEP="";   echo "OK"; }

logstep() {
  MESSAGE=$1
  STRAP_STEP=$2
  log "Running $MESSAGE..."
  $STRAP_STEP $3 $4
  if [[ $? ]]; then
    log "$MESSAGE executed successfully" "✅" $GREEN
  else
    abort "$MESSAGE failed!"
  fi
}
