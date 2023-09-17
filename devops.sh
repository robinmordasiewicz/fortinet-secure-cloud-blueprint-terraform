#!/bin/bash
#

#git checkout -b Development

git switch -c Development
git push --set-upstream origin Development
git switch main
git branch -d Development
git push origin --delete Development


