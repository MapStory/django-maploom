#!/bin/bash
## this script is used by jenkins to update the django-maploom project after building latest maploom
# exit if anything returns failure
set -e

pwd

# path to the maploom build that will be used
MAPLOOM_PATH=../MapLoom

build/transform-files.sh $MAPLOOM_PATH

# if git status doesn't have 'nothing' (to commit) in it, go ahead and commit
# for this to work you can, 1) cd ~ 2) ssh-keygen -t rsa (Press enter for all values) 3) add pub key to the repo's deploy keys on github.
if [[ $(git status) != *nothing* ]]; then
  git add .
  git commit -m "jenkins job django-maploom: use latest maploom to build maploom django wrapper."
  git push origin composer
fi
