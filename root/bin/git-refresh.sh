#!/bin/sh

project-status &&
    git fetch upstream "${MASTER_BRANCH}" &&
    git checkout -b scratch/$(uuidgen) &&
    if [ ! git rebase "upstream/${MASTER_BRANCH}" ]
    then
        git rebase --abort &&
            git checkout --patch "upstream/${MASTER_BRANCH}" &&
            git refresh
    fi