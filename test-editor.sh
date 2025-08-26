#!/bin/bash

# Test script for WayNotes editor functionality

echo "Testing WayNotes editor functionality..."
echo "======================================"

# Test if nvim is available
if command -v nvim >/dev/null 2>&1; then
    echo "✅ nvim is available"
else
    echo "❌ nvim not found"
fi

# Test if terminal emulators are available
echo ""
echo "Terminal emulators:"
if command -v alacritty >/dev/null 2>&1; then
    echo "✅ alacritty available"
fi
if command -v kitty >/dev/null 2>&1; then
    echo "✅ kitty available"
fi
if command -v gnome-terminal >/dev/null 2>&1; then
    echo "✅ gnome-terminal available"
fi
if command -v xterm >/dev/null 2>&1; then
    echo "✅ xterm available"
fi

# Test the waybar-notes click function
echo ""
echo "Testing waybar-notes click 2 (middle click):"
waybar-notes click 2

echo ""
echo "Test completed!"

