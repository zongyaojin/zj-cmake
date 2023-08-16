#!/bin/bash

# https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
set -euxo pipefail

# Script absolute path
script_abs_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Install system-level package managment dependencies
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y autoconf build-essential git libtool pkg-config shfmt wget
sudo apt install -y cmake

# Install python dependencies
sudo apt install -y python3-pip
pip install --upgrade pip setuptools
pip install --user cmakelang pre-commit isort
