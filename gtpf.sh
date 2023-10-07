#!/bin/bash
git checkout dev-an
git add -A
git commit -m "anis"
git push

git checkout ostg-2an
git merge dev-an
git push

git checkout prod-2an
git merge ostg-2an 
git push

git diff HEAD ostg-2an
git diff HEAD dev-an
git checkout dev-an
