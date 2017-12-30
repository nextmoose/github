#!/bin/sh

git refresh &&
    git checkout -b scratch/$(uuidgen) &&
    git reset --soft "upstream/${MASTER_BRANCH}" &&
    git commit --reedit-message $(git log --pretty=format:"%h" "upstream/${MASTER_BRANCH}"..$(git rev-parse HEAD) | tail -n 1)