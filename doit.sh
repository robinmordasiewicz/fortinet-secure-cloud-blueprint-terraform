#!/bin/bash
#

git checkout main
git fetch -p origin
git merge origin/main
git checkout Production
git merge main
git push origin Production
git switch main
