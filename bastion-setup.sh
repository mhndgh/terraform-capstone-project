#!/bin/bash

sudo apt-get update -yy
sudo apt-get install -yy git curl

# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.320.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-linux-x64-2.320.0.tar.gz
# Optional: Validate the hash
echo "93ac1b7ce743ee85b5d386f5c1787385ef07b3d7c728ff66ce0d3813d5f46900  actions-runner-linux-x64-2.320.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.320.0.tar.gz

# Create the runner and start the configuration experience
RUNNER_ALLOW_RUNASROOT=1 ./config.sh \
--url https://github.com/mhndgh/capstone-project \
--token AV4XQRB2QOFNZIR5YPPN6OTHELATG \
--name "runner" \
--labels "self-hosted" \
--runnergroup "default" \
--unattended \
--replace \
--work

# Last step, run it!
RUNNER_ALLOW_RUNASROOT=1 ./run.sh