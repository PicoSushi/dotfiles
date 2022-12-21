#!/bin/bash

set -eux
ssh-keygen -C "${EMAIL}" -f "$HOME/.ssh/id_ed25519.$(whoami).$(hostname).$(date +%Y-%m-%d)" -t ed25519
