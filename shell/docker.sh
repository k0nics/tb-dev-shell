# shellcheck shell=bash

# Docker shortcuts.
#
# d ps       -> docker ps
# d c ps     -> docker compose ps
# d c up -d  -> docker compose up -d
d() {
  if [ "${1-}" = "c" ]; then
    shift
    command docker compose "$@"
    return
  fi

  command docker "$@"
}
