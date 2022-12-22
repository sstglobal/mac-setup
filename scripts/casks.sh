#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking applications/casks"
# ------------------------------------------------------------------------------

declare -a cask_name=(
"font-jetbrains-mono-nerd-font"
)

declare -a cask_desc=(
"JetBrains Mono Nerd Font"
)

declare -a app_name=(
"1password"
"figma"
"google-chrome"
"insomnia"
"iterm2"
"rectangle"
"slack"
"sourcetree"
"spotify"
"visual-studio-code"
"xampp"
"postman"
"microsoft-edge"
"firefox"
"skype"
"ngrok"
"android-studio"
"unity"
)

declare -a app_desc=(
"1Password 7"
"Figma"
"Google Chrome"
"Insomnia"
"iTerm"
"Rectangle"
"Slack"
"Sourcetree"
"Spotify"
"Visual Studio Code"
"Xampp"
"Postman"
"Microsoft Edge"
"Firefox"
"Skype"
"Ngrok"
"Android Studio"
"Unity"
)

if has_command "brew"; then
  for i in "${!cask_name[@]}"; do
    DESC=${cask_desc[$i]}
    NAME=${cask_name[$i]}
    test_cask "$DESC"
    if ! has_cask "$DESC"; then
      e_message  "Installing $NAME"
      brew install --cask $NAME
      test_cask "$DESC"
    fi
  done
  for i in "${!app_name[@]}"; do
    DESC=${app_desc[$i]}
    NAME=${app_name[$i]}
    test_app "$DESC"
    if ! has_app "$DESC"; then
      e_message  "Installing $NAME"
      brew install --cask $NAME
      test_app "$DESC"
    fi
  done
fi

# ------------------------------------------------------------------------------
e_message "Applications/Casks complete"
# ------------------------------------------------------------------------------
