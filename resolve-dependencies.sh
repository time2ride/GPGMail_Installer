#!/bin/sh

echo Initialising and updating submodules...
git submodule init
git submodule update
cd GPGMail
git submodule init
git submodule update
cd GPGMail
echo starting build of GPGMail...
make
echo If the build did not fail you can start!
