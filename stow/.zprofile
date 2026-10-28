if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
