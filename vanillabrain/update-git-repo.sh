#!/bin/bash

VAINLLABRAIN_PROJECT_DIR=/home/vanilla/vanilla-brain-origin-repo 

cd ${VAINLLABRAIN_PROJECT_DIR}

for entry in `ls -d */`
    do
        echo "$entry"
	cd ${entry}  && {
	    	git remote update
		cd ..
	    }
    done
        

