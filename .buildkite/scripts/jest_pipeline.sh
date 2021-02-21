#!/bin/bash

set -eu

echo "steps:"

find src packages x-pack -name jest.config.js | while read file; do
cat << EOF
  - label: ":jest:"
    command: "docker run -it \"tylersmalley/kibana-ci:kibana-kibana-build-$BUILDKITE_BUILD_NUMBER\" node --expose-gc ./node_modules/.bin/jest --logHeapUsage --runInBand --config $file"
    plugins:
      - 'uber-workflow/run-without-clone':
EOF
done