# ⚡ FoxCore Framework

A custom FiveM framework providing advanced systems for roleplay servers, including job systems, UI enhancements, inventory, clothing, and more. Built for flexibility and ease of customization.

## 📂 Installation

1. **Clone or Download FoxCore**
   - Place all FoxCore resources in your server's resources directory.

2. **Add Resources to server.cfg**
   ```cfg
   # Core FoxCore Resources
   ensure foxcore_framework
   ensure foxcore_ui
   ensure foxcore_inventory
   ensure foxcore_jobcenter
   ensure foxcore_criminal
   ensure foxcore_police
   ensure foxcore_ambulance
   ensure foxcore_jail
   ensure foxcore_multicharacter
   ensure foxcore_target
   ensure foxcore_radio
   ensure foxcore_radialmenu
   ensure foxcore_phone
   ensure foxcore_mdt
   ensure foxcore_mechanic
   ensure foxcore_gassystem
   ensure foxcore_banking
   ensure foxcore_blackmarket
   ensure foxcore_clothing
   ensure foxcore_hud
   ensure foxcore_loading
   ```

3. **Database Setup**
   - Import the provided SQL files into your server database. This will set up the necessary tables for jobs, inventory, wardrobes, and more.

## 🛡️ Permissions Setup

### 1. Basic ACE Permissions
Add these permissions to your server.cfg:

```cfg
# Allow admin group to use all commands
add_ace group.admin command allow 

# FoxCore specific permissions
add_ace group.admin foxcore.admin allow
add_ace group.mod foxcore.moderator allow
```

### 2. Add Players to Groups
Add players using Steam, Discord, or Rockstar License.

```cfg
# STEAM Example
add_principal identifier.steam:11000010xxxxxxx group.admin

# DISCORD Example
add_principal identifier.discord:123456789012345678 group.admin

# ROCKSTAR LICENSE Example
add_principal identifier.license:abc1234xyz5678 group.admin

# Moderator Example
add_principal identifier.discord:987654321098765432 group.mod
```

### 3. Dynamic Permissions in Scripts

```lua
RegisterCommand('foxadmin', function(source)
    if IsPlayerAceAllowed(source, "foxcore.admin") then
        TriggerClientEvent('chat:addMessage', source, {
            args = {"FoxCore", "You have admin access!"}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"FoxCore", "You don't have permission for this command."}
        })
    end
end, false)
```

### 4. Reload Permissions (No Restart Required)
```bash
refresh
```

## 🔄 FoxCore Job System

- **Dynamic Jobs**: Includes over 10+ civilian jobs (fruit picking, delivery, mechanic, etc.).
- **Job Peds**: Approach an NPC (Ped) and interact with FoxTarget to start a job.
- **Blip Locations**: Automatically marked on the map.
- **No /startjob**: Interaction happens through the ped and target system.

## 🎨 FoxCore UI Systems

- **Custom Loading Screen**: Displays with FoxCore branding and ends at multicharacter selection.
- **Job Center UI**: Browse and select jobs dynamically through a modern, interactive interface.
- **Clothing System**: Purchase and customize outfits, hairstyles, tattoos, and piercings.
- **Animated Wardrobes**: Store outfits and use dynamic previews with animations.

## 📻 FoxCore Radio System

- **Custom Layouts**: Every radio model uses its own unique layout and style.
- **Dynamic Keybinds**: Radio UI only appears when the assigned key is pressed.
- **Configurable Audio**:
  ```json
  {
    "pttTone": "motorola-astro25",
    "boopTone": "motorola-astro25",
    "beepTone": "motorola-astro25",
    "bonkTone": "motorola-astro25",
    "autoSize": false
  }
  ```
- **Radio Models Included**:
  - APX4000
  - APX8000
  - Motorola E5, O2, O5, O9, etc.
  - XPR5550, XPR7550
  - TDFM-9000

## 🎮 FoxCore Radial Menu

- **Dynamic Interaction**: Access criminal activities, police actions, or civilian interactions.
- **Criminal Section Example**:
  ```lua
  criminal = {
      { label = "Black Market", icon = "🕵️", event = "foxcore_blackmarket:access" },
      { label = "Sell Stolen Goods", icon = "💰", event = "foxcore_blackmarket:sell" },
      { label = "Kidnap", icon = "🚗", event = "foxcore_criminal:kidnap" },
      { label = "Search", icon = "🔍", event = "foxcore_criminal:search" }
  }
  ```

## 🔄 Multicharacter System

- Animated Character Previews
- Custom Cutscene After Selection (like ProdigyRP 2.0)
- Dynamic Ped Display

## ⚙️ Inventory System

- **Weapon Management**: shared/weapons.lua for better categorization
- **Storage Options**: Use wardrobes, homes, or vehicle trunks
- **Tattoo & Piercing Support**

## ⚡ FoxTarget Integration

- Use Targeting for Job Interactions
- No /startjob Needed
- **Blip Markers**: Auto-generate for every active job

## 📜 License

This is a custom framework built for private use. Redistribution or resale is prohibited without explicit permission.

## 🤝 Credits

- Framework by: FoxCore
- Special Thanks: The FiveM Development Community

## 🚨 Need Support?

Open a support ticket in FoxCore/FoxGuard Discord 
