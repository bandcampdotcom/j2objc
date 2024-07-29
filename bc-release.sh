#!/bin/bash

set -e

# Setup file names.
# Note our commit is based on `master`, not the `bc` branch.
GIT_COMMIT=`git rev-parse --short master`
ZIP_PATH=j2objc-dist-$GIT_COMMIT.zip

# Create zip file for release.
rm -f $ZIP_PATH
zip -r $ZIP_PATH dist/

# Submit release to Github.
# Note our target is master. This will link to the master branch rather than our fork.
gh release create $GIT_COMMIT $ZIP_PATH \
  --repo bandcampdotcom/j2objc \
  --generate-notes \
  --target master
