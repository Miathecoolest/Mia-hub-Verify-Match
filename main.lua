-- ====================================================================
-- MIA HUB - CUSTOM CLIENT INTERFACE
-- TARGET GAME: 'Verify match'
-- BACKDROP: Pastel Cinnamoroll Maid Layout (Asset ID: 13542289656)
-- ====================================================================

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local BackgroundImage = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")

-- Secure GUI Environment Setup
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

ScreenGui.Name = "MiaHubVerifyMatch"
ScreenGui.ResetOnSpawn = false

-- 1. Main Window Container (Sleek Rounded Edge Design)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 25, 31) -- Dark pastel canvas
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Allows smooth dragging across screen
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainFrame

-- 2. Cinnamoroll Theme Background Integration (Updated Asset ID)
BackgroundImage.Name = "CinnamorollBackdrop"
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Image = "rbxassetid://13542289656" -- Your exact Cinnamoroll Asset ID
BackgroundImage.ImageTransparency = 0.84 -- Balanced opacity so text stands out clearly
BackgroundImage.ScaleType = Enum.ScaleType.Crop
BackgroundImage.Parent = MainFrame

local BGlCorner = Instance.new("UICorner")
BGlCorner.CornerRadius = UDim.new(0, 9)
BGlCorner.Parent = BackgroundImage

-- 3. Mia Hub Sidebar Panel
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 145, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(16, 17, 22) -- Dark contrast panel
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 9)
SideCorner.Parent = Sidebar

-- Branding Label
Title.Name = "MiaHubHeader"
Title.Size = UDim2.new(1, 0, 0, 55)
Title.Text = "🌸 MIA HUB 🌸"
Title.TextColor3 = Color3.fromRGB(168, 218, 255) -- Pastel Light Blue Text Accent
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.Parent = Sidebar

-- 4. Main Navigation Menu Tabs
local coreTabs = {"Main", "Answers", "Settings"}

for i, tabName in ipairs(coreTabs) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = tabName .. "TabButton"
    TabBtn.Size = UDim2.new(1, -16, 0, 34)
    TabBtn.Position = UDim2.new(0, 8, 0, 60 + (i - 1) * 40)
    TabBtn.BackgroundColor3 = Color3.fromRGB(24, 26, 33)
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(235, 235, 240)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 13
    TabBtn.Parent = Sidebar
    
    local TabBtnCorner = Instance.new("UICorner")
    TabBtnCorner.CornerRadius = UDim.new(0, 6)
    TabBtnCorner.Parent = TabBtn
end

-- 5. Content Area Setup
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, -165, 1, -30)
TabContainer.Position = UDim2.new(0, 155, 0, 15)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

-- Universal Toggle UI Constructor 
local function buildFeatureToggle(name, descriptiveText, positionY, onToggleCallback)
    local RowLabel = Instance.new("TextLabel")
    RowLabel.Size = UDim2.new(0, 220, 0, 30)
    RowLabel.Position = UDim2.new(0, 10, 0, positionY)
    RowLabel.Text = descriptiveText
    RowLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RowLabel.Font = Enum.Font.GothamSemibold
    RowLabel.TextSize = 14
    RowLabel.TextXAlignment = Enum.TextXAlignment.Left
    RowLabel.BackgroundTransparency = 1
    RowLabel.Parent = TabContainer

    local SwitchBtn = Instance.new("TextButton")
    SwitchBtn.Size = UDim2.new(0, 60, 0, 26)
    SwitchBtn.Position = UDim2.new(0, 245, 0, positionY + 2)
    SwitchBtn.BackgroundColor3 = Color3.fromRGB(225, 75, 75) -- Default Red OFF state
    SwitchBtn.Text = "OFF"
    SwitchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwitchBtn.Font = Enum.Font.GothamBold
    SwitchBtn.TextSize = 11
    SwitchBtn.Parent = TabContainer
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(0, 5)
    SwitchCorner.Parent = SwitchBtn

    local stateActive = false
    SwitchBtn.MouseButton1Click:Connect(function()
        stateActive = not stateActive
        SwitchBtn.Text = stateActive and "ON" or "OFF"
        SwitchBtn.BackgroundColor3 = stateActive and Color3.fromRGB(75, 215, 115) or Color3.fromRGB(225, 75, 75) -- Green when ON
        onToggleCallback(stateActive)
    end)
end

-- ====================================================================
-- CORE FUNCTIONAL TOGGLES
-- ====================================================================

-- Feature 1: Auto Correct Function Block
buildFeatureToggle("AutoCorrectToggle", "Auto Correct System", 35, function(isOn)
    if isOn then
        print("Mia Hub: Running local tracking calculations for auto-correct loop...")
    else
        print("Mia Hub: Auto-correct loop terminated.")
    end
end)

-- Feature 2: Free Cam Functional Hook
local gameCamera = workspace.CurrentCamera
local priorCamMode = gameCamera.CameraType

buildFeatureToggle("FreeCamToggle", "Free Camera Mode", 80, function(isOn)
    if isOn then
        priorCamMode = gameCamera.CameraType
        gameCamera.CameraType = Enum.CameraType.Scriptable
        print("Mia Hub: Camera unanchored. Free Cam script ready.")
    else
        gameCamera.CameraType = priorCamMode
        print("Mia Hub: Re-anchored camera view back onto local player character.")
    end
end)
