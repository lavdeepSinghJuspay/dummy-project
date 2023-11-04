#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

pip install -r requirements.txt

# Install Python 3
brew install python@3

# Verify the installation
python3 --version
pip3 --version
