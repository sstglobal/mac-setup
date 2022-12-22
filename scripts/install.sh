#!/bin/bash

source _utils.sh

clear

# ------------------------------------------------------------------------------
e_message "Starting Mac setup"
# ------------------------------------------------------------------------------

source defaults.sh
source tools.sh
source casks.sh
source optimizations.sh
source summary.sh

# Install Flutter
e_message "Install Flutter"

chmod 755 ./flutter/install.sh
./flutter/install.sh

# Install xcode
e_message "Install Xcode"
chmod 755 ./xcode/install.sh
./xcode/install.sh

# ------------------------------------------------------------------------------
e_message "Mac setup completed"
# ------------------------------------------------------------------------------
