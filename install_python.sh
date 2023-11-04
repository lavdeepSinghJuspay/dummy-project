#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Check if brew is installed, if not, try to install Python using the system package manager

elif [ -x "$(command -v brew)" ]; then
    echo "Using Homebrew to install Python..."
    brew install python
else
    echo "Using system package manager to install Python..."
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get install python3
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install python3
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install python3
    else
        echo "System package manager not found or not supported. Please install Python manually."
    fi
fi

# Verify Python and pip versions
python3 --version
pip3 --version

# Install Python dependencies from requirements.txt
pip3 install -r requirements.txt

