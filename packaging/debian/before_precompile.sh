#!/bin/sh
# This script copies the necessary .yml and .rb config files, based on the
# .example files.
#
# It also starts a postgresql and redis server, which are required for certain
# rake tasks (like asset precompilation).

set -e

for file in config/*.example; do
  cp -v $file config/$(basename $file .example)
done

cp -v config/database.yml{.postgresql,}

sudo service postgresql start
sudo service redis-server start
