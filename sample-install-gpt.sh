#!/bin/bash

# List of packages to install
packages=("package1" "package2" "package3")

# Function to print in green color (success)
print_success() {
    echo -e "\033[0;32m$1\033[0m"  # Green color
}

# Function to print in red color (failure)
print_failure() {
    echo -e "\033[0;31m$1\033[0m"  # Red color
}

# Iterate over each package and install it with root privileges
for pkg in "${packages[@]}"; do
    sudo apt install "$pkg"
    if [ $? -eq 0 ]; then
        print_success "Successfully installed $pkg"
    else
        print_failure "Failed to install $pkg"
    fi
done
