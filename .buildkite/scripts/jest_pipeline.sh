#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# cd ../..

# begin the pipeline.yml file
echo "steps:"

# TODO: add x-pack src
find packages -name jest.config.js | while read file; do
cat << EOF
- label: ":jest:"
  command: "node --expose-gc ./node_modules/.bin/jest --logHeapUsage --runInBand --config $file"
  plugins:
  - docker-compose#v3.7.0:
      run: kibana
EOF
done