#!/bin/bash

set -euxo pipefail

# Read script parameters
WEB_URL=${WEB_URL:-https://the-internet.herokuapp.com/}
ADMIN_USERNAME=${ADMIN_USERNAME:-tomsmith}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-SuperSecretPassword!}

# Clean previous test results
rm -rf reports/
mkdir -m 777 reports

GID=`id -g`

# Execute tests using docker
docker run --rm \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/web:/opt/robotframework/web:Z \
    -v /dev/shm:/dev/shm \
    -e ROBOT_THREADS=5 \
    -e ROBOT_OPTIONS="-v url:${WEB_URL} -v browser:headlesschrome -v admin:${ADMIN_USERNAME} -v admin_password:${ADMIN_PASSWORD}" \
    -e ROBOT_TESTS_DIR="/opt/robotframework/web/tests" \
    -e ROBOT_UID=${UID} \
    -e ROBOT_GID=${GID} \
    --user ${UID}:${GID} \
    --shm-size=4g \
    ppodgorsek/robot-framework:latest