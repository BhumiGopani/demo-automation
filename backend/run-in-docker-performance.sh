#!/bin/bash

set -euo pipefail

baseurl=${baseurl:-https://api.chucknorris.io}

# Clean previous test results
rm -rf reports/

# Remove karate configuration from previous runs
rm -f src/test/java/karate-config.js

# Replace environment variables and create karate configuration file
sed -e "s|BASE_URL|${baseurl}|" \
src/test/java/karate-config.template.js > src/test/java/karate-config.js

# Execute api performance tests using docker
docker run --rm \
    -v `pwd`:/usr/src/app:Z \
    -w /usr/src/app \
    --shm-size=4g \
    maven:3-jdk-8-slim mvn clean test-compile gatling:test
