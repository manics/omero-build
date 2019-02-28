#!/bin/sh

set -eux

#for f in ../omero-*/build.gradle; do patch $f build-gradle.patch; done
for f in ../omero-*/build.gradle; do (cd $(dirname $f) && git checkout .); done
#for f in ../omero-*/build.gradle; do cat publishing-gradle.txt >> $f; done
for f in ../omero-*/build.gradle; do echo '\n\napply from: "../gitlab/publish.gradle"' >> $f; done
