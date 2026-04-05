# Windows Terminal

The file stored here is *not* meant to be the full configuration, just some important changes are listed here.

Settings location on Windows:
```powershell
# Windows location
C:\Users\$USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

Settings location via WSL:
```bash
/mnt/c/Users/$USERNAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
```

Important changes:
```json
{
    "keybindings":
    [
        {
            "id": "User.copy.644BA8F2",
            "keys": "ctrl+c"
        },
        {
            "id": "User.find",
            "keys": "ctrl+shift+f"
        },
        {
            "id": "User.paste",
            "keys": "ctrl+v"
        },
        {
            "id": "User.splitPane.A6751878",
            "keys": "alt+shift+d"
        },
        {
            "id": "Terminal.NextTab",
            "keys": "ctrl+pgdn"
        },
        {
            "id": "Terminal.ClosePane",
            "keys": "ctrl+w"
        },
        {
            "id": "Terminal.OpenNewTab",
            "keys": "ctrl+n"
        },
        {
            "id": "User.prevTab.0",
            "keys": "ctrl+pgup"
        }
    ],
    "profiles":
    {
        "defaults":
        {
            "bellStyle": "window",
            "colorScheme": "Tango Dark",
            "font":
            {
                "face": "FiraCode Nerd Font Mono"
            },
            "opacity": 97
        }
    }
}
```