#!/bin/bash
git checkout dev_an1
git add -A
git commit -m "anis"
git push

git checkout ostg_an
git merge dev_an
git push

git checkout prod_an
git merge ostg_an
git push

git diff HEAD ostg_an
git diff HEAD dev_an
git checkout dev_an
