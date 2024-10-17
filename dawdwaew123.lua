local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gotdamt/Xrome-Hub/refs/heads/main/Xrome%20hub.lua"))()
local Window = Library.CreateLib("Xrome Hub", "RJTheme2")

local Tab = Window:NewTab("Blox Fruits")
local Section = Tab:NewSection("Blox Fruits")
Section:NewButton("Redz999", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
end)

local Tab = Window:NewTab("Doors")
local Section = Tab:NewSection("Doors")
Section:NewButton("Mspaint", "ButtonInfo", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua")
end)

local Tab = Window:NewTab("Meme sea")
local Section = Tab:NewSection("Meme sea")
Section:NewButton("redz9999", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/MemeSea/main/Source.lua"))()
end)

local Tab = Window:NewTab("Murder Mystery 2")
local Section = Tab:NewSection("Murder Mystery 2")
Section:NewButton("YARHM", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", true))()
end)
Section:NewButton("Mars Hub", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1andonlymars/MarsHub/main/MM2"))()
end)
Section:NewButton("GUI (Eclipse)", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script", true))()
end)

local Tab = Window:NewTab("Аnime Vanguards")
local Section = Tab:NewSection("Аnime Vanguards")
Section:NewButton("Ryk hub", "ButtonInfo", function()
    loadstring(game:HttpGet("https://ryk.bloxteam.com/loader.lua"))()
end)

local Tab = Window:NewTab("Gym league")
local Section = Tab:NewSection("Gym league")
Section:NewButton("Ryk hub", "ButtonInfo", function()
    loadstring(game:HttpGet("https://ryk.bloxteam.com/loader.lua"))()
end)

local Tab = Window:NewTab("Dragon Ball Rage")
local Section = Tab:NewSection("Dragon Ball Rage")
Section:NewButton("Pa1n ", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xpa1n/Scripts/main/DBR.lua"))() 
end)

local Tab = Window:NewTab("Da hood!")
local Section = Tab:NewSection("Da hood!")
Section:NewButton("Puppyware", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gotdamt/Xrome-Hub/refs/heads/main/fdh.lua"))() 
end)

local Tab = Window:NewTab("Trident survival v2 ")
local Section = Tab:NewSection("Trident survival v2")
Section:NewButton("Swimhub", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gotdamt/Xrome-Hub/refs/heads/main/trident.lua"))() 
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local imageButton = Instance.new("ImageButton", screenGui)
imageButton.Size = UDim2.new(0, 100, 0, 100)
imageButton.Position = UDim2.new(0, 50, 0, 50)
imageButton.Image = "rbxassetid://117850631708898"
imageButton.BackgroundTransparency = 1

local uiCorner = Instance.new("UICorner", imageButton)
uiCorner.CornerRadius = UDim.new(1, 0)

local function toggleVisibility()
    Library:ToggleUI() 
end

imageButton.MouseButton1Click:Connect(toggleVisibility)
imageButton.TouchTap:Connect(toggleVisibility)

local dragging = false
local dragInput, mousePos, framePos

local function update(input)
    if dragging then
        local delta = input.Position - mousePos
        imageButton.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end

imageButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        mousePos = input.Position
        framePos = imageButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

imageButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
