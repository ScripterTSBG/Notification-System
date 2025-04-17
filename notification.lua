local NotificationSystem = {}

local NotificationUI = Instance.new("ScreenGui")
NotificationUI.Parent = game:GetService("CoreGui")
NotificationUI.Name = "NotificationUI"

local maxNotifications, notifications = 5, {}

local function trimMessage(msg)
    return msg:match(": (.+)") or msg
end

function NotificationSystem.createNotification(title, message, duration)
    duration = duration or 5
    if string.find(string.lower(title), "error") then
        message = trimMessage(message)
    end

    local notification = Instance.new("Frame")
    notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notification.BackgroundTransparency = 0.8
    notification.BorderSizePixel = 0
    notification.Parent = NotificationUI

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text, titleLabel.TextSize, titleLabel.Font = title, 18, Enum.Font.ArialBold
    titleLabel.BackgroundTransparency, titleLabel.TextStrokeTransparency = 1, 0
    titleLabel.Parent = notification

    local colorMap = { error = Color3.fromRGB(255, 0, 0), warning = Color3.fromRGB(255, 165, 0), success = Color3.fromRGB(0, 255, 0) }
    for key, color in pairs(colorMap) do
        if string.find(string.lower(title), key) then
            titleLabel.TextColor3 = color
            break
        end
    end

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Text, messageLabel.TextSize, messageLabel.Font = message, 16, Enum.Font.Arial
    messageLabel.TextColor3, messageLabel.BackgroundTransparency, messageLabel.TextStrokeTransparency = Color3.fromRGB(200, 200, 200), 1, 0.5
    messageLabel.TextWrapped = true
    messageLabel.Parent = notification

    local textSize = game:GetService("TextService"):GetTextSize(message, 16, Enum.Font.Arial, Vector2.new(1000, 1000))
    local width, height = math.clamp(textSize.X + 20, 320, 600), math.clamp(textSize.Y + 40, 60, 200)
    notification.Size = UDim2.new(0, width, 0, height)
    titleLabel.Size, messageLabel.Size, messageLabel.Position = UDim2.new(1, 0, 0.4, 0), UDim2.new(1, 0, 0.6, 0), UDim2.new(0, 0, 0.4, 0)

    for i, notif in ipairs(notifications) do
        notif:TweenPosition(UDim2.new(0.5, -notif.Size.X.Offset / 2, 0.1 + (i * 0.08), 0), "Out", "Quad", 0.5, true)
    end

    notification.Position = UDim2.new(0.5, -width / 2, -0.2, 0)
    notification:TweenPosition(UDim2.new(0.5, -width / 2, 0.1, 0), "Out", "Bounce", 0.5, true)

    table.insert(notifications, 1, notification)

    if #notifications > maxNotifications then
        local oldest = table.remove(notifications)
        oldest:TweenPosition(UDim2.new(0.5, -oldest.Size.X.Offset / 2, -0.2, 0), "Out", "Quad", 0.5, true, function()
            oldest:Destroy()
        end)
    end

    task.delay(5, function()
        if notification.Parent then
            notification:TweenPosition(UDim2.new(0.5, -notification.Size.X.Offset / 2, -0.2, 0), "Out", "Quad", 0.5, true, function()
                notification:Destroy()
                table.remove(notifications, table.find(notifications, notification))
            end)
        end
    end)
end

return NotificationSystem
