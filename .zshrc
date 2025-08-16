# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

eval "$(starship init zsh)"
eval $(thefuck --alias)

alias ls="lsd"
alias grep="grep --color=auto"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
export PATH="$PATH:$(gem env path | sed 's#[^:]\+#&/bin#g')" # This is for Ruby. You can delete it
export PATH="$PATH:$HOME/.spicetify/"
