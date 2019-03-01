#!/bin/sh

set -eux

# Reset checkout
for f in omero-*/build.gradle; do (cd $(dirname $f) && git checkout .); done

# Disable javadoc
for f in omero-*/build.gradle; do printf '\ntasks.withType(Javadoc).all { enabled = false }\n' >> $f; done

# Include gitlab publish config
for f in omero-*/build.gradle; do printf '\n\napply from: "../gitlab/publish.gradle"\n' >> $f; done

# OS X: Use gsed
SED=gsed
gsed --version || SED=sed
# Add https://gitlab.com/manics/omero-gradle-plugins/-/packages
for f in omero-*/settings.gradle; do $SED -i '/gradlePluginPortal()/ a maven {\n url "https://gitlab.com/api/v4/projects/manics%2Fomero-gradle-plugins/packages/maven"\n credentials(HttpHeaderCredentials) {\n name = "Job-Token"\n value = System.getenv("CI_JOB_TOKEN") }\n authentication { header(HttpHeaderAuthentication) }\n }' $f; done
