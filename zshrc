## =----------------------------------------------------------------------------=
# |                                                                            |
# |                               ZSH Options                                  |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
# unsetopt share_history
# setopt prompt_subst
autoload -Uz compinit && compinit
# autoload -U colors && colors
# autoload -U promptinit && promptinit

bindkey -e
# Use bash style Ctrl-U
bindkey \^U backward-kill-line

# Keybinds
# zle -N ffst && bindkey ^T ffst
# bindkey -e

zstyle ':compinstall filename' '~/.zshrc'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# =----------------------------------------------------------------------------=
# |                                                                            |
# |                              ENV Variables                                 |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

asdf_go=$(asdf where golang)/go
# export GOPATH=$asdf_go/go
export GOPATH=$asdf_go
export GOBIN=$asdf_go/bin
export PATH=$GOBIN:$PATH

# Path to your oh-my-zsh installation.

# Default editor
export EDITOR=nvim

export GPG_TTY=`tty`
export ZSH_DISABLE_COMPFIX=false

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
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias v='f -e nvim' # quick opening files with vim
alias o='a -e "open -n"' # quick opening files with vim
alias gs='git commit -v -S'
alias gst='git status'
alias gd='git diff'

if command -v 'xclip' > /dev/null; then
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

# hub
eval "$(hub alias -s)"

# autojump init
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/profile.d/fzf.zsh ] && . /etc/profile.d/fzf.zsh

# ZSH autosuggestions
[ -f $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Direnv
eval "$(direnv hook zsh)"

# fasd
eval "$(fasd --init auto)"

# Spaceship
source /usr/local/opt/spaceship/spaceship.zsh

# =----------------------------------------------------------------------------=
# |                                                                            |
# |                                Custom Tweaks                               |
# |                                                                            |
# =----------------------------------------------------------------------------=
#
# ZSH Custom
ZSH_CUSTOM="$HOME/.zsh-custom"
source <(cat $ZSH_CUSTOM/*.zsh)

#tmp
# source ~/dev/dotfiles/zsh/spaceship_custom.zsh
