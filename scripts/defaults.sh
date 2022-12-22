#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Creating defaults"
# ------------------------------------------------------------------------------

e_message "Displaying hidden Finder files/folders"
defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder

e_message "Installing xcode-select (CLI tools)"
xcode-select --install
test_command "xcode-select"

if ! has_command "brew"; then
  e_message  "Installing brew (Homebrew)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if has_arm; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'>>$HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew doctor
  brew tap homebrew/cask-fonts
  test_command "brew"
fi

brew 'mas'

tap 'adoptopenjdk/openjdk'
cask 'adoptopenjdk11'

# ------------------------------------------------------------------------------
e_message "Defaults complete"
# ------------------------------------------------------------------------------
