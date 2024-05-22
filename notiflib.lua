local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Function to create a notification
local function createNotification(message, duration)
    -- Create a Frame for the notification
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 250, 0, 100)
    notificationFrame.Position = UDim2.new(1, 260, 1, -120) -- Start off-screen
    notificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Parent = screenGui
    
    -- Create UICorner to round the corners
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10) -- Adjust corner radius here
    uiCorner.Parent = notificationFrame

    -- Create a TextLabel for the message
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -20, 1, -20)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Text = message
    textLabel.TextWrapped = true
    textLabel.TextScaled = true
    textLabel.Parent = notificationFrame

    -- Tween to slide in the notification
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Position = UDim2.new(1, -270, 1, -120)}

    local tween = tweenService:Create(notificationFrame, tweenInfo, goal)
    tween:Play()

    -- Wait for the duration and then hide the notification
    task.wait(duration or 3)

    -- Tween to slide out the notification
    local tweenOut = tweenService:Create(notificationFrame, tweenInfo, {Position = UDim2.new(1, 260, 1, -120)})
    tweenOut:Play()
    tweenOut.Completed:Connect(function()
        notificationFrame:Destroy()
    end)
end

-- Example usage
--createNotification("This is a notification!", 5)
