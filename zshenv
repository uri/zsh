if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/bin ]; then
  export PATH=$HOME/bin:$PATH
fi

export PATH=/opt/homebrew/bin:$PATH

# go
gopath=/Users/uri/go
export PATH=$gopath/bin:$PATH
# export PATH=$(go env GOROOT)/bin:$PATH

if [ -f "$HOME/.cargo/env" ]; then
	source "$HOME/.cargo/env"
fi

# aliases
alias terraform=tofu
