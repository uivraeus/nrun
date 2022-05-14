# This script must be sourced
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && echo "Incorrect usage! ${BASH_SOURCE[0]} must be sourced" && exit 0

# Full path to directory containing the scripts (== directory of _this_ script)
SCRIPT_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

# Alias for running commands in the node/npm container
# Use this if you need to provide OPTIONS, e.g. --env
alias nrun="${SCRIPT_DIR}/run.sh"

# Shorthands for node/npm (only useful if no OPTIONS are needed)
alias node="nrun node"
alias npm="nrun npm"
alias npx="nrun npx"

