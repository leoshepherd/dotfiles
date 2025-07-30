#!/usr/bin/env bash

function install_nvim() {
    if command -v apt &> /dev/null; then
      echo "APT"
      exit 0
    elif command -v dnf &> /dev/null; then
      echo "DNF"
      exit 0
    elif command -v yum &> /dev/null; then
      echo "YUM"
      exit 0
    elif command -v pacman &> /dev/null; then
      echo "Pacman"
      exit 0
    elif command -v zypper &> /dev/null; then
      echo "Zypper"
      exit 0
    else
      echo "Unknown package manager"
      exit 1
    fi
}

echo "Beginning dotfile setup install"

tmux_conf_file=/home/$USER/.tmux.conf
nvim_conf_dir=/home/$USER/.config/nvim
SOURCE_DIR=$(dirname $(realpath ${0}))

if [ "$USER" = "root" ]; then
    echo "Cannot perform install as root. Exiting..."
    exit 1
fi

echo "Checking neovim installation..."
if command -v nvim >/dev/null; then
#    echo "Nvim is Installed, continuing to version check..."
#else
    echo "Nvim is not installed!"
    read -p "Would you like to attempt package manager installation? (y/n) " response
    case "$response" in 
        [yY] | [yY][eE][sS])
            echo "Attempting install of Nvim"
            # install nvim
            install_nvim
            ;;
        [nN] | [nN][oO])
            echo "Skipping install"
            ;;
        *)
            echo "Invalid input. Skipping install"
            ;;
    esac
    # listen here you lazy fuck, fix this eventually (Technically works)
    nvim_version=$(nvim -version | head -1 | awk -F 'v' '{print $2}' |awk -F '.' '{print $1$2$3}')

    if (( $(echo "$nvim_version < 90 " | bc) )); then
        echo "Insufficient version of Nvim is installed (version < .9)"
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

