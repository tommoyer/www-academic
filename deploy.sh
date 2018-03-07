#!/bin/bash

REMOTE_DEPLOY_HOST=thomasmoyer.org
REMOTE_DEPLOY_USER=tmoyer
REMOTE_DEPLOY_DIR=/home/tmoyer/www

ssh -A ${REMOTE_DEPLOY_USER}@${REMOTE_DEPLOY_HOST} -t "cd ${REMOTE_DEPLOY_DIR}; git pull; rake build"