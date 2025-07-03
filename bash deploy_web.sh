#!/bin/bash
flutter build web
cd build/web
git init
git remote add origin https://github.com/phanconghieu021100/phanconghieu021100.github.io.git
git checkout -b main
git add .
git commit -m "deploy web"
git push -f origin main
