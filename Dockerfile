FROM node:14.15.4-alpine

# RUN apt -qqy update
RUN apk add --no-cache curl unzip python3 git build-base

# TODO: Check Basil version instead of looking at installed NPM global packages
# RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/v1.7.3/bazelisk-linux-amd64 && \
#     chown root:root /usr/local/bin/bazel && \
#     chmod 0755 /usr/local/bin/bazel

RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel-4.0.0-linux-x86_64 && \
    chown root:root /usr/local/bin/bazel && \
    chmod 0755 /usr/local/bin/bazel

WORKDIR /kibana

# Node Modules
COPY .node-version package.json yarn.lock preinstall_check.js .yarnrc ./
RUN --mount=type=cache,target=/kibana/.yarn-local-mirror yarn install

COPY . .

