#!/usr/bin/env bash
# exit on error
set -e

echo "=== 1. Creating Pharo Workspace ==="
PHARO_DIR="$HOME/pharo"
mkdir -p "$PHARO_DIR"
cd "$PHARO_DIR"

echo "=== 2. Installing Linux Graphics Libraries for Pharo ==="
# These are essential for Pharo's graphics engine to run headlessly under X11/VNC
sudo apt-get update -y
sudo apt-get install -y \
    curl \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libpixman-1-0 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6

echo "=== 3. Downloading Pharo 12 Image & VM ==="
# Fetches the latest Pharo 12 zero-conf bundle 
curl -L https://pharo.org | bash

echo "=== 4. Creating Dedicated VNC Launcher ==="
# This forces Pharo to bind directly to the virtual display server (:1) used by desktop-lite
cat << 'EOF' > launch-vnc.sh
#!/usr/bin/env bash
cd "$HOME/pharo"

# Bind to the virtual display port used by the devcontainer feature
export DISPLAY=:1

echo "Starting Pharo Graphical Image on VNC Display :1..."
./pharo-ui Pharo.image &
EOF

chmod +x launch-vnc.sh

echo "================================================================"
echo " Setup complete! "
echo " Inside your Codespace terminal, run: ~/pharo/launch-vnc.sh"
echo " Then, open the port 6080 tab to see your live Pharo desktop."
echo "================================================================"
