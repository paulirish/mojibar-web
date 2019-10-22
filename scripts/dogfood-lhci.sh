#!/bin/bash

set -eox pipefail

# Install LHCI
npm install -g @lhci/cli@next
# Start up a local webserve
yarn serve
# Wait for the server to start
sleep 2
lhci collect --url=http://localhost:8054/index.html
# Upload the results to the server with a 7day TTL
lhci upload --target=temporary-public-storage

# Kill the static server from earlier.
kill $!
