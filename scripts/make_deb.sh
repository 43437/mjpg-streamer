#!/bin/sh

# update via git 
git pull

# find out the current revision
GITVERSION="$(export LANG=C && export LC_ALL=C && echo $(git describe --always --dirty)))"

# use checkinstall to create the DEB package
sudo checkinstall -D \
                  --pkgname "mjpg-streamer" \
                  --pkgversion "r$GITVERSION" \
                  --pkgrelease "1" \
                  --maintainer "tom_stoeveken@users.sourceforge.net" \
                  --requires "libjpeg62" \
                  --nodoc \
                    make DESTDIR=/usr install
