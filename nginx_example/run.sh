#!/usr/bin/env bash

set -euo pipefail

QEMU_NET_OPTS=hostfwd=tcp::8080-:80 ./result/bin/run-hello-vm 
