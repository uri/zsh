# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg -L --hidden --no-ignore-vcs -g "" --files 2> /dev/null'
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
  { git diff --cached --name-only & git ls-files  -dom --exclude-standard; } | sort -u | fzf -m --preview "cat {}" --bind "btab:select-all"
}

fcom() {
  git log --graph --color=always \
      --format="%h%C(auto)%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --height 80% \
      --ansi --reverse --tiebreak=index\
      --bind=ctrl-d:preview-page-down \
      --bind=ctrl-u:preview-page-up \
      --bind=ctrl-e:preview-down \
      --bind=ctrl-y:preview-up \
      --bind=ctrl-s:toggle-sort \
      --preview 'git show --color=always {2}' |
    grep -o '[a-f0-9]\{7,8\}' #| head -1 | xargs
}

fzf-g-file-widget() {
  LBUFFER="${LBUFFER}$(ffst | xargs)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle     -N   fzf-g-file-widget
bindkey '^G' fzf-g-file-widget

_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
  local pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
  cd $pwdir
  rg -g '*.gpg' --files |
  sed 's/\.gpg//'
  )
  # local stringsize="${#pwdir}"
  # find "$pwdir" -name "*.gpg" -print |
  #   cut -c "$((stringsize + 1))"-  |
  #   sed -e 's/\(.*\)\.gpg/\1/'
  # )
}
