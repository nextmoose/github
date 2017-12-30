#!/bin/sh

if git refresh
then
    git checkout -b scratch/$(uuidgen) &&
        COMMENT_COMMIT=$(git log --pretty=format:"%h" "upstream/${MASTER_BRANCH}"..HEAD | tail -n 1) &&
        git refresh --soft "upstream/${MASTER_BRANCH}" &&
        git commit --reedit-message ${COMMENT_COMMIT}
else
    echo Failed to cleanly refresh &&
        exit 64
fi