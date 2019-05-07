#!/bin/bash

# $1 is $OUTDIR/target
source $1/../.config

TARGET_DIR=$BR2_STAGING_DIR

function remove {
  for file in $* ; do
    rm -v $TARGET_DIR/$file 2>/dev/null
  done
}

function remove_force {
  for file in $* ; do
    rm -v -rf $TARGET_DIR/$file 2>/dev/null
  done
}

function remove_dir {
  for dir in $* ; do
    rmdir -v $dir 2>/dev/null
  done
}

function remove_with_find {
  find $TARGET_DIR -name "$1" -exec rm -v {} \;
}

# ----------------------------------------
remove_with_find '..install.cmd'
remove_force \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/doc \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/gettext \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/info \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/libtool \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/locale/libltdl \
    arm-linux-2.6.36-uclibc-4.5.3/sysroot/usr/share/man \
    share/doc \
    share/gcc-4.5.3 \
    share/info \
    share/locale \
    share/man

