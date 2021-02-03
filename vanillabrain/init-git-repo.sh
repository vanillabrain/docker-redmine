#!/bin/bash

VANILLA_REDMINE_GIT_DIR=/home/redmine/vanillaBrain-project/
VANILLA_BRAIN_PROJECT_DIR=/home/vanilla/vanilla-brain-origin-repo
VANILLA_BRAIN_PROJECTS=.vanilla-brain-projects

mapfile -t PROJECTS < ${VANILLA_BRAIN_PROJECTS}

mkdir -p ${VANILLA_BRAIN_PROJECT_DIR}
cd ${VANILLA_BRAIN_PROJECT_DIR}

for PROJECT in ${PROJECTS[@]}; do
	git clone --mirror ${PROJECT}
	echo "This is ${PROJECT}"
done

REDMINE_CONTAINER_ID=$(docker ps -qaf "name=docker-redmine_redmine_1")

echo "which is in $(pwd)"

echo "Redmine Conatiner id is ${REDMINE_CONTAINER_ID}"

#docker cp . <docker-container-id>:/home/redmine/vanillaBrain-project/
su - root -c "docker cp ${VANILLA_BRAIN_PROJECT_DIR}/. ${REDMINE_CONTAINER_ID}:${VANILLA_REDMINE_GIT_DIR}"

