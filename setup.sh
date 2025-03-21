#!/bin/bash

# Install my environment
# Assumes to be run from root directory of the env repository,
# i.e. the place it is located

set -ex
SOURCE_DIR=`pwd`
OSNAME=$(uname -s)

# Link or copy (symlinks don't work on Windows)
function lncp()
{
    src=$1
    dst=$2

    # Remove old symlinks, copy files/directories
    [ -L $dst ] && rm $dst
    [ -f $dst -o -d $dst ] && mv $dst ${dst}.bak
    if [ $OSNAME = "MINGW64_NT-10.0" ]; then
        cp -r $src $dst
    else
        ln -s $src $dst
    fi
}

# Dot files
cd ${SOURCE_DIR}/dot
DOT_DIR=`pwd`
for f in ${DOT_DIR}/*; do
    bf=`basename $f`
    case "$bf" in
        "ssh"|"tmux")
            # Skip...handled below
            ;;
        *)
            lncp $f ~/.$bf
            ;;
    esac
done

# Handle ssh config
cd ${SOURCE_DIR}/dot/ssh
SSH_DIR=`pwd`
mkdir -p ~/.ssh
for f in ${SSH_DIR}/*; do
    bf=`basename $f`
    lncp $f ~/.ssh/$bf
done

# Handle tmux files
cd ${SOURCE_DIR}/dot/tmux
TMUX_DIR=`pwd`
mkdir -p ~/.tmux
for f in ${TMUX_DIR}/*; do
    bf=`basename $f`
    lncp $f ~/.tmux/$bf
done

# Tools
cd ${SOURCE_DIR}/tools/bin
TOOLS_DIR=`pwd`
mkdir -p ~/tools/bin
for f in ${TOOLS_DIR}/*; do
    bf=`basename $f`
    lncp $f  ~/tools/bin/$bf
done

cd ${SOURCE_DIR}/tools/lib
TOOLS_DIR=`pwd`
mkdir -p ~/tools/lib
for f in ${TOOLS_DIR}/*; do
    bf=`basename $f`
    lncp $f ~/tools/lib/$bf
done

cd ${SOURCE_DIR}/tools/etc
TOOLS_DIR=`pwd`
mkdir -p ~/tools/etc
for f in ${TOOLS_DIR}/*; do
    bf=`basename $f`
    lncp $f ~/tools/etc/$bf
done

# Misc
if [ -d ~/Library/Application\ Support/com.mitchellh.ghostty/ ]; then
    rm ~/Library/Application\ Support/com.mitchellh.ghostty/config
    ln -s ${SOURCE_DIR}/misc/ghostty.config ~/Library/Application\ Support/com.mitchellh.ghostty/config
fi
