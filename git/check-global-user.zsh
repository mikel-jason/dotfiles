#!/usr/bin/env bash

# set -eo pipefail -> 'git config --get' will fail, so shells will die immediatelt

globalname=$(git config --get --global user.name)
globalemail=$(git config --get --global user.email)

if [[ "$globalname" != "" ]] || [[ "$globalemail" != "" ]]; then
    echo "WARNING: Global git user is set: $globalname <$globalemail>"
    echo "         Should be removed to not commit with wrong user by mistake"
fi
