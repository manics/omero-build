#!/bin/sh

set -eux

for f in omero-*/build.gradle; do (cd $(dirname $f) && git checkout .); done
for f in omero-*/build.gradle; do echo '\n\napply from: "../gitlab/publish.gradle"' >> $f; done
