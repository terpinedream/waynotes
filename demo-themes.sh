#!/usr/bin/env bash

# WayNotes Theme Demo Script
# Showcases the theme switching functionality

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${CYAN}WayNotes Theme Demo${NC}"
echo "===================="
echo ""

echo -e "${YELLOW}This demo will showcase the theme switching functionality:${NC}"
echo ""

# Test 1: List themes
echo -e "${GREEN}1. Listing available themes:${NC}"
./bin/note --list-themes | head -n 10
echo ""

# Test 2: Show theme switching
echo -e "${GREEN}2. Testing theme switching:${NC}"
echo -e "${YELLOW}Switching to glass theme...${NC}"
./bin/note --theme glass
echo ""

# Test 3: Show convenience script
echo -e "${GREEN}3. Testing convenience script:${NC}"
echo -e "${YELLOW}Checking theme status...${NC}"
./bin/note-theme --status
echo ""

# Test 4: Show help
echo -e "${GREEN}4. Theme switching help:${NC}"
./bin/note --help | grep -A 10 "Theme Examples"
echo ""

echo -e "${CYAN}Demo completed!${NC}"
echo ""
echo -e "${YELLOW}Try these commands:${NC}"
echo "  ./bin/note --theme neon-green"
echo "  ./bin/note --theme sunset"
echo "  ./bin/note-theme glass"
echo "  ./bin/note --list-themes"
echo ""
echo -e "${GREEN}All themes are safe and won't crash waybar!${NC}"
