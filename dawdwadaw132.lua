local HttpService = game:GetService("HttpService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui
screenGui.ResetOnSpawn = false

local attempts = 0
local maxAttempts = 10  

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 10)

local attemptsLabel = Instance.new("TextLabel", frame)
attemptsLabel.Size = UDim2.new(0, 200, 0, 30)
attemptsLabel.Position = UDim2.new(0.5, -100, 0, 10)  
attemptsLabel.Text = tostring(attempts) .. "/" .. tostring(maxAttempts)
attemptsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
attemptsLabel.BackgroundTransparency = 1
attemptsLabel.Font = Enum.Font.SourceSans
attemptsLabel.TextSize = 16  

local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.2, 0)
textBox.PlaceholderText = "Enter your key"
textBox.Text = ""
textBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BorderSizePixel = 0

local textBoxCorner = Instance.new("UICorner", textBox)
textBoxCorner.CornerRadius = UDim.new(0, 10)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0, 100, 0, 40)
button.Position = UDim2.new(0.3, -50, 0.6, 0)
button.Text = "Confirm"
button.BackgroundColor3 = Color3.fromRGB(139, 123, 139)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BorderSizePixel = 0

local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 10)

local getKeyButton = Instance.new("TextButton", frame)
getKeyButton.Size = UDim2.new(0, 100, 0, 40)
getKeyButton.Position = UDim2.new(0.7, -50, 0.6, 0)
getKeyButton.Text = "Get Key"
getKeyButton.BackgroundColor3 = Color3.fromRGB(139, 123, 139)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.BorderSizePixel = 0

local getKeyCorner = Instance.new("UICorner", getKeyButton)
getKeyCorner.CornerRadius = UDim.new(0, 10)

local discordIcon = Instance.new("ImageButton", frame)
discordIcon.Size = UDim2.new(0, 24, 0, 24)
discordIcon.Position = UDim2.new(1, -30, 0, 5)
discordIcon.BackgroundTransparency = 1
discordIcon.Image = "rbxassetid://6035047377"

local function showFrame(frame)
    frame.Position = UDim2.new(1, -220, 1, 50)
    frame.Visible = true
    frame:TweenPosition(UDim2.new(1, -220, 1, -60), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    wait(3)
    frame:TweenPosition(UDim2.new(1, -220, 1, 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true, function()
        frame.Visible = false
    end)
end

local function showMessage(text)
    local messageFrame = Instance.new("Frame", screenGui)
    messageFrame.Size = UDim2.new(0, 200, 0, 50)
    messageFrame.Position = UDim2.new(1, -220, 1, 50) 
    messageFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    messageFrame.BorderSizePixel = 0

    local messageCorner = Instance.new("UICorner", messageFrame)
    messageCorner.CornerRadius = UDim.new(0, 10)

    local messageLabel = Instance.new("TextLabel", messageFrame)
    messageLabel.Size = UDim2.new(1, 0, 1, 0)
    messageLabel.Text = text
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.BackgroundTransparency = 1
    messageLabel.TextScaled = true
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextSize = 12  

    messageFrame.Parent = screenGui
    showFrame(messageFrame)
end

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://lootdest.org/s?a305c887")
    showMessage("Link copied to clipboard!")  
end)

discordIcon.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/Snt9vKQm")
    showMessage("Discord link copied!")  
end)

button.MouseButton1Click:Connect(function()
    local function updateAttempts()
        attemptsLabel.Text = tostring(attempts) .. "/" .. tostring(maxAttempts)
        if attempts >= maxAttempts then
            game.Players.LocalPlayer:Kick("You have exceeded the maximum number of attempts.")
        end
    end

    if textBox.Text == "" then
        showMessage("Please enter a key!")  
    elseif textBox.Text == "f831761W" then
        frame:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Toswatq/dawdw41441/refs/heads/main/dawdwaew123.lua"))()
    else
        attempts = attempts + 1
        updateAttempts()
        showMessage("Invalid key!")  
    end
end)

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)
