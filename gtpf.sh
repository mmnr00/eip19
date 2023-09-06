#!/bin/bash
git checkout dev-an
git add -A
git commit -m "anis"
git push

git checkout ostg-1an
git merge dev-an
git push

git checkout prod-1an
git merge ostg-1an 
git push

git diff HEAD ostg-1an
git diff HEAD dev-an
git checkout dev-an
