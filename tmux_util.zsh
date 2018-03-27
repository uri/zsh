
function tma () {
  tmux attach -t $(tmux ls | sed -E 's/^([a-z0-9_\s]+):.*/\1/' | fzf)
}

function tms () {
  tmux new -d -s $1
  tmux send-keys "j $1" C-m
  tmux a -t $1
}
