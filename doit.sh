#!/bin/bash
#

git checkout main
git fetch -p origin
git merge origin/main
git checkout Production
git merge main
git push origin Production
git switch main

git checkout main
git fetch -p origin
git merge origin/main
git checkout Development
git merge main
git push origin Development
git switch main

git checkout main
git fetch -p origin
git merge origin/main
git checkout Staging
git merge main
git push origin Staging
git switch main
