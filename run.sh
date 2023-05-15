#!/bin/bash

# Run commands in a `nrun` container
# Usage: run.sh [OPTIONS] COMMAND [ARG...]
#
# The OPTIONS correspond to what `docker run` supports (passed on verbatim)
# (https://docs.docker.com/engine/reference/commandline/run/)
#
# (!) Space between option and argument are NOT supported, e.g.
#     --env=MYVAR=123     [OK]
#     --env MYVAR=123     [NOK]
#

validate_pwd () {
  # Prevent the user from mounting the entire home folder (or even entire file system)
  # (This reduces the risk of exposing secrets to the container content)
  local SAFE_DIR_PREFIX="${HOME}/" # trailing '/' is crusial here!

  if [[ "${PWD}" != "${SAFE_DIR_PREFIX}"* ]]; then
    echo "Incorrect usage! Will not allow mounting of everything under ${PWD} in Node container"
    exit 1
  fi
}

validate_pwd

# Collect all options to `docker run`, which must be specified before the COMMAND
OPTIONS=()
while [[ "$1" == "-"* ]]; do
  OPTIONS+=("$1")
  shift
done

# Build image if it doesn't exist yet
REPO="nrun"
IMAGE="$REPO:latest"
if ! docker image ls -f reference="$IMAGE" | grep $REPO > /dev/null; then
  echo "Image $IMAGE doesn't exist, building it now"
  ./build.sh
fi
docker run ${OPTIONS[@]} --rm -it -v ${PWD}:${PWD} -w ${PWD} $IMAGE "$@"
