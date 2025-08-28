# WayNotes - Terminal Note Taking System

A lightweight, portable note-taking system for the terminal with waybar integration and marquee display functionality.

## Features

- **Simple CLI Interface**: Type `note "your message"` to quickly capture notes
- **Multiple Note Types**: Support for general, todo, idea, reminder, quote, and code notes
- **Waybar Integration**: Display recent notes in your waybar with cycling and marquee effects
- **Search & Management**: Search, list, edit, and manage your notes
- **Low Memory Usage**: Lightweight bash scripts with minimal dependencies
- **Portable**: Works on any system with bash and coreutils

## Installation

### From AUR (Recommended)

```bash
# Using yay
yay -S noteticker

# Using paru
paru -S noteticker

# Using makepkg
git clone https://aur.archlinux.org/noteticker.git
cd noteticker
makepkg -si
```

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/noteticker.git
cd noteticker

# Install manually
sudo cp bin/note /usr/local/bin/
sudo cp bin/waybar-notes /usr/local/bin/
sudo chmod +x /usr/local/bin/note
sudo chmod +x /usr/local/bin/waybar-notes
```

## Quick Start

### Basic Usage

```bash
# Add a note
note "Remember to buy groceries"

# Add a todo item
note -t todo "Fix the login bug"

# Add an idea
note -t idea "Add dark mode to the app"

# Capture clipboard content
note --clip

# Capture clipboard as specific note type
note -t quote --clip

# List recent notes
note -l

# Search notes
note -s "groceries"

# Edit the most recent note
note -e

# Clear all notes
note -c
```

### Interactive Mode

```bash
# Start interactive mode
note
# Enter note: Your note here
```

### Reading from Stdin

```bash
echo "Note from echo" | note
cat file.txt | note
```

## Waybar Integration

### Basic Configuration

Add this to your waybar config file (usually `~/.config/waybar/config`):

```json
{
    "modules-right": [
        "custom/waynotes",
        // ... other modules
    ],
    "custom/waynotes": {
        "exec": "waybar-notes display cycle",
        "on-click": "waybar-notes click 1",
        "on-click-middle": "waybar-notes click 2",
        "on-click-right": "waybar-notes click 3",
        "interval": 5,
        "format": "{}",
        "tooltip": false
    }
}
```

### Click Actions

- **Left Click**: Cycle to next note
- **Middle Click**: Open notes file in editor
- **Right Click**: Show recent notes list

### Display Modes

```json
// Cycle through notes one by one
"exec": "waybar-notes display cycle"

// Show all recent notes
"exec": "waybar-notes display list"

// Marquee effect for long text
"exec": "waybar-notes display marquee"
```

### Advanced Waybar Configuration

```json
{
    "custom/waynotes": {
        "exec": "waybar-notes display cycle",
        "on-click": "waybar-notes click 1",
        "on-click-middle": "waybar-notes click 2",
        "on-click-right": "waybar-notes click 3",
        "interval": 5,
        "format": "* {}",
        "tooltip": true,
        "tooltip-format": "Recent Notes",
        "class": "waynotes",
        "css": "margin: 0 5px;"
    }
}
```

## Configuration

### Environment Variables

```bash
# Note storage directory
export NOTES_DIR="$HOME/.local/share/waynotes"

# Configuration directory
export CONFIG_DIR="$HOME/.config/waynotes"

# Maximum number of notes to keep
export MAX_NOTES=100

# Note prefix for general notes
export NOTE_PREFIX="*"
```

### Configuration File

Create `~/.config/waynotes/config`:

```bash
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
```

## Note Types

WayNotes supports different note types with appropriate icons:

- **general**: * (default)
- **todo**: [ ]
- **idea**: ->
- **reminder**: !
- **quote**: "
- **code**: >

## File Structure

```
~/.local/share/waynotes/
└── notes.txt          # Main notes file

~/.config/waynotes/
├── config             # Configuration file
└── waybar-state       # Waybar cycling state
```

## Examples

### Workflow Examples

```bash
# Quick meeting notes
note "Meeting with team at 2pm"
note -t todo "Prepare presentation slides"
note -t reminder "Send follow-up email tomorrow"

# Development notes
note -t code "Fix null pointer in userService"
note -t idea "Add caching layer for better performance"
note -t todo "Write unit tests for new feature"

# Personal notes
note -t quote "The best code is no code at all"
note "Buy birthday gift for mom"
note -t reminder "Call dentist for appointment"

# Clipboard capture workflow
note --clip                    # Capture current clipboard
note -t quote --clip          # Capture clipboard as quote
note -t code --clip           # Capture code snippet from clipboard
```

### Scripting Examples

```bash
# Add notes from a script
#!/bin/bash
note -t todo "Backup database"
note -t reminder "Check server logs"
note "Script completed successfully"

# Process notes programmatically
note -l | grep "todo" | wc -l  # Count todo items
note -s "bug" | head -5        # Show last 5 bug-related notes
```

## Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   chmod +x /usr/bin/note
   chmod +x /usr/bin/waybar-notes
   ```

2. **Waybar Not Updating**
   - Restart waybar: `killall waybar && waybar`
   - Check waybar logs for errors

3. **Notes Not Saving**
   - Ensure `~/.local/share/waynotes` directory exists
   - Check write permissions

4. **Configuration Not Loading**
   - Verify `~/.config/waynotes/config` exists
   - Check file permissions and syntax

### Debug Mode

```bash
# Enable debug output
export WAYNOTES_DEBUG=1
note "test note"
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by simple note-taking workflows
- Built for the Arch Linux community
- Designed for waybar integration

## Changelog

### v1.0.0
- Initial release
- Basic note-taking functionality
- Waybar integration
- Multiple note types
- Search and management features
