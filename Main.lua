local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local image = Instance.new("ImageLabel", frame)
image.Size = UDim2.new(0, 250, 0, 250)
image.Position = UDim2.new(0.5, -125, 0.4, -125)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://132890309639942"

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, 0, 0, 50)
text.Position = UDim2.new(0, 0, 0.7, 0)
text.BackgroundTransparency = 1
text.Text = "LOADING..."
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextScaled = true
text.Font = Enum.Font.SourceSansBold

-- PRINT
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Pencere
local Window = Fluent:CreateWindow({
Title = "JoJo HUB MAIN",
SubTitle = "by JoJo",
TabWidth = 160,
Size = UDim2.fromOffset(580, 460),
Acrylic = true,
Theme = "Aqua",
MinimizeKey = Enum.KeyCode.LeftControl
})

-- Bildirim
Fluent:Notify({
Title = "JoJo Hub System",
Content = "Welcome to JOJO HUB",
SubContent = "----",
Duration = 7
})

-- TABLAR (TEK SEFERDE TANIMLANDI)
local Tabs = {
Main = Window:AddTab({ Title = "Main", Icon = "chevrons-left-right-ellipsis" }),
Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
Aim = Window:AddTab({ Title = "💣 PvP Hacks", Icon = "bow-arrow" }),
bf = Window:AddTab({ Title = "Blox Fruits Scripts", Icon = "bow-arrow" }),
sp = Window:AddTab({ Title = "Sailor Piece", Icon = "bow-arrow" }),
ngh = Window:AddTab({ Title = "99 Night in the Forest", Icon = "" }),
}

-- MAIN TAB
Tabs.Main:AddParagraph({
Title = "READ ME !!",
Content = "This script was created by JoJo.\nWe are not responsible for any consequences arising from copying, modifying, or publishing it.\n\nThanks for using JoJo HUB"
})

Tabs.Main:AddParagraph({
Title = "Who is JoJo",
Content = "Im big cheat developer !!"
})

-- AIM TAB
Tabs.Aim:AddParagraph({
Title = "Info",
Content = "All Features is universal you can use for all games!!"
})

Tabs.Aim:AddButton({
Title = "AimBot",
Description = "Universal AimBot",
Callback = function()
print("Aimbot açıldı")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 180, 0, 70)
frame.Position = UDim2.new(0, 50, 0.5, -35)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true

-- corner
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

-- button
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -10, 1, -10)
button.Position = UDim2.new(0, 5, 0, 5)
button.Text = "AIM LOCK: OFF"
button.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 8)

-- state
local enabled = false
local target = nil

button.MouseButton1Click:Connect(function()
enabled = not enabled
button.Text = enabled and "AIM LOCK: ON" or "AIM LOCK: OFF"
button.BackgroundColor3 = enabled and Color3.fromRGB(40, 200, 80) or Color3.fromRGB(200, 40, 40)
end)

-- closest player
local function getClosest()
local closest = nil
local dist = math.huge

for _, plr in pairs(Players:GetPlayers()) do  
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then  
        local pos = plr.Character.HumanoidRootPart.Position  
        local mag = (camera.CFrame.Position - pos).Magnitude  

        if mag < dist then  
            dist = mag  
            closest = plr  
        end  
    end  
end  

return closest

end

-- HARD LOCK AIM
RunService.RenderStepped:Connect(function()
if not enabled then return end

target = getClosest()  

if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then  
    local part = target.Character.HumanoidRootPart  

    -- HARD LOCK (direkt sabitler)  
    camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)  
end

end)
end
})

Tabs.Aim:AddButton({
    Title = "Esp",
    Description = "Universal Esp",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Slider = Tabs.Aim:AddSlider("Slider", 
{
    Title = "Speed Hack",
    Description = "Universal Speed changer",
    Default = 16,
    Min = 1,
    Max = 250,
    Rounding = 5,
    Callback = function(Value)
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Slider = Tabs.Aim:AddSlider("JumpSlider", 
{
    Title = "Jump Hack",
    Description = "Universal Jump changer",
    Default = 50,
    Min = 10,
    Max = 300,
    Rounding = 5,
    Callback = function(Value)
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid.JumpPower = Value
        end
    end
})

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local InfiniteJumpEnabled = false

local Toggle = Tabs.Aim:AddToggle("MyToggle", 
{
    Title = "Infinite Jump", 
    Description = "Universal inf Jump",
    Default = false,

    Callback = function(state)
        InfiniteJumpEnabled = state

        if state then
            print("Infinite Jump Açık")
        else
            print("Infinite Jump Kapalı")
        end
    end 
})

-- Space basınca zıplatır
UIS.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Tabs.Aim:AddButton({
    Title = "Dodge Tool PC",
    Description = "you can use teleport dash fast ",
    Callback = function()
        local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

-- karakter
local character = getCharacter()
local hrp = character:WaitForChild("HumanoidRootPart")

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 230, 0, 160)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

-- Mesafe
local distanceBox = Instance.new("TextBox")
distanceBox.Size = UDim2.new(0.8, 0, 0.25, 0)
distanceBox.Position = UDim2.new(0.1, 0, 0.05, 0)
distanceBox.Text = "5"
distanceBox.PlaceholderText = "Mesafe"
distanceBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
distanceBox.TextColor3 = Color3.new(1,1,1)
distanceBox.Parent = frame

Instance.new("UICorner", distanceBox).CornerRadius = UDim.new(0,8)

-- Sağ tuş
local rightKeyBox = Instance.new("TextButton")
rightKeyBox.Size = UDim2.new(0.35, 0, 0.25, 0)
rightKeyBox.Position = UDim2.new(0.55, 0, 0.4, 0)
rightKeyBox.Text = "SET RIGHT"
rightKeyBox.BackgroundColor3 = Color3.fromRGB(0,170,255)
rightKeyBox.TextColor3 = Color3.new(1,1,1)
rightKeyBox.Parent = frame

Instance.new("UICorner", rightKeyBox).CornerRadius = UDim.new(0,8)

-- Sol tuş
local leftKeyBox = Instance.new("TextButton")
leftKeyBox.Size = UDim2.new(0.35, 0, 0.25, 0)
leftKeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
leftKeyBox.Text = "SET LEFT"
leftKeyBox.BackgroundColor3 = Color3.fromRGB(255,85,0)
leftKeyBox.TextColor3 = Color3.new(1,1,1)
leftKeyBox.Parent = frame

Instance.new("UICorner", leftKeyBox).CornerRadius = UDim.new(0,8)

-- Bilgi
local info = Instance.new("TextLabel")
info.Size = UDim2.new(1,0,0.2,0)
info.Position = UDim2.new(0,0,0.75,0)
info.Text = "Set keys"
info.BackgroundTransparency = 1
info.TextColor3 = Color3.new(1,1,1)
info.Parent = frame

-- atanmış tuşlar
local rightKey = Enum.KeyCode.E
local leftKey = Enum.KeyCode.Q

local waitingFor = nil -- "right" veya "left"

-- Butonlar
rightKeyBox.MouseButton1Click:Connect(function()
	rightKeyBox.Text = "PRESS KEY..."
	waitingFor = "right"
end)

leftKeyBox.MouseButton1Click:Connect(function()
	leftKeyBox.Text = "PRESS KEY..."
	waitingFor = "left"
end)

-- Hareket
local function move(direction)
	local char = getCharacter()
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	
	local value = tonumber(distanceBox.Text)
	if not value then return end
	
	local rightVector = root.CFrame.RightVector
	
	if direction == "right" then
		root.CFrame = root.CFrame + (rightVector * value)
	else
		root.CFrame = root.CFrame - (rightVector * value)
	end
end

-- Input sistemi
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	-- tuş atama modu
	if waitingFor then
		if input.KeyCode ~= Enum.KeyCode.Unknown then
			
			if waitingFor == "right" then
				rightKey = input.KeyCode
				rightKeyBox.Text = input.KeyCode.Name
			else
				leftKey = input.KeyCode
				leftKeyBox.Text = input.KeyCode.Name
			end
			
			waitingFor = nil
		end
		return
	end
	
	-- normal kullanım
	if input.KeyCode == rightKey then
		move("right")
	end
	
	if input.KeyCode == leftKey then
		move("left")
	end
end)
    end
})

Tabs.Aim:AddButton({
    Title = "Dodge Tool MOBILE",
    Description = "you can use teleport dash fast ",
    Callback = function()
        local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- GUI oluştur
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Ana Frame (sürüklenebilir)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Parent = screenGui
frame.Active = true
frame.Draggable = true

-- Köşeleri yuvarla
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- TextBox (değer girme)
local textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(0.8, 0, 0.3, 0)
textbox.Position = UDim2.new(0.1, 0, 0.05, 0)
textbox.PlaceholderText = "Değer gir"
textbox.Text = "5"
textbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textbox.TextColor3 = Color3.new(1,1,1)
textbox.Parent = frame

local tbCorner = Instance.new("UICorner")
tbCorner.CornerRadius = UDim.new(0, 8)
tbCorner.Parent = textbox

-- Sağ buton
local rightBtn = Instance.new("TextButton")
rightBtn.Size = UDim2.new(0.35, 0, 0.4, 0)
rightBtn.Position = UDim2.new(0.55, 0, 0.5, 0)
rightBtn.Text = "Right"
rightBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
rightBtn.TextColor3 = Color3.new(1,1,1)
rightBtn.Parent = frame

local rCorner = Instance.new("UICorner")
rCorner.CornerRadius = UDim.new(0, 10)
rCorner.Parent = rightBtn

-- Sol buton
local leftBtn = Instance.new("TextButton")
leftBtn.Size = UDim2.new(0.35, 0, 0.4, 0)
leftBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
leftBtn.Text = "Left"
leftBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
leftBtn.TextColor3 = Color3.new(1,1,1)
leftBtn.Parent = frame

local lCorner = Instance.new("UICorner")
lCorner.CornerRadius = UDim.new(0, 10)
lCorner.Parent = leftBtn

-- Fonksiyon (hareket)
local function move(direction)
	local value = tonumber(textbox.Text)
	if not value then return end
	
	-- karakter yönüne göre sağ/sol
	local rightVector = hrp.CFrame.RightVector
	
	if direction == "right" then
		hrp.CFrame = hrp.CFrame + (rightVector * value)
	else
		hrp.CFrame = hrp.CFrame - (rightVector * value)
	end
end

-- Buton bağlantıları
rightBtn.MouseButton1Click:Connect(function()
	move("right")
end)

leftBtn.MouseButton1Click:Connect(function()
	move("left")
end)
    end
})

Tabs.sp:AddButton({
    Title = "Polluted HUB Keyless",
    Description = "OUTO FARM DUPE OUTO KILL AND MORE.... ",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/b1f30331e1af9ab6e96fc80cd00b20a9.lua"))()
    end
})

Tabs.sp:AddButton({
    Title = "OhhMyGehlee HUB Keyless",
    Description = "OUTO FARM DUPE KILL AURA OUTO KILL AND MORE.... ",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/sh/refs/heads/main/a"))()
    end
})

Tabs.bf:AddParagraph({
Title = "İnfo",
Content = "Have fun using scripts"
})

Tabs.bf:AddButton({
    Title = "Annie HUB Keyless",
    Description = "Outo Farm Mastery Sea Events Outo m1 and more....",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Anniecreate86/BloxFruits/refs/heads/main/BetaHub-BF"))()
    end
})

Tabs.bf:AddButton({
    Title = "Eclipse HUB Keyless",
    Description = "Outo Farm Mastery Sea Events Outo m1 and more....",
    Callback = function()
        getgenv().ECp4 = {
    ["Team"] = "Pirates", -- Marines/Pirates
    ["Fix Lag"] = false,  -- true/false
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Eclipse2408/Scripts/refs/heads/main/PhahattiScripts.lua"))()
    end
})

Tabs.sp:AddButton({
    Title = "Zee HUB Keyless",
    Description = "OUTO FARM DUPE OUTO KILL AND MORE.... ",
    Callback = function()
        loadstring(game:HttpGet("https://link.trwxz.com/LS-Zee-Hub-VIP"))()
    end
})

-- bekle ve kapat
task.wait(3)
gui:Destroy()
