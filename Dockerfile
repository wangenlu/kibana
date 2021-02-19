FROM gcr.io/elastic-kibana-184716/buildkite/base

WORKDIR /kibana

# Node Modules

COPY .node-version package.json yarn.lock preinstall_check.js .yarnrc ./
# RUN --mount=type=cache,target=/kibana/.yarn-local-mirror yarn install
RUN yarn install

# Not ideal: We should be able to bootstrap before adding all repo
COPY . .

RUN yarn kbn bootstrap --no-cache
