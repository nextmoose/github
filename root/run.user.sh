#!/bin/sh

mkdir /home/user/.ssh &&
    chmod 0700 /home/user/.ssh &&
    touch /home/user/.ssh/config /home/user/.ssh/known_hosts /home/user/.ssh/upstream_id_rsa /home/user/.ssh/origin_id_rsa /home/user/.ssh/report_id_rsa &&
    chmod 0600 /home/user/.ssh/upstream_id_rsa /home/user/.ssh/origin_id_rsa /home/user/.ssh/report_id_rsa /home/user/.ssh/config &&
    chmod 0644 /home/user/.ssh/known_hosts &&
    git -C /workspace init