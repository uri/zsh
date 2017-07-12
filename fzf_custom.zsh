# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --ignore-file .git -g "" --files'
# Enable this when it's released
# export FZF_DEFAULT_OPTS='--height 40% --reverse --bind ctrl-u:unix-word-rubout+top'
export FZF_DEFAULT_OPTS='--height 40% --reverse --bind ctrl-u:unix-line-discard+top'
# export FZF_DEFAULT_OPTS='--height 40% --reverse'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

function ffrm() {
  local toremove=ffst
  echo "Removing: "
  echo $toremove
  echo $toremove | xargs rm
}

function ffst() {
  { git diff --cached --name-only & git ls-files  -dom --exclude-standard; } | sort -u | fzf -m --preview "cat {}"
}

fcom() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --reverse --tiebreak=index --bind=ctrl-s:toggle-sort |
  grep -o '[a-f0-9]\{7\}' | head -1
}
