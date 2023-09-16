#!/usr/bin/env bash
# Install hadolint

wget https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
sudo mv hadolint-Linux-x86_64 /usr/local/bin/hadolint
chmod +x /usr/local/bin/hadolint
hadolint --version