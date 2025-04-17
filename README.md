# NotificationSystem

The `NotificationSystem` is a simple and lightweight notification manager for Roblox that allows you to display notifications on the player's screen. Notifications can be customized with a title, message, and duration, and they will automatically fade out after a set period of time.

## Features

- **Customizable Notifications**: Add notifications with custom titles, messages, and durations.
- **Error, Warning, and Success Styles**: Titles containing keywords like "error", "warning", or "success" will automatically adjust the notification color to match the severity.
- **Auto-Removal**: Notifications automatically disappear after a set duration.
- **Multiple Notifications**: Displays a maximum of 5 notifications at a time, automatically removing the oldest when the limit is reached.

## Installation

To use the `NotificationSystem` in your Roblox game, simply copy the code and place it in a ModuleScript.

1. Create a new `ModuleScript` in `ReplicatedStorage` or another appropriate location.
2. Paste the `NotificationSystem` code into the `ModuleScript`.
3. Require the module where you need to create notifications.

```lua
local Notification_Library = loadstring(request({Url = "https://raw.githubusercontent.com/ScripterTSBG/custom-libraries/refs/heads/main/RuthlessRemotes.lua", Method = 'GET'}).Body)()
```

## Example usage

```lua
local Notification_Library = require(game.ReplicatedStorage.NotificationSystem)

NotificationSystem.createNotification("Success", "Your game has been saved successfully!", 5)
NotificationSystem.createNotification("Warning", "Low health!", 5)
NotificationSystem.createNotification("Error: Critical", "Something went wrong!", 5)
```
