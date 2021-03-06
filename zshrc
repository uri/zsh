# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.mix/escripts:$PATH
export PATH=$HOME/Library/Python/3.6/bin:$PATH
if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi
if [ -d $HOME/.cargo/bin ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
GOV=$(asdf current golang | rg -o '1\.\d+\.\d+')
export GOROOT=$ASDFINSTALLS/golang/$GOV/go
export GOPATH=$HOME/dev/go
export PATH=$GOROOT/bin:$PATH
export PATH=$HOME/dev/go/bin:$PATH

# Default editor
export EDITOR=nvim

export GPG_TTY=`tty`
export ZSH_DISABLE_COMPFIX=false

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autosuggestions docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load rbenv
# eval "$(rbenv init -)"

# Use hub instead of git
eval "$(hub alias -s)"

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
alias man='man -P viewman'
alias vimst='vim `ffst`'
alias grake='$HOME/.asdf/shims/rake -f ~/bin/Rakefile'
alias cdc='source go_back'
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias v='f -e nvim' # quick opening files with vim
alias o='a -e "open -n"' # quick opening files with vim
alias gs='git commit -v -S'

if [ -e $HOME/bin/tw ]; then
  alias task='tw'
fi

# autojump init
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# Java setup?
# Mac specific
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/profile.d/fzf.zsh ] && . /etc/profile.d/fzf.zsh

#

# Direnv
eval "$(direnv hook zsh)"

if command -v 'xclip' > /dev/null; then
  alias pbcopy='xclip -sel c'
  alias pbpaste='xclip -sel c -o'
fi


# Keybinds
# zle -N ffst && bindkey ^T ffst

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

eval "$(fasd --init auto)"

# Use bash style Ctrl-U
bindkey \^U backward-kill-line

. $(brew --prefix asdf)/asdf.sh

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/uri/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
