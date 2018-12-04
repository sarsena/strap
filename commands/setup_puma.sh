setup_puma() {
  mkdir -p $HOME/Library/LaunchAgents
  sudo puma-dev -setup
  puma-dev -install -d pdev
  sudo chown -R $USER /etc/resolver
}
