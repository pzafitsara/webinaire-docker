#!/bin/sh
set -eux

git config user.name ${GIT_USER}
git config user.email ${GIT_EMAIL}
git remote add ci-origin ${GIT_REPO}
git checkout master
git merge develop
git push ci-origin master