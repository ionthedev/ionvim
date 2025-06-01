#!/bin/bash

# This script cleans Neovim cache and state directories.

echo "Cleaning Neovim cache and state..."

# Remove cache directory
echo "Removing ~/.cache/nvim..."
rm -rf ~/.cache/nvim

# Remove local share directory (includes shada, swap files, etc.)
echo "Removing ~/.local/share/nvim..."
rm -rf ~/.local/share/nvim

# Remove local state directory (newer Neovim versions)
echo "Removing ~/.local/state/nvim..."
rm -rf ~/.local/state/nvim

echo "Neovim cache and state cleaned successfully." 