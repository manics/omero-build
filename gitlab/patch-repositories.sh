#!/bin/sh

set -eux

# Reset checkout
for f in omero-*/build.gradle; do (cd $(dirname $f) && git checkout .); done

# Disable javadoc
for f in omero-*/build.gradle; do printf '\ntasks.withType(Javadoc).all { enabled = false }\n' >> $f; done

# Include gitlab publish config
for f in omero-*/build.gradle; do printf '\n\napply from: "../gitlab/publish.gradle"\n' >> $f; done
