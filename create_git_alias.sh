git config --global alias.pu '!sh -c "git rev-parse --abbrev-ref HEAD | xargs git push -u origin"'
git config --global alias.dm '!sh -c "git branch --merged | grep -v \* | grep -v master | xargs git branch -d"'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.sla 'log --oneline --decorate --graph --all'
git config --global alias.fadd '!sh -c "git add $(git ls-files -dom --exclude-standard | sort -u | fzf -m | xargs)"'
git config --global alias.ffco '!sh -c "git checkout $(git ls-files -dom --exclude-standard | sort -u | fzf -m | xargs)"'
git config --global alias.dsf '!f() { [ -z "$GIT_PREFIX" ] || cd "$GIT_PREFIX" && git diff --color "$@" | diff-so-fancy  | less --tabs=4 -RFX; }; f'
