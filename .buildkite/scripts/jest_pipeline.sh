#!/bin/bash

# exit immediately on failure, or if an undefined variable is used
set -eu

# begin the pipeline.yml file
echo "steps:"

# TODO: add x-pack src
find packages -name jest.config.js | while read file; do
cat << EOF
  - command: "buildkite-agent artifact download Dockerfile . && docker run -it "tylersmalley/kibana-ci:kibana-kibana-build-$BUILDKITE_BUILD_NUMBER" node --expose-gc ./node_modules/.bin/jest --logHeapUsage --runInBand --config $file"
EOF
done