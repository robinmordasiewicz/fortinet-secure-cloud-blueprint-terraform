#!/bin/bash
#

#git checkout -b Development

git push origin --delete Development

git switch -c Development

git push --set-upstream origin Development
