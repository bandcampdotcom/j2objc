#!/bin/bash

set -e

# Setup file names.
GIT_COMMIT=`git rev-parse --short HEAD`
ZIP_PATH=j2objc-dist-$GIT_COMMIT.zip

# Create zip file for release.
rm -f $ZIP_PATH
zip -r $ZIP_PATH dist/

# Submit release to Github.
gh release create $GIT_COMMIT $ZIP_PATH \
  --repo bandcampdotcom/j2objc \
  --generate-notes \
  --target bc
