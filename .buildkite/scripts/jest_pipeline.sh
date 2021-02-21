#!/bin/bash

set -eu

echo "steps:"

# TODO: add x-pack src
find packages -name jest.config.js | while read file; do
cat << EOF
  - command: "buildkite-agent artifact download Dockerfile . && date"
    label: ":jest:"
EOF
done