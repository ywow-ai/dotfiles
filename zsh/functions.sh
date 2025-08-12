# ~/.config/zsh/functions.sh

__zip() {
  local dirname=$(basename "$PWD")
  zip -r "../${dirname}.zip" .
}
