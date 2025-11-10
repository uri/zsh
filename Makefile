spaceship.zsh-theme:
	-rm spaceship.zsh-theme
	curl -o spaceship.zsh-theme https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh

fzf-git.zsh:
	curl -L -O https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
	mv fzf-git.sh fzf-git.zsh
	chmod +x fzf-git.zsh
