# Pharo Dev Remote

This workspace provides a Pharo Smalltalk IDE in an Ubuntu development container.

## Start the IDE

1. Open the folder in VS Code with the Dev Containers extension installed.
2. Run **Dev Containers: Rebuild and Reopen in Container**.
3. Open the forwarded **Pharo Desktop UI** port (`6080`) when VS Code offers it.

The container installs the official 64-bit Pharo VM for the non-root user and opens
the checked-in `Pharo.image` automatically. The noVNC password is `pharo`.

The Pharo VM is stored in `~/.local/pharo`, while the image, changes file, and
sources file remain in the workspace so they can be versioned or replaced normally.