#!/usr/bin/env bash

echo "Beginning dotfile setup install"

tmux_conf_file=~/.tmux.conf
nvim_conf_dir=~/.config/nvim
SOURCE_DIR=$(dirname $(realpath ${0}))

command -v nvim >/dev/null

echo "Checking neovim installation..."
if [[ $? -ne 0 ]]; then
    echo "Nvim is not installed"
else
    # listen here you lazy fuck, fix this eventually (Technically works)
    nvim_version=$(nvim -version | head -1 | awk -F 'v' '{print $2}' |awk -F '.' '{print $1$2$3}')

    if (( $(echo "$nvim_version < 90 " | bc) )); then
        echo "Wrong version of Nvim is installed"
        # TODO attempt to install correct neovim version
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
