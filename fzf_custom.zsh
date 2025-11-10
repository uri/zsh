# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_COMMAND='rg -L --hidden --no-ignore-vcs -g "" --files 2> /dev/null'
export FZF_DEFAULT_COMMAND='rg -L --hidden --no-ignore-vcs -g "!node_modules" -g "!.git" --files 2> /dev/null'
export FZF_ALT_C_COMMAND='fd --type d 2> /dev/null'
# Enable this when it's released
# export FZF_DEFAULT_OPTS='--height 40% --reverse --bind ctrl-u:unix-word-rubout+top'
export FZF_DEFAULT_OPTS='--height 40% --reverse --bind ctrl-u:unix-line-discard+top'
# export FZF_DEFAULT_OPTS='--height 40% --reverse'
# Solarized colors
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
# '

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

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

# fzf-g-file-widget() {
#   LBUFFER="${LBUFFER}$(ffst | xargs)"
#   local ret=$?
#   zle redisplay
#   typeset -f zle-line-init >/dev/null && zle zle-line-init
#   return $ret
# }
# zle     -N   fzf-g-file-widget
# bindkey '^G' fzf-g-file-widget

# _fzf_complete_pass() {
#   _fzf_complete '+m' "$@" < <(
#   local pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
#   cd $pwdir
#   rg -g '*.gpg' --files |
#   sed 's/\.gpg//'
#   )
#   # local stringsize="${#pwdir}"
#   # find "$pwdir" -name "*.gpg" -print |
#   #   cut -c "$((stringsize + 1))"-  |
#   #   sed -e 's/\(.*\)\.gpg/\1/'
#   # )
# }

_fzf_complete_pass() {
  _fzf_complete +m -- "$@" < <(
    local prefix
    prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
    command find -L "$prefix" \
      -name "*.gpg" -type f | \
      sed -e "s#${prefix}/\{0,1\}##" -e 's#\.gpg##' -e 's#\\#\\\\#' | sort
  )
}

_fzf_complete_kx() {
  _fzf_complete +m -- "$@" < <(
    command kubectl config view | yq '.contexts[].name'
  )
}

_fzf_complete_kn() {
  _fzf_complete +m -- "$@" < <(
    command kubectl get namespaces | tail -n+2 | cut -d' ' -f1 | sort
  )
}
