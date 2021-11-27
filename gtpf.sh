#!/bin/bash
git checkout dev-an
git add -A
git commit -m "anis"
git push

git checkout ostg-an
git merge dev-an
git push

git checkout prod-an
git merge ostg-an 
git push

git diff HEAD ostg-an
git diff HEAD dev-an
git checkout dev-an
