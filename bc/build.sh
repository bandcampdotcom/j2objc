#!/bin/bash

# Build requirements:
# - Install JDK15 LTS from adoptium website
# - Install protobuf from Homebrew

set -e

# Setup build flags, paths, etc.
export TRANSLATE_GLOBAL_FLAGS="--doc-comments;--generate-deprecated;--swift-friendly;"
export J2OBJC_ARCHS="iphone64 simulator64"
export PROTOBUF_ROOT_DIR=/opt/homebrew
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home

# Clean build folder.
make clean

# Build j2objc.
make -j8 all_dist

# Build JRE emulation.
JAVA_HOME=`/usr/libexec/java_home -v 11` make -C jre_emul/ -f java.mk emul_module_dist
