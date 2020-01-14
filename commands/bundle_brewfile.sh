bundle_brewfile() {
  BREWFILE_PATH="$(cd "$(dirname "$0")/../" && pwd)/Brewfile"
  echo $BREWFILE_PATH
  brew bundle install --file=$BREWFILE_PATH
}
