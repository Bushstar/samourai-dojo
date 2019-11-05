#!/bin/bash

cd /home/node/app/accounts
forever start -a -l /dev/null -o /data/logs/api-output.log -e /data/logs/api-error.log index.js "$COMMON_SLC_NETWORK"

cd /home/node/app/pushtx
forever start -a -l /dev/null -o /data/logs/pushtx-output.log -e /data/logs/pushtx-error.log index.js "$COMMON_SLC_NETWORK"
forever start -a -l /dev/null -o /data/logs/pushtx-orchest-output.log -e /data/logs/pushtx-orchest-error.log index-orchestrator.js "$COMMON_SLC_NETWORK"

cd /home/node/app/tracker
forever start -a -l /dev/null -o /data/logs/tracker-output.log -e /data/logs/tracker-error.log index.js "$COMMON_SLC_NETWORK"

forever --fifo logs 0