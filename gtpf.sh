#!/bin/bash
git checkout dev_an2
git add -A
git commit -m "anis"
git push

git checkout ostg_an
git merge dev_an2
git push

git checkout prod_an
git merge ostg_an
git push

git diff HEAD ostg_an
git diff HEAD dev_an2
git checkout dev_an2
