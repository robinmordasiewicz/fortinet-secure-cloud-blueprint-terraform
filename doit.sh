#!/bin/bash
#

 if [[ ! -z "true" ]]
  then
    if [[ "true" == "true" ]]
    then
      echo 'action=apply'
    else
      echo 'action=destroy'
    fi
  else
    echo 'action=skip'
  fi

  exit 0

git switch main

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
