# WayNotes - Quick Installation Guide

## Option 1: AUR Installation (Recommended)

```bash
# Using yay
yay -S noteticker

# Using paru  
paru -S noteticker
```

## Option 2: Manual Installation

```bash
# Clone and install
git clone https://github.com/yourusername/noteticker.git
cd noteticker
./install.sh
```

## Quick Start

1. **Add your first note:**
   ```bash
   note "Hello World!"
   ```

2. **List recent notes:**
   ```bash
   note -l
   ```

3. **Add different types of notes:**
   ```bash
   note -t todo "Fix the bug"
   note -t idea "Add new feature"
   note -t reminder "Call mom tomorrow"
   ```

## Waybar Integration

Add this to your waybar config (`~/.config/waybar/config`):

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
        "format": "* {}",
        "tooltip": false
    }
}
```

## Click Actions

- **Left Click**: Cycle to next note
- **Middle Click**: Open notes in editor
- **Right Click**: Show recent notes list

## Configuration

Copy the default config and customize:

```bash
cp /etc/waynotes/config ~/.config/waynotes/config
# Edit ~/.config/waynotes/config
```

## Features

- ✅ Simple CLI: `note "your message"`
- ✅ Multiple note types (todo, idea, reminder, etc.)
- ✅ Waybar integration with cycling display
- ✅ Search functionality: `note -s "search term"`
- ✅ Low memory usage and portable
- ✅ Automatic timestamping
- ✅ Configurable storage location

## Need Help?

- See `README.md` for detailed documentation
- Check `waybar-config-example.json` for complete waybar setup
- Run `note --help` or `waybar-notes help` for command options
