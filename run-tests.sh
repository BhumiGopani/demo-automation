#!/bin/sh

# Read script parameters
WEB_URL=${WEB_URL:-https://the-internet.herokuapp.com/}
baseurl=${baseurl:-https://api.chucknorris.io}

if [ "$1" == "frontend" ]; then
  echo "=============================================================================="
  echo "Frontend Tests"
  echo "=============================================================================="

  echo "Cleaning previous test results..."
  cd frontend
  rm -rf reports/
  ./prepare.sh

  echo "Running test cases..."
  robot -d reports \
    -v url:"${WEB_URL}" \
    -v browser:headlesschrome \
    web/tests
    
elif [ "$1" == 'backend' ]; then
  echo "=============================================================================="
  echo "Backend Tests"
  echo "=============================================================================="

  cd backend

  # Remove karate configuration from previous runs
  rm src/test/java/karate-config.js

  # Replace environment variables and create karate configuration file
  sed -e "s|BASE_URL|${baseurl}|" \
    src/test/java/karate-config.template.js > src/test/java/karate-config.js

  # Clean generated files and run tests
  mvn clean test
else
  echo "Please give input for test type [frontend, backend]"
fi