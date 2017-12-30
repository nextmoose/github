#!/bin/sh

while [ ${#} -gt 0 ]
do
    case ${1} in
        --message)
            MESSAGE="${2}" &&
                shift 2
        ;;
        --std-in)
            MESSAGE_FILE=$(mktemp) &&
                shift
        ;;
    esac
done &&
    project-status &&
    git fetch upstream "${MASTER_BRANCH}" &&
    git checkout "upstream/${MASTER_BRANCH}" &&
    git checkout -b scratch/$(uuidgen) &&
    if [ -z "${MESSAGE}" ] && [ -z "${MESSAGE_FILE}" ]
    then
        git commit --allow-empty
    elif [ ! -z "${MESSAGE_FILE}" ]
    then
        tee ${MESSAGE_FILE} &&
            git commit --allow-empty --file ${MESSAGE_FILE} &&
            rm -f ${MESSAGE_FILE}
    elif [ ! -z "${MESSAGE}" ]
    then
        git commit --allow-empty --message "${MESSAGE}"
    else
        git commit --allow-empty --allow-empty-message
    fi