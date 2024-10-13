#! /bin/sh

D=$(date -u "+%Y-%m-%dT%H:%M:%SZ")
LD=~/tmp/backup-logs
LF="to-nas-${D}-dry.log"

DRY=-n
if [ $# -gt 0 ]; then
    DRY=
    LF="to-nas-${D}.log"
fi

mkdir -p ${LD}
{
    echo "=== rsync docs"
    rsync ${DRY} -av --delete ~/Desktop/docs/ qnas:/share/rn/docs/

    echo "\n=== rsync music"
    rsync ${DRY} -av --delete ~/m/ qnas:/share/rn/music/

    echo "\n=== rsync misc"
    rsync ${DRY} -av --delete ~/misc/ qnas:/share/rn/misc/

    echo "\n=== rsync photos"
    rsync ${DRY} -av --delete \
          --exclude=Lightroom/Lightroom\ Catalog\ Previews.lrdata \
          --exclude=Lightroom/Lightroom\ 5\ Catalog\ Previews.lrdata \
          --exclude=Lightroom/Lightroom\ Catalog-v13\ Previews.lrdata \
          --exclude=Lightroom/Lightroom\ Catalog-v13-3\ Previews.lrdata \
          --exclude=Lightroom/Lightroom\ Catalog-v13\ Smart\ Previews.lrdata \
          ~/Desktop/photos/LightRoom/ \
          qnas:/share/rn/photos 

} 2>&1 | tee ${LD}/${LF}
