#!/usr/bin/env bash

set -e -x -o pipefail

exit_commands=()
function cleanup {
    while (( ${#exit_commands[@]} )); do
      eval "${exit_commands[-1]}"
      unset 'exit_commands[-1]'
    done
}
trap cleanup EXIT

function _on_exit {
    exit_commands+=("$1")
}

for f in /build/scripts/*; do
   source "$f"
done
