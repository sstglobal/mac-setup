#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_message "Checking tools"
# ------------------------------------------------------------------------------

# install font
cp -a ./fonts/. ~/Library/Fonts

if has_command "brew"; then
  if ! has_command "watchman"; then
    e_message  "Installing watchman"
    brew install watchman
    test_command "watchman"
  fi
fi

if has_command "brew"; then
  if ! has_command "trash"; then
    e_message  "Installing trash"
    brew install trash
    test_command "trash"
  fi
fi

if has_command "brew"; then
  if ! has_command "git"; then
    e_message  "Installing git"
    brew install git
    test_command "git"
  fi
fi

if has_command "brew"; then
  if ! has_command "git-flow"; then
    e_message  "Installing git-flow"
    brew install git-flow
    test_command "git-flow"
  fi
fi

if has_command "brew"; then
  if ! has_command "zsh"; then
    e_message  "Installing zsh"
    brew install zsh
    test_command "zsh"
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    e_message  "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    test_path ".oh-my-zsh"
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    e_message  "Installing powerlevel10k"
    brew install romkatv/powerlevel10k/powerlevel10k
    echo '# Theme configuration: PowerLevel10K' >> ~/.zshrc
    echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
    echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
    echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
    test_brew "powerlevel10k"
    p10k configure
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-autosuggestions"; then
    e_message  "Installing zsh-autosuggestions"
    brew install zsh-autosuggestions
    echo "# Fish shell-like fast/unobtrusive autosuggestions for Zsh." >> ~/.zshrc
    echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
    test_brew "zsh-autosuggestions"
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "zsh-syntax-highlighting"; then
    e_message  "Installing zsh-syntax-highlighting"
    brew install zsh-syntax-highlighting
    echo "# Fish shell-like syntax highlighting for Zsh." >> ~/.zshrc
    echo "# Warning: Must be last sourced!" >> ~/.zshrc
    echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    test_brew "zsh-syntax-highlighting"
  fi
fi

if has_command "brew"; then
  if ! has_command "node"; then
    e_message  "Installing node"
    brew install node
    test_command "node"
  fi
fi

if has_command "brew"; then
  if ! has_command "n"; then
    e_message  "Installing n"
    brew install n
    test_command "n"
  fi
fi

if has_command "brew"; then
  if ! has_command "nvm"; then
    e_message  "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    test_command "nvm"
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    e_message  "Installing yarn"
    brew install yarn
    test_command "yarn"
  fi
fi

if has_command "brew"; then
  if ! has_command "pnpm"; then
    e_message  "Installing pnpm"
    brew install pnpm
    test_command "pnpm"
  fi
fi

if has_command 'npm'; then
  e_message  "Upgrading npm"
  npm install --location=global npm@latest
  test_command "npm"
fi

if has_command "npm"; then
  e_message  "Installing/Upgrading serve"
  npm install --location=global serve@latest
  test_command "serve"
fi

e_message  "Installing react native"
npm install --location=global react-native-cli

# ------------------------------------------------------------------------------
e_message "Tools complete"
# ------------------------------------------------------------------------------
