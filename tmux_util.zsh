
function tma () {
  tmux attach -t $(tmux ls | sed -E 's/^([a-z0-9_\s]+):.*/\1/' | fzf)
}
