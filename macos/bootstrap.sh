#!/usr/bin/env bash

set -e

# Inspired by https://github.com/simme/dotfiles

# Ask for an admin password upfront
sudo -v

# Install Oh My Zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install rbenv
brew install rbenv

# Download dotfiles
DOTS=~/.dotfiles
git clone https://github.com/elhoyos/dotfiles.git $DOTS

# Install dotfiles
MACOS_DOTS=$DOTS/macos
ln -s $MACOS_DOTS/.zshrc ~/.zshrc
ln -s $MACOS_DOTS/.rbenv/default-gems ~/.rbenv/default-gems

# Load macos preferences
$MACOS_DOTS/preferences.sh
