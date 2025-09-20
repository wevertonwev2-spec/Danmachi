# DanMachi-Like Godot Prototype (Advanced)

This is a ready-to-run Godot 4 project skeleton for a match-3 + RPG prototype with a gacha system.
Open the folder in **Godot 4.x** and run `scenes/Main.tscn`.

## What's included
- Match-3 grid with match detection and mana emission (scripts/MatchGrid.gd)
- Hero class, Team manager and sample team UI (scripts/Hero.gd, scripts/TeamManager.gd)
- Gacha system with pity (scripts/Gacha.gd) and a simple UI (scenes/Gacha.tscn)
- JSON data files for heroes and gacha (data/heroes.json, data/gacha.json)
- Placeholder assets in `assets/sprites` and `assets/audio`

## How to export APK
1. Install Android SDK/NDK and Godot Android export templates.
2. In Godot editor, set export settings and press **Export**.
(See full export steps online for Godot 4 + Android.)

---
This prototype uses original characters & names. Replace assets and tweak JSON for your game.
