#!/bin/sh

if git refresh
then
    git checkout -b scratch/$(uuidgen) &&
        COMMENT_COMMIT=$(git log --pretty=format:"%h" "upstream/${MASTER_BRANCH}"..HEAD | tail -n 1) &&
        git refresh --soft "upstream/${MASTER_BRANCH}" &&
        while ! git diff --exit-code
        do
            echo There are local unstaged changes. &&
                git diff &&
                bash
        done &&
        while [ ! -z "$(git ls-files --other --exclude-standard --directory --exclude .c9)" ]
        do
            echo There are untracked files that are not .gitignored - nor are they part of .c9. &&
                git ls-files --other --exclude-standard --directory --exclude .c9 &&
                bash
        done &&
        git commit --reedit-message ${COMMENT_COMMIT}
else
    echo Failed to cleanly refresh &&
        exit 64
fi