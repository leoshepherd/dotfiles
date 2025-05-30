#!/usr/bin/env bash

echo "Beginning dotfile setup install"

tmux_conf_file=/home/$USER/.tmux.conf
nvim_conf_dir=/home/$USER/.config/nvim
SOURCE_DIR=$(dirname $(realpath ${0}))

if [ "$USER" = "root" ]; then
    echo "Cannot perform install as root. Exiting..."
    exit 1
fi

command -v nvim >/dev/null

echo "Checking neovim installation..."
if [[ $? -ne 0 ]]; then
    echo "Nvim is not installed"
else
    # listen here you lazy fuck, fix this eventually (Technically works)
    nvim_version=$(nvim -version | head -1 | awk -F 'v' '{print $2}' |awk -F '.' '{print $1$2$3}')

    if (( $(echo "$nvim_version < 90 " | bc) )); then
        echo "Insufficient version of Nvim is installed (version < .9)"
        if command -v apt &> /dev/null; then
          echo "APT"
        elif command -v yum &> /dev/null; then
          echo "YUM"
        elif command -v dnf &> /dev/null; then
          echo "DNF"
        elif command -v pacman &> /dev/null; then
          echo "Pacman"
        elif command -v zypper &> /dev/null; then
          echo "Zypper"
        else
          echo "Unknown package manager"
        fi
    else
        echo "Nvim version 0.9 or greater is installed"
    fi
fi

echo "Searching for neovim config directory..."
if [[ -d $nvim_conf_dir ]]; then
    echo "Directory found! Skipping nvim config install"
else
    echo "No nvim config directory found, creating symlink..."
    ln -s $SOURCE_DIR/.config/nvim $nvim_conf_dir
    if [ -L "$nvim_conf_dir" ]; then
        # Symlink exists, check if it's valid
        if [ -e "$nvim_conf_dir" ]; then
          echo "Symlink created successfully and is valid."
        else
          echo "Symlink created, but it is broken (points to a non-existent target)."
        fi
    else
    echo "Failed to create symlink."
    fi
fi

echo "Searching for tmux config file..."
if [[ -f $tmux_conf_file ]]; then
    echo "File found! Skipping tmux config install"
else
    echo "No tmux config file found, creating symlink..."
    ln -s $SOURCE_DIR/.tmux.conf $tmux_conf_file
    if [ -L "$tmux_conf_file" ]; then
        # Symlink exists, check if it's valid
        if [ -e "$tmux_conf_file" ]; then
          echo "Symlink created successfully and is valid."
        else
          echo "Symlink created, but it is broken (points to a non-existent target)."
        fi
    else
    echo "Failed to create symlink."
    fi
fi
