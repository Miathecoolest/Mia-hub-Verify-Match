-- ====================================================================
-- MIA HUB - ADVANCED CLIENT INTERFACE (ULTRA INSTANT MOBILE EDITION)
-- TARGET GAME: 'Verify match'
-- BACKDROP: Pastel Cinnamoroll Maid Layout (Asset ID: 13542289656)
-- ====================================================================

local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local TabContainer = Instance.new("Frame")
local BackgroundImage = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")

-- Secure GUI Environment Setup (Optimized for Delta Mobile)
if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

ScreenGui.Name = "MiaHubVerifyMatch"
ScreenGui.ResetOnSpawn = false

-- 1. Main Window Container (Centering Fix via AnchorPoint)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0) 
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)   
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 25, 31)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Premium Border Stroke for Main Window (Acrylic Border Outline Accent)
local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 50, 65)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

-- 2. Cinnamoroll Theme Background Integration
BackgroundImage.Name = "CinnamorollBackdrop"
BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
BackgroundImage.Image = "http://roblox.com"
BackgroundImage.ImageTransparency = 0.84
BackgroundImage.ScaleType = Enum.ScaleType.Crop
BackgroundImage.ZIndex = 1
BackgroundImage.Parent = MainFrame

local BGlCorner = Instance.new("UICorner")
BGlCorner.CornerRadius = UDim.new(0, 12)
BGlCorner.Parent = BackgroundImage

-- 2b. Add Top-Right Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.Position = UDim2.new(1, -38, 0, 12) 
MinimizeButton.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(168, 218, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 12
MinimizeButton.ZIndex = 5 
MinimizeButton.Parent = MainFrame

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 8)
MiniCorner.Parent = MinimizeButton

-- Super Fast Instant Slide Toggle Engine (Fixed Lag)
local isUiOpen = true
local function toggleGuiAnimation(targetState)
	isUiOpen = targetState
	local targetPos = targetState and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, -0.6, 0)
	
	TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = targetPos
	}):Play()
end

MinimizeButton.MouseButton1Click:Connect(function()
	toggleGuiAnimation(false)
end)

-- Minimize Button Tactile Feedback Loop
MinimizeButton.MouseButton1Down:Connect(function()
	TweenService:Create(MinimizeButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(225, 75, 75), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)
MinimizeButton.MouseButton1Up:Connect(function()
	TweenService:Create(MinimizeButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(35, 40, 55), TextColor3 = Color3.fromRGB(168, 218, 255)}):Play()
end)

-- 3. Mia Hub Sidebar Panel
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 145, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(16, 17, 22)
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 12)
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
    TabBtn.Size = UDim2.new(1, -16, 0, 36)
    TabBtn.Position = UDim2.new(0, 8, 0, 60 + (i - 1) * 44)
    TabBtn.BackgroundColor3 = (tabName == "Main") and Color3.fromRGB(35, 40, 55) or Color3.fromRGB(24, 26, 33)
    TabBtn.Text = tabName
    TabBtn.TextColor3 = (tabName == "Main") and Color3.fromRGB(168, 218, 255) or Color3.fromRGB(180, 185, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 13
    TabBtn.ZIndex = 4
    TabBtn.Parent = Sidebar
    
    local TabBtnCorner = Instance.new("UICorner")
    TabBtnCorner.CornerRadius = UDim.new(0, 8)
    TabBtnCorner.Parent = TabBtn
	
	local TabStroke = Instance.new("UIStroke")
	TabStroke.Color = (tabName == "Main") and Color3.fromRGB(60, 80, 110) or Color3.fromRGB(30, 32, 42)
	TabStroke.Thickness = 1
	TabStroke.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for name, pageFrame in pairs(Pages) do
            pageFrame.Visible = (name == tabName)
        end
        for _, btn in ipairs(Sidebar:GetChildren()) do
            if btn:IsA("TextButton") then
				TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(24, 26, 33), TextColor3 = Color3.fromRGB(180, 185, 200)}):Play()
				if btn:FindFirstChild("UIStroke") then btn.UIStroke.Color = Color3.fromRGB(30, 32, 42) end
            end
        end
		TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 40, 55), TextColor3 = Color3.fromRGB(168, 218, 255)}):Play()
		TabStroke.Color = Color3.fromRGB(60, 80, 110)
    end)
end

-- Universal Toggle Constructor
local function buildFeatureToggle(name, descriptiveText, positionY, parentPage, onToggleCallback)
    local RowLabel = Instance.new("TextLabel")
    RowLabel.Size = UDim2.new(0, 220, 0, 30)
    RowLabel.Position = UDim2.new(0, 10, 0, positionY)
    RowLabel.Text = descriptiveText
    RowLabel.TextColor3 = Color3.fromRGB(230, 235, 245)
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
    SwitchCorner.CornerRadius = UDim.new(0, 6)
    SwitchCorner.Parent = SwitchBtn

    local stateActive = false
    SwitchBtn.MouseButton1Click:Connect(function()
        stateActive = not stateActive
        SwitchBtn.Text = stateActive and "ON" or "OFF"
		
		local targetColor = stateActive and Color3.fromRGB(75, 215, 115) or Color3.fromRGB(225, 75, 75)
		TweenService:Create(SwitchBtn, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = targetColor}):Play()
		
        onToggleCallback(stateActive)
    end)
end

-- ====================================================================
-- DISTRIBUTED GAME UTILITIES
-- ====================================================================

-- [MAIN PAGE FEATURES]
local gameCamera = workspace.CurrentCamera
local priorCamMode = gameCamera.CameraType
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Feature 1: Free Cam Mode
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

-- Feature 2: Auto Farm System Toggle
buildFeatureToggle("AutoFarmToggle", "Automatic Gold Farm", 60, Pages["Main"], function(isOn)
    _G.AutoFarmActive = isOn
    if isOn then
        print("Mia Hub: Auto Farm activated!")
        task.spawn(function()
            while _G.AutoFarmActive do
                task.wait(1)
            end
        end)
    else
        print("Mia Hub: Auto Farm deactivated.")
    end
end)

-- Feature 3: WalkSpeed Input Customizer Box
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 220, 0, 30)
SpeedLabel.Position = UDim2.new(0, 10, 0, 100)
SpeedLabel.Text = "Custom WalkSpeed"
SpeedLabel.TextColor3 = Color3.fromRGB(230, 235, 245)
SpeedLabel.Font = Enum.Font.GothamSemibold
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
