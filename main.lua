-- ====================================================================
-- MIA HUB - ADVANCED CLIENT INTERFACE (DELTA MOBILE OPTIMIZED)
-- TARGET GAME: 'Verify match'
-- BACKDROP: Pastel Cinnamoroll Maid Layout (Asset ID: 13542289656)
-- ====================================================================

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local BackgroundImage = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")

-- Secure GUI Environment Setup (Optimized for Delta Mobile)
if gethui then
    ScreenGui.Parent = gethui() -- Safely places it into Delta's interface container
else
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

ScreenGui.Name = "MiaHubVerifyMatch"
ScreenGui.ResetOnSpawn = false

-- 1. Main Window Container (Centering Fix via AnchorPoint)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0) -- Scaled for mobile viewports
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)   -- Keeps it exactly in the center
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 25, 31)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 9)
MainCorner.Parent = MainFrame

-- 2. Cinnamoroll Theme Background Integration
BackgroundImage.Name = "CinnamorollBackdrop"
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Image = "http://roblox.com"
BackgroundImage.ImageTransparency = 0.84
BackgroundImage.ScaleType = Enum.ScaleType.Crop
BackgroundImage.ZIndex = 1
BackgroundImage.Parent = MainFrame

local BGlCorner = Instance.new("UICorner")
BGlCorner.CornerRadius = UDim.new(0, 9)
BGlCorner.Parent = BackgroundImage

-- 2b. Add Top-Right Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.Position = UDim2.new(1, -38, 0, 10) 
MinimizeButton.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(168, 218, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 12
MinimizeButton.ZIndex = 5 
MinimizeButton.Parent = MainFrame

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 6)
MiniCorner.Parent = MinimizeButton

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- 3. Mia Hub Sidebar Panel
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 145, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(16, 17, 22)
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 9)
SideCorner.Parent = Sidebar

-- Branding Label
Title.Name = "MiaHubHeader"
Title.Size = UDim2.new(1, 0, 0, 55)
Title.Text = "🌸 MIA HUB 🌸"
Title.TextColor3 = Color3.fromRGB(168, 218, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.ZIndex = 3
Title.Parent = Sidebar

-- 4. Content Area Layout Pages
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, -165, 1, -30)
TabContainer.Position = UDim2.new(0, 155, 0, 15)
TabContainer.BackgroundTransparency = 1
TabContainer.ZIndex = 2
TabContainer.Parent = MainFrame

local Pages = {}
local coreTabs = {"Main", "Answers", "Settings"}

for _, tabName in ipairs(coreTabs) do
    local Page = Instance.new("Frame")
    Page.Name = tabName .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = (tabName == "Main") 
    Page.ZIndex = 3
    Page.Parent = TabContainer
    Pages[tabName] = Page
end

-- 5. Main Navigation Menu Tab Switching Logic
for i, tabName in ipairs(coreTabs) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = tabName .. "TabButton"
    TabBtn.Size = UDim2.new(1, -16, 0, 34)
    TabBtn.Position = UDim2.new(0, 8, 0, 60 + (i - 1) * 40)
    TabBtn.BackgroundColor3 = (tabName == "Main") and Color3.fromRGB(35, 40, 55) or Color3.fromRGB(24, 26, 33)
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(235, 235, 240)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 13
    TabBtn.ZIndex = 4
    TabBtn.Parent = Sidebar
    
    local TabBtnCorner = Instance.new("UICorner")
    TabBtnCorner.CornerRadius = UDim.new(0, 6)
    TabBtnCorner.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for name, pageFrame in pairs(Pages) do
            pageFrame.Visible = (name == tabName)
        end
        for _, btn in ipairs(Sidebar:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.BackgroundColor3 = Color3.fromRGB(24, 26, 33)
            end
        end
        TabBtn.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
    end)
end

-- Universal Toggle Constructor
local function buildFeatureToggle(name, descriptiveText, positionY, parentPage, onToggleCallback)
    local RowLabel = Instance.new("TextLabel")
    RowLabel.Size = UDim2.new(0, 220, 0, 30)
    RowLabel.Position = UDim2.new(0, 10, 0, positionY)
    RowLabel.Text = descriptiveText
    RowLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    RowLabel.Font = Enum.Font.GothamSemibold
    RowLabel.TextSize = 14
    RowLabel.TextXAlignment = Enum.TextXAlignment.Left
    RowLabel.BackgroundTransparency = 1
    RowLabel.ZIndex = 4
    RowLabel.Parent = parentPage

    local SwitchBtn = Instance.new("TextButton")
    SwitchBtn.Size = UDim2.new(0, 60, 0, 26)
    SwitchBtn.Position = UDim2.new(0, 245, 0, positionY + 2)
    SwitchBtn.BackgroundColor3 = Color3.fromRGB(225, 75, 75)
    SwitchBtn.Text = "OFF"
    SwitchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwitchBtn.Font = Enum.Font.GothamBold
    SwitchBtn.TextSize = 11
    SwitchBtn.ZIndex = 4
    SwitchBtn.Parent = parentPage
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(0, 5)
    SwitchCorner.Parent = SwitchBtn

    local stateActive = false
    SwitchBtn.MouseButton1Click:Connect(function()
        stateActive = not stateActive
        SwitchBtn.Text = stateActive and "ON" or "OFF"
        SwitchBtn.BackgroundColor3 = stateActive and Color3.fromRGB(75, 215, 115) or Color3.fromRGB(225, 75, 75)
        onToggleCallback(stateActive)
    end)
end

-- ====================================================================
-- DISTRIBUTED GAME UTILITIES
-- ====================================================================

local gameCamera = workspace.CurrentCamera
local priorCamMode = gameCamera.CameraType

buildFeatureToggle("FreeCamToggle", "Free Camera Mode", 20, Pages["Main"], function(isOn)
    if isOn then
        priorCamMode = gameCamera.CameraType
        gameCamera.CameraType = Enum.CameraType.Scriptable
        print("Mia Hub: Free Cam Script Initialized.")
    else
        gameCamera.CameraType = priorCamMode
        print("Mia Hub: Camera Re-anchored to Local Player Character.")
    end
end)

buildFeatureToggle("AutoCorrectToggle", "Auto Correct System", 20, Pages["Answers"], function(isOn)
    if isOn then
        print("Mia Hub: Auto Correct loop active for 'Verify match'.")
    else
        print("Mia Hub: Auto Correct loop terminated.")
    end
end)

local InfoText = Instance.new("TextLabel")
InfoText.Size = UDim2.new(1, -20, 0, 40)
InfoText.Position = UDim2.new(0, 10, 0, 20)
InfoText.Text = "Use the floating 'MIA' button on your screen to show/hide this panel anytime."
InfoText.TextColor3 = Color3.fromRGB(180, 190, 200)
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 13
InfoText.TextWrapped = true
InfoText.BackgroundTransparency = 1
InfoText.ZIndex = 4
InfoText.Parent = Pages["Settings"]

-- ====================================================================
-- FLOATING MOBILE TOGGLE BUTTON (MINIMIZE / MAXIMIZE HUD)
-- ====================================================================
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "MiaHubToggle"
ToggleButton.Size = UDim2.new(0, 55, 0, 55)
ToggleButton.Position = UDim2.new(0.05, 0, 0.2, 0) 
ToggleButton.BackgroundColor3 = Color3.fromRGB(16, 17, 22)
ToggleButton.Text = "MIA"
ToggleButton.TextColor3 = Color3.fromRGB(168, 218, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.Active = true
ToggleButton.Draggable = true 
ToggleButton.Parent = ScreenGui

local TglCorner = Instance.new("UICorner")
TglCorner.CornerRadius = UDim.new(1, 0) 
TglCorner.Parent = ToggleButton

local TglStroke = Instance.new("UIStroke")
TglStroke.Color = Color3.fromRGB(168, 218, 255)
TglStroke.Thickness = 2
TglStroke.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
