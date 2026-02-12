# ~/.config/zsh/functions.sh

# 👉 bikin zip dari folder saat ini
__zip() {
  local dirname=$(basename "$PWD")
  zip -r "../${dirname}.zip" .
}

# 👉 load conda environment (kalau ada)
__loadconda() {
  __conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
      . "/usr/etc/profile.d/conda.sh"
    else
      export PATH="/usr/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

# 👉 cek folder hidden besar yang aman dibersihkan
__cleancheck() {
  echo "🔍 Cek folder hidden besar di HOME..."

  CLEAN_TARGETS=(
    ".cache"
    ".npm"
    ".yarn"
    ".bun"
    ".conda/pkgs"
    ".local/share/Trash"
  )

  for dir in "${CLEAN_TARGETS[@]}"; do
    if [ -d "$HOME/$dir" ]; then
      du -sh "$HOME/$dir"
    fi
  done
}

erp() {
  curl \
    -s \
    -X GET "$ERP_BASE_API$1" \
    -H "x-api-key: $ERP_API_KEY" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json"
}
