# Mac setup scripts

> A macOS setup guide specific for development.

## Guided Setup

For a guided setup, open up **Terminal.app** and run the following command:

1. Save repo to `~/Downloads` folder:
   ```sh
   git clone https://github.com/sstglobal/mac-setup.git ~/Downloads/mac-setup && \
   cd ~/Downloads/mac-setup/scripts
   ```
2. Run the installer script.
   ```sh
   sh install.sh
   ```
   **OR** Run the installer scripts individually:
   ```sh
   sh defaults.sh
   sh tools.sh
   sh casks.sh
   sh optimizations.sh
   sh summary.sh
   ```

🔥 The scripts auto-skip prompts for items already installed. **Recommended:** Rerun as many times as needed.