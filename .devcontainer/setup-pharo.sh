#!/bin/bash
echo "=== Downloading Pharo 64-bit Linux VM and Image ==="
curl https://get.pharo.org/64/ | bash
#wget -qO- https://get.pharo.org/64/150 | bash

echo "=== Ensuring permissions are correct ==="
chmod +x pharo
chmod +x pharo-ui

echo "=== Pharo setup complete! ==="
