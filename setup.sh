#! /bin/sh

# Install my environment
# Assumes to be run from root directory of the env repository,
# i.e. the place it is located

set -ex
SOURCE_DIR=`pwd`

# Dot files
cd ${SOURCE_DIR}/dot
DOT_DIR=`pwd`
for f in ${DOT_DIR}/*; do
    bf=`basename $f`
    case "$bf" in
        "ssh")
            # Skip...handled below
            ;;
        *)
            [ -f ~/.$bf -o -d ~/.$bf -o -L ~/.$bf ] && rm -f ~/.$bf
            ln -s $f ~/.$bf
            ;;
    esac
done

# Handle ssh config
cd ${SOURCE_DIR}/dot/ssh
SSH_DIR=`pwd`
mkdir -p ~/.ssh
for f in ${SSH_DIR}/*; do
    bf=`basename $f`
    [ -f ~/.ssh/$bf -o -L ~/.ssh/$bf ] && rm -f ~/.ssh/$bf
    ln -s $f ~/.ssh/$bf
done

# Tools
cd ${SOURCE_DIR}/tools/bin
TOOLS_DIR=`pwd`
mkdir -p ~/tools/bin
for f in ${TOOLS_DIR}/*; do
    bf=`basename $f`
    [ -f ~/tools/bin/$bf -o -L ~/tools/bin/$bf ] && rm -f ~/tools/bin/$bf
    ln -s $f ~/tools/bin/$bf
done

# Misc

# iterm preferences
[ -f ~/Library/Preferences/com.googlecode.iterm2.plist ] && \
    rm ~/Library/Preferences/com.googlecode.iterm2.plist
ln -s ${SOURCE_DIR}/misc/com.googlecode.iterm2.plist ~/Library/Preferences/
# Update them
defaults read com.googlecode.iterm2
