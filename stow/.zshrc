export EDITOR=nvim

typeset -U path
path=(~/.local/scripts $path)

# history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_all_dups hist_ignore_space

# completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{red}(%b)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{red}(%b|%a)%f'
precmd_functions+=(vcs_info)
setopt prompt_subst
PROMPT='%F{244}%1~%f${vcs_info_msg_0_} ❯ '

# keys
bindkey -e
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# plugins
command -v fzf >/dev/null && source <(fzf --zsh)
[[ -f $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
