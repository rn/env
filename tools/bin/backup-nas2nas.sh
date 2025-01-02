#! /bin/sh

# Backup NAS home directory to the NAS restic volume. To be executed on the NAS

cd /share/rn
export TMPDIR=~/tmp/restic

restic backup -v -r /share/backup-restic/rn --json --exclude="*.lrprev" --exclude="dovecot.index.cache" docs photos music work .Maildir email-archive 
