HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

path=('/opt/bitwarden' $path)
path=('/opt/homebrew/bin' $path)
path=('/usr/local/bin' $path)
export PATH

eval "$(starship init zsh)"

WORDCHARS="${WORDCHARS:s#/#}"

bindkey '^[[1;3D' backward-word # Alt + ←
bindkey '^[[1;3C' forward-word  # Alt + →
bindkey '^W' backward-delete-word

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

bindkey '^[[A' history-substring-search-up   # ꜛ
bindkey '^[[B' history-substring-search-down # ꜜ

alias ll='ls -al'
