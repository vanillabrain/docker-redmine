#!/bin/bash
#
# Author: Seansin <seansin@vanillabrain.com>
#
# Git Fetch 자동화를 위한 Git Credential GPG 암호화 및 플러그인 등록 쉘 스크립트
#
# Usage:
#   $ ./encrypt-netrc.sh
#

# GPG Public Key 생성 / 유효기간 30일
gpg --batch --gen-key <<EOF
Key-Type: 1
Key-Length: 2048
Subkey-Type: 1
Subkey-Length: 2048
Name-Real: sinsuung
Name-Email: sinsuung@vanillabrain.com
Expire-Date: 30
EOF

# 생성된 키를 통해서 netrc 파일 gpg 암호화 및 git-credential-netrc 명령어 등록
gpg -e -r sinsuung@vanillabrain.com  .netrc \
    && cp -a .netrc.gpg ~/.netrc.gpg \
    && wget https://raw.githubusercontent.com/git/git/master/contrib/credential/netrc/git-credential-netrc.perl -O git-credential-netrc \
    && cp -a git-credential-netrc /usr/local/bin/ \
    && chmod 755 /usr/local/bin/git-credential-netrc

# gpg git credential 등록
git config --global credential.helper  \
    && git config credential.helper "netrc -d -v"

