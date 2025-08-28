#!/bin/bash

# WayNotes Installation Script
# This script installs WayNotes manually on your system

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script should not be run as root"
    exit 1
fi

# Installation paths
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.config/waynotes"
NOTES_DIR="$HOME/.local/share/waynotes"

print_status "Installing WayNotes..."

# Create necessary directories
print_status "Creating directories..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$NOTES_DIR"

# Copy scripts
print_status "Installing scripts..."
if [[ -f "bin/note" ]]; then
    sudo cp bin/note "$INSTALL_DIR/"
    sudo chmod +x "$INSTALL_DIR/note"
    print_success "Installed note command"
else
    print_error "bin/note not found"
    exit 1
fi

if [[ -f "bin/waybar-notes" ]]; then
    sudo cp bin/waybar-notes "$INSTALL_DIR/"
    sudo chmod +x "$INSTALL_DIR/waybar-notes"
    print_success "Installed waybar-notes command"
else
    print_error "bin/waybar-notes not found"
    exit 1
fi

# Create default configuration
if [[ ! -f "$CONFIG_DIR/config" ]]; then
    print_status "Creating default configuration..."
    cat > "$CONFIG_DIR/config" << 'EOF'
# WayNotes Configuration File

# Note storage directory
NOTES_DIR="$HOME/.local/share/waynotes"

# Maximum number of notes to keep
MAX_NOTES=100

# Note prefix for general notes
NOTE_PREFIX="*"

# Waybar display settings
MAX_DISPLAY_NOTES=5
CYCLE_INTERVAL=5
MARQUEE_SPEED=0.1
MAX_LENGTH=50
SEPARATOR=" | "
EOF
    print_success "Created configuration file at $CONFIG_DIR/config"
else
    print_warning "Configuration file already exists at $CONFIG_DIR/config"
fi

# Test installation
print_status "Testing installation..."
if command -v note >/dev/null 2>&1; then
    print_success "note command is available"
else
    print_error "note command not found in PATH"
    exit 1
fi

if command -v waybar-notes >/dev/null 2>&1; then
    print_success "waybar-notes command is available"
else
    print_error "waybar-notes command not found in PATH"
    exit 1
fi

# Test basic functionality
print_status "Testing basic functionality..."
note "Installation test note" >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
    print_success "Basic note functionality works"
else
    print_error "Basic note functionality failed"
    exit 1
fi

print_success "WayNotes installation completed successfully!"
echo ""
echo "Quick start:"
echo "  note 'Hello World'     # Add a note"
echo "  note -l                # List recent notes"
echo "  note -s 'search'       # Search notes"
echo ""
echo "For waybar integration, add this to your waybar config:"
echo "  \"custom/waynotes\": {"
echo "    \"exec\": \"waybar-notes display cycle\","
echo "    \"on-click\": \"waybar-notes click 1\","
echo "    \"interval\": 5"
echo "  }"
echo ""
echo "Configuration:"
echo "  Edit $CONFIG_DIR/config to customize settings"
echo ""
echo "Documentation:"
echo "  See README.md for detailed usage instructions"
