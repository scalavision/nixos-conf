#!/usr/bin/env bash

set -euo pipefail

nixos-rebuild -I nixos-config=$PWD/nginx_example.nix build-vm