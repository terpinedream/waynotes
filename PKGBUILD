# Maintainer: Your Name <your.email@example.com>
# Contributor: WayNotes Team
pkgname=noteticker
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal note-taking system with waybar integration and marquee display"
arch=('any')
url="https://github.com/yourusername/noteticker"
license=('MIT')
depends=('bash' 'coreutils' 'sed' 'grep' 'wc')
optdepends=('waybar: For waybar module integration' 'nano: Default text editor' 'vim: Alternative text editor' 'xclip: For clipboard capture support' 'xsel: Alternative clipboard tool' 'wl-clipboard: Wayland clipboard support')
makedepends=()
provides=('note' 'waybar-notes')
conflicts=()
replaces=()
backup=('etc/waynotes/config')
source=()
noextract=()
md5sums=()
sha256sums=()

package() {
    # Create package directory structure
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -dm755 "$pkgdir/etc/waynotes"
    
    # Install main scripts
    install -Dm755 "$srcdir/bin/note" "$pkgdir/usr/bin/note"
    install -Dm755 "$srcdir/bin/waybar-notes" "$pkgdir/usr/bin/waybar-notes"
    install -Dm755 "$srcdir/bin/waybar-notes-helper" "$pkgdir/usr/bin/waybar-notes-helper"
    
    # Install documentation
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install default configuration
    cat > "$pkgdir/etc/waynotes/config" << 'EOF'
# WayNotes Configuration File
# Copy this to ~/.config/waynotes/config to customize

# Note storage directory
# NOTES_DIR="$HOME/.local/share/waynotes"

# Maximum number of notes to keep
# MAX_NOTES=100

# Note prefix for general notes
# NOTE_PREFIX="📝"

# Waybar display settings
# MAX_DISPLAY_NOTES=5
# CYCLE_INTERVAL=5
# MARQUEE_SPEED=0.1
# MAX_LENGTH=50
# SEPARATOR=" | "
EOF
    
    # Create post-install message
    cat > "$pkgdir/usr/share/doc/$pkgname/INSTALL" << 'EOF'
WayNotes Installation Complete!

Quick Start:
1. Add notes: note "Your note here"
2. List notes: note -l
3. Search notes: note -s "search term"

Waybar Integration:
Add this to your waybar config:

"custom/waynotes": {
    "exec": "waybar-notes display cycle",
    "on-click": "waybar-notes click 1",
    "on-click-middle": "waybar-notes click 2", 
    "on-click-right": "waybar-notes click 3",
    "interval": 5,
    "format": "{}",
    "tooltip": false
}

Configuration:
- Copy /etc/waynotes/config to ~/.config/waynotes/config
- Customize settings as needed
- Restart waybar after configuration changes

For more information, see: /usr/share/doc/noteticker/README.md
EOF
}

post_install() {
    echo "WayNotes has been installed successfully!"
    echo ""
    echo "Quick start:"
    echo "  note 'Hello World'     # Add a note"
    echo "  note -l                # List recent notes"
    echo "  note -s 'search'       # Search notes"
    echo ""
    echo "For waybar integration, see: /usr/share/doc/noteticker/INSTALL"
    echo ""
    echo "Configuration:"
    echo "  cp /etc/waynotes/config ~/.config/waynotes/config"
    echo "  # Edit ~/.config/waynotes/config to customize"
}
