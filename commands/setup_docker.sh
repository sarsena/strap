# Check for docker processes
check_for_docker_ps() {
  docker ps > /dev/null 2>&1
}

# Setup docker processes
setup_docker() {
  DOCKER_APP='/Applications/Docker.app'

  # This should never happen, but let's be sure.
  [ -e $DOCKER_APP ] || {
    log "Docker for Mac app not found, reinstalling from cask"
    brew cask reinstall docker
  }

  check_for_docker_ps || {
    open $DOCKER_APP
    log "Please complete the Docker for Mac Installer. Strap will continue afterwards."
    until ( check_for_docker_ps );
    do
      printf "🐳 "
      sleep 2
    done
    printf "\n"
  }
}
