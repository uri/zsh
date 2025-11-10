## =----------------------------------------------------------------------------=
# |                                                                            |
# |                               ZSH Options                                  |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
# unsetopt share_history
setopt share_history
# setopt hist_ignore_space
setopt histignorespace
# setopt histignorealldups
# setopt prompt_subst
# autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
# autoload -U colors && colors
# autoload -U promptinit && promptinit
autoload -U select-word-style
select-word-style bash

# bindkey -v # vi keybindings
bindkey -e # emacs keybindings
bindkey "^[^[" vi-cmd-mode

# Copy some emacs keybindings
# Use bash style Ctrl-U
bindkey \^U backward-kill-line
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line
# Keybinds
# zle -N ffst && bindkey ^T ffst

# Copy current command
copybuffer () {
  # If line is empty, get the last run command from history
  if test -z $BUFFER; then
    buf=$(fc -ln -1)
  else
    buf=$BUFFER
  fi

  printf "%s" "$buf" | pbcopy
}
zle -N copybuffer
bindkey '^X^y' copybuffer


zstyle ':compinstall filename' '~/.zshrc'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# =----------------------------------------------------------------------------=
# |                                                                            |
# |                              ENV Variables                                 |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
# Hist
export HISTSIZE=10000000
export SAVEHIST=10000000

# ZSH Custom
ZSH_CUSTOM="$HOME/.zsh-custom"


# XDG Base Directory Specification
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_STATE_HOME="$HOME/.local/state"
#
# # XDG search paths (colon-separated)
# export XDG_DATA_DIRS="/usr/local/share:/usr/share"
# export XDG_CONFIG_DIRS="/etc/xdg"

# User bin directory (not XDG spec but common convention)
if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

if [ -d /opt/homebrew/share/man ]; then
  export MANPATH="/opt/homebrew/share/man:$MANPATH"
fi

if [ -d $HOME/.local/share/ruby/lib ]; then
  export RUBYLIB="$HOME/.local/share/ruby/lib:$RUBYLIB"
fi


# Runtime directory (XDG spec but usually handled by system)
# Only set if not already set by system
# if [[ -z "$XDG_RUNTIME_DIR" ]]; then
#     export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime"
#     mkdir -p "$XDG_RUNTIME_DIR"
#     chmod 700 "$XDG_RUNTIME_DIR"
# fi

# Create directories if they don't exist
# mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME" "$XDG_STATE_HOME" "$HOME/.local/bin"

# go
export GOBIN="$HOME/.local/bin"
# export GOPATH=/Users/uri/src/go
# export PATH=$(go env GOROOT)/bin:$PATH
# export PATH=$(go env GOPATH)/bin:$PATH
# ejson
export EJSON_KEYDIR=$HOME/opt/ejson/keys

# Path to your oh-my-zsh installation.

# Default editor
export EDITOR=nvim

export GPG_TTY=`tty`
export ZSH_DISABLE_COMPFIX=false

# Default container tool
export CONTAINER_TOOL=docker

# WARN might fix some display issues but also might cause some
export TERMINFO_DIRS=/usr/share/terminfo

# Use nvim for pager

if hash nvim &> /dev/null
then
	export MANPAGER='col -b | nvim -MR - '
fi

alias pop='tmux popup -w 80% -h 80% -E'
alias be='bundle exec '
alias bss='browser-sync start --proxy app.local.dev:3000 --files "app/assets/stylesheets/*.scss, app/views/*.html.erb"'
alias cbr=current-branch
alias ffix='git commit --fixup `fcom`'
alias fsquash='git commit --squash `fcom`'
alias hr='heroku run -a $(testapp) '
alias testapp='echo teldiod3test-pr-$(git-pull-request-number)'
alias tm=tmux
# Use nvim instead of vim
alias vim=nvim
alias vi='nvim -u NONE'
# alias man='man -P viewman'
alias vimst='vim `ffst`'
alias grake='$HOME/.asdf/shims/rake -f ~/bin/Rakefile'
alias cdc='source go_back'
# alias j='fasd_cd -d'
# alias jj='fasd_cd -d -i'
alias v='f -e nvim' # quick opening files with vim
alias o='a -e "open -n"' # quick opening files with vim
alias gs='git commit -v -S'
alias gst='git status'
alias gd='git diff'

if hash xclip &> /dev/null; then
  alias pbcopy='xclip -sel c'
  alias pbpaste='xclip -sel c -o'
fi

# =----------------------------------------------------------------------------=
# |                                                                            |
# |                           Application-specific                             |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
# ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# autojump init
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# FZF
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# ZSH autosuggestions
[ -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Direnv
eval "$(direnv hook zsh)"

# fasd
# eval "$(fasd --init auto)"
eval "$(zoxide init zsh)"

# Spaceship
source $(brew --prefix)/opt/spaceship/spaceship.zsh


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# kubectl kubernetes
if [[ $commands[kubectl] ]]; then
  # https://kubernetes.io/docs/reference/kubectl/cheatsheet/
  source <(kubectl completion zsh)
  # k defined by kubectl-alias in zsh-custom
  complete -o default -F __start_kubectl k
  alias kx=kubectx
  alias kn=kubens
  # function kx() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; }
  # function kn() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; }
fi

# pyenv
# if command -v pyenv 1>/dev/null 2>&1; then
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#  eval "$(pyenv init -)"
# fi



# =----------------------------------------------------------------------------=
# |                                                                            |
# |                                Custom Tweaks                               |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
for f in $ZSH_CUSTOM/*.zsh; do
  source "$f"
done

if [ "$(defaults read -g AppleInterfaceStyle 2> /dev/null)" = "Dark" ]; then
  export THEME="dark"
  git config --global delta.light false
else
  export THEME="light"
  git config --global delta.light true
fi

# # Theme light or dark
# if [ "$(date +"%H")" -lt 15 ]; then
#     export THEME="light"
#     git config --global delta.light true
# else 
#     export THEME="dark"
#     git config --global delta.light false
# fi

#tmp
# source ~/dev/dotfiles/zsh/spaceship_custom.zsh

# # setup dirs
# [ -f ~/.dirs-seed ] && source ~/.dirs-seed

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Load work configuration if it exists
for file in ~/.config/work/*.sh; do
    [ -f "$file" ] && source "$file"
done
