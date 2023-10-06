


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias m3ssh="cd /home/manuel/Desarrollo/m3ssh/ && ./m3ssh.sh"
alias devtest="cd /home/manuel/Desarrollo/devtest"
alias v="nvim"
alias genpass='f() { cat /dev/urandom | strings | grep -Eoa "[a-zA-Z0-9@$%&_]*" | head -n 10  | tr -d "\n" | cut -c1-$1 };f'
alias cat='bat --style=plain'

# EZA alias
alias l='eza' #   list, size, type
alias ll='eza -la' # long, all
alias la='eza -lbhHigUmuSa' # all list
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Speed keyboard
xset r rate 220 40


# TMUX
if [ "$TMUX" = "" ]; then tmux; fi

bindkey '^[l' forward-word # Move next word in line
bindkey '^H' backward-kill-word
bindkey "^[h" backward-char
bindkey "^[k" up-line-or-history
bindkey "^[j" down-line-or-history
bindkey "^[p" paste

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh-vi-mode config
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_HIGHLIGHT_BACKGROUND=#519e97
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
function zvm_after_init() {
  zvm_bindkey viins '^[[Z' autosuggest-accept
  zvm_bindkey viins '^[^?' backward-kill-word
  zvm_bindkey viins '^[l' forward-word
  zvm_bindkey viins '^[h' backward-char
  zvm_bindkey viins '^[p' paste
}
