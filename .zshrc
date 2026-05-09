# -----------------------------
# Environment variables
# -----------------------------

export EDITOR="nvim"
export VISUAL="nvim"

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Load user environment
source "$HOME/.local/share/../bin/env"


# -----------------------------
# History
# -----------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


# -----------------------------
# Shell options
# -----------------------------

setopt auto_cd                # Move to dirs only writing their names
setopt auto_pushd             # Directory history
setopt pushd_ignore_dups      # Ignore duplicates in pushd
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # Ignore duplicated commands
setopt hist_ignore_space      # Ignore commands that start with space


# -----------------------------
# Aliases
# -----------------------------

alias ls="lsd --color=auto"
alias grep="grep --color=auto"


# -----------------------------
# Completion system
# -----------------------------

# Load compinstall
zstyle :compinstall filename '/home/user/.zshrc'

# Smart loading completion system
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -c
fi


# -----------------------------
# Plugin manager
# -----------------------------

# Load antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Initialize plugins from ~/.zsh_plugins.txt
antidote load


# -----------------------------
# Scripts
# -----------------------------

eval "$(starship init zsh)"
