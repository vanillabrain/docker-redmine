#!/bin/bash

VAINLLABRAIN_PROJECT_DIR=/home/vanilla/vanillaBrain-project
VAINLLA_REDMINE_DATA_DIR=/home/vanilla/docker-redmine/redmine_data
VAINLLATOPIC=vanillatopic.git

cd ${VAINLLABRAIN_PROJECT_DIR}/${VAINLLATOPIC}
git remote update

cp -a ${VAINLLABRAIN_PROJECT_DIR} ${VAINLLA_REDMINE_DATA_DIR}/${VANILLABRAIN_PROJECT_DIR}