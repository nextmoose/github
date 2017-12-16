#!/bin/sh

project-status &&
    git fetch upstream "${MASTER_BRANCH}" &&
    git checkout -b scratch/$(uuidgen) &&
    git reset --soft "upstream/${MASTER_BRANCH}" &&
    git commit --reedit-message $(git log --pretty=format:"%h" master..$(git rev-parse HEAD) | tail -n 1)