#!/bin/sh

project-status &&
    git fetch upstream "${MASTER_BRANCH}" &&
    git checkout "upstream/${MASTER_BRANCH}" &&
    git checkout -b scratch/$(uuidgen) &&
    COMMIT_MESSAGE_FILE=$(mktemp) &&
    tee ${COMMIT_MESSAGE_FILE} &&
    if [ ! -z "$(cat ${COMMIT_MESSAGE_FILE})" ]
    then
        git commit --allow-empty --file ${COMMIT_MESSAGE_FILE}
    fi &&
    rm -f ${COMMIT_MESSAGE_FILE}