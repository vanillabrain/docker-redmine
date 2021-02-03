#!/bin/bash
#
# Author: Seansin <seansin@vanillabrain.com>
#
# Installs a bunch of plugins for the docker-redmine image
#
# Usage:
#   $ mkdir -p /opt/redmine/data/plugins
#   $ cd /opt/redmine/data/plugins
#   $ wget http://goo.gl/iJcvCP -O - | sh
#

set -e

#
## Install tarballs
#

HOST_REDMINE_PLUGIN_DIR=redmine_data/plugins

cd ${HOST_REDMINE_PLUGIN_DIR}

# redmine ckeditor plugin
# HOMEPAGE: https://github.com/a-ono/redmine_ckeditor
REDMINE_CKEDITOR_VERSION=1.2.3
rm -rf redmine_ckeditor
mkdir -p redmine_ckeditor
wget -nv https://github.com/a-ono/redmine_ckeditor/archive/${REDMINE_CKEDITOR_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_ckeditor

# redmine code review plugin
# HOMEPAGE: https://github.com/haru/redmine_code_review
REDMINE_CODE_REVIEW_VERSION=1.0.0
rm -rf redmine_code_review
mkdir -p redmine_code_review
wget -nv https://github.com/haru/redmine_code_review/archive/${REDMINE_CODE_REVIEW_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_code_review

# redmine dmsf plugin
# HOMEPAGE : https://github.com/danmunn/redmine_dmsf
REDMINE_DSMF_VERSION=v2.4.5
rm -rf redmine_dmsf 
mkdir -p redmine_dmsf
wget -nv https://github.com/danmunn/redmine_dmsf/archive/${REDMINE_DSMF_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_dmsf
