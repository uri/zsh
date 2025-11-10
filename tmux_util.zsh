function tma () {
	sesh=$(tmux ls | sed -E 's/([^:]*):.*$/\1/' | fzf)
  [[ -n $sesh ]] && tmux attach -t $sesh
}

function tms () {
  tmux new -d -s $1
  tmux send-keys "j $1$" C-m
  tmux a -t $1
}
