#!/bin/sh

if git refresh
then
    git checkout -b scratch/$(uuidgen) &&
        git reset --soft "upstream/${MASTER_BRANCH}" &&
        git commit --reedit-message $(git log --pretty=format:"%h" "upstream/${MASTER_BRANCH}"..$(git rev-parse HEAD) | tail -n 1)
else
    echo Failed to cleanly refresh &&
        exit 64
fi