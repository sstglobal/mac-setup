#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Running optimizations"
# ------------------------------------------------------------------------------

e_message  "Re-sorting Launchpad applications"
defaults write com.apple.dock ResetLaunchPad -boolean true
killall Dock

if has_command "zsh"; then
  if has_path ".oh-my-zsh"; then
    e_message  "Updating oh-my-zsh"
    $ZSH/tools/upgrade.sh
    test_path ".oh-my-zsh"
  fi
fi

if has_command "brew"; then
  e_message  "Running brew update"
  brew update
  e_message  "Running brew upgrade"
  brew upgrade
  e_message  "Running brew doctor"
  brew doctor
  e_message  "Running brew cleanup"
  brew cleanup
fi

# ------------------------------------------------------------------------------
e_message "Optimizations complete"
# ------------------------------------------------------------------------------
