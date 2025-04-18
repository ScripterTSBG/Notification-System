# NotificationSystem

The `NotificationSystem` is a simple and lightweight notification manager for Roblox Exploits that allows you to display notifications on the player's screen. Notifications can be customized with a title, message, and duration, and they will automatically fade out after a set period of time.

## Features

- **Customizable Notifications**: Add notifications with custom titles, messages, and durations.
- **Error, Warning, and Success Styles**: Titles containing keywords like "error", "warning", or "success" will automatically adjust the notification color to match the severity.
- **Auto-Removal**: Notifications automatically disappear after a set duration.
- **Multiple Notifications**: Displays a maximum of 5 notifications at a time, automatically removing the oldest when the limit is reached.

## Installation

```lua
local Notification_Library = loadstring(request({Url = "https://github.com/ScripterTSBG/Notification-System/raw/refs/heads/main/notification.lua", Method = 'GET'}).Body)()
```

## Example usage

```lua
local Notification_Library = loadstring(request({Url = "https://github.com/ScripterTSBG/Notification-System/raw/refs/heads/main/notification.lua", Method = 'GET'}).Body)()

Notification_Library.createNotification("Success", "Your game has been saved successfully!", 5)
Notification_Library.createNotification("Warning", "Low health!", 5)
Notification_Library.createNotification("Error: Critical", "Something went wrong!", 5)
```
