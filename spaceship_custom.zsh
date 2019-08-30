SPACESHIP_DB_COLOR="${SPACESHIP_DB_COLOR="black"}"
SPACESHIP_DB_SHOW="${SPACESHIP_DB_SHOW=true}"
SPACESHIP_PROXY_HOST_SHOW="${SPACESHIP_PROXY_HOST_SHOW=true}"
SPACESHIP_DB_PREFIX="${SPACESHIP_DB_PREFIX="("}"
SPACESHIP_DB_SUFFIX="${SPACESHIP_DB_SUFFIX=") "}"
# SPACESHIP_DB_SYMBOL="${SPACESHIP_DB_SYMBOL="🍷 "}"

function db() {
  echo $DB_NAME
}
spaceship_db() {
  [ -z "$DB_NAME" ] && return
  [[ $SPACESHIP_DB_SHOW == false ]] && return
  local db_status="$DB_NAME"
  spaceship::section \
      "$SPACESHIP_DB_COLOR" \
      "$SPACESHIP_DB_PREFIX" \
      "$DB_NAME" \
      "$SPACESHIP_DB_SUFFIX"
}

spaceship_proxy_host() {
  [ -z "$PROXY_HOST" ] && return
  [[ $SPACESHIP_DB_SHOW == false ]] && return
  local db_status="$PROXY_HOST"
  spaceship::section \
      "$SPACESHIP_DB_COLOR" \
      "$SPACESHIP_DB_PREFIX" \
      "$PROXY_HOST" \
      "$SPACESHIP_DB_SUFFIX"
}

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  dir           # Current directory section
  user          # Username section
  host          # Hostname section
  db
  proxy_host
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # venv          # virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  exec_time     # Execution time
  # line_sep      # Line break
  battery
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# SPACESHIP_CHAR_SYMBOL='¥'
# SPACESHIP_CHAR_SYMBOL='µ'
SPACESHIP_CHAR_SYMBOL='λ'

SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_JOBS_SYMBOL='☼'
