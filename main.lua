-- ====================================================================-- MIA HUB - ADVANCED CLIENT INTERFACE (ULTRA HYPER-COOL EDITION)-- TARGET GAME: 'Verify match'-- BACKDROP: Pastel Cinnamoroll Maid Layout (Asset ID: 13542289656)-- ====================================================================
local TweenService = game:GetService("TweenService")local ScreenGui = Instance.new("ScreenGui")local MainFrame = Instance.new("Frame")local Sidebar = Instance.new("Frame")local TabContainer = Instance.new("Frame")local BackgroundImage = Instance.new("ImageLabel")local Title = Instance.new("TextLabel")
-- Secure GUI Environment Setup (Optimized for Delta Mobile)if gethui then
    ScreenGui.Parent = gethui()else
    ScreenGui.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")end

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
MainCorner.CornerRadius = UDim.new(0, 12) -- Smoother rounded corners
MainCorner.Parent = MainFrame
-- Premium Border Stroke for Main Window (Acrylic Border Outline Accent)local MainStroke = Instance.new("UIStroke")
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
-- 2b. Add Top-Right Minimize Button (With Interactive Animation Layout)local MinimizeButton = Instance.new("TextButton")
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
-- UI Smooth Fade & Slide Toggle Engine local isUiOpen = truelocal function toggleGuiAnimation(targetState)
	isUiOpen = targetState
	local targetPos = targetState and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, -0.6, 0)
	local targetSize = targetState and UDim2.new(0, 550, 0, 400) or UDim2.new(0, 450, 0, 300)
	
	TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = targetPos,
		Size = targetSize
	}):Play()end

MinimizeButton.MouseButton1Click:Connect(function()
	toggleGuiAnimation(false)end)
-- Minimize Button Tactile Feedback Loop
MinimizeButton.MouseButton1Down:Connect(function()
	TweenService:Create(MinimizeButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(225, 75, 75), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()end)
MinimizeButton.MouseButton1Up:Connect(function()
	TweenService:Create(MinimizeButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(35, 40, 55), TextColor3 = Color3.fromRGB(168, 218, 255)}):Play()end)
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
local Pages = {}local coreTabs = {"Main", "Answers", "Settings"}
for _, tabName in ipairs(coreTabs) do
    local Page = Instance.new("Frame")
    Page.Name = tabName .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = (tabName == "Main") 
    Page.ZIndex = 3
    Page.Parent = TabContainer
    Pages[tabName] = Pageend
-- 5. Main Navigation Menu Tab Switching Logic (With Modern Acrylic Contrast Borders)for i, tabName in ipairs(coreTabs) do
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
    end)end
-- Universal Toggle Constructorlocal function buildFeatureToggle(name, descriptiveText, positionY, parentPage, onToggleCallback)
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
    end)end
-- ====================================================================-- DISTRIBUTED GAME UTILITIES-- ====================================================================
-- [MAIN PAGE FEATURES]local gameCamera = workspace.CurrentCameralocal priorCamMode = gameCamera.CameraTypelocal Players = game:GetService("Players")local LocalPlayer = Players.LocalPlayer
-- Feature 1: Free Cam Mode
buildFeatureToggle("FreeCamToggle", "Free Camera Mode", 20, Pages["Main"], function(isOn)
    if isOn then
        priorCamMode = gameCamera.CameraType
        gameCamera.CameraType = Enum.CameraType.Scriptable
        print("Mia Hub: Free Cam Script Initialized.")
    else
        gameCamera.CameraType = priorCamMode
        print("Mia Hub: Camera Re-anchored to Local Player Character.")
    endend)
-- Feature 2: Auto Farm System Toggle
buildFeatureToggle("AutoFarmToggle", "Automatic Gold Farm", 60, Pages["Main"], function(isOn)
    _G.AutoFarmActive = isOn
    if isOn then
        print("Mia Hub: Auto Farm activated!")
        task.spawn(function()
            while _G.AutoFarmActive do
                task.wait(1)
                -- Custom farming teleport or execution logic hooks go here
            end
        end)
    else
        print("Mia Hub: Auto Farm deactivated.")
    endend)
-- Feature 3: WalkSpeed Input Customizer Boxlocal SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 220, 0, 30)

SpeedLabel.Position = (0, 10, 0, 100)
SpeedLabel.Text = "Custom WalkSpeed"
SpeedLabel.TextColor3 = Color3.fromRGB(230, 235, 245)
SpeedLabel.Font = Enum.Font.GothamSemibold
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.ZIndex = 4
SpeedLabel.Parent = Pages["Main"]
local SpeedInput = ("TextBox")
SpeedInput.Size = (0, 60, 0, 26)
SpeedInput.Position = UDim2.new(0, 245, 0, 102)
SpeedInput.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.fromRGB(168, 218, 255)
SpeedInput.Font = Enum.Font.GothamBold
SpeedInput.TextSize = 12
SpeedInput.ZIndex = 4
SpeedInput.Parent = Pages["Main"]
local SpeedCorner = ("UICorner")
SpeedCorner.CornerRadius = (0, 6)
SpeedCorner.Parent = SpeedInput
SpeedInput.FocusLost:Connect(function(enterPressed)
local numericValue = tonumber(SpeedInput.Text)
if numericValue and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = numericValue
print("Mia Hub: WalkSpeed adjusted to " .. numericValue)
end
end)
-- Feature 4: Infinite Jump Mode Toggle
buildFeatureToggle("InfJumpToggle", "Infinite Jump Mode", 140, Pages["Main"], function(isOn)
_G.InfiniteJumpActive = isOn
if isOn then
print("Mia Hub: Infinite Jump enabled.")
local UserInputService = game:GetService("UserInputService")
_G.JumpConnection = UserInputService.JumpRequest:Connect(function()
if _G.InfiniteJumpActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
else
print("Mia Hub: Infinite Jump disabled.")
if _G.JumpConnection then
_G.JumpConnection:Disconnect()
end
end
end)
-- [ANSWERS PAGE FEATURES]
buildFeatureToggle("AutoCorrectToggle", "Auto Correct System", 20, Pages["Answers"], function(isOn)
if isOn then
print("Mia Hub: Auto Correct loop active for 'Verify match'.")
else
print("Mia Hub: Auto Correct loop terminated.")
end
end)
-- [SETTINGS PAGE FEATURES]
local InfoText = ("TextLabel")
InfoText.Size = (1, -20, 0, 40)
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
-- FLOATING MOBILE TOGGLE BUTTON (WITH PRESS SPRING BOUNCE TWEEN)
-- ====================================================================
local ToggleButton = ("TextButton")
= "MiaHubToggle"
ToggleButton.Size = (0, 55, 0, 55)
ToggleButton.Position = UDim2.new(0.05, 0, 0.2, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(16, 17, 22)
ToggleButton.Text = "MIA"
ToggleButton.TextColor3 = Color3.fromRGB(168, 218, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui
local TglCorner = ("UICorner")
TglCorner.CornerRadius = (1, 0)
TglCorner.Parent = ToggleButton
local TglStroke = ("UIStroke")
TglStroke.Color = Color3.fromRGB(168, 218, 255)
TglStroke.Thickness = 2
TglStroke.Parent = ToggleButton
    ToggleButton.MouseButton1Click:Connect(function()
	local targetState = not isUiOpen
	toggleGuiAnimation(targetState)
	-- Spring Elastic Compress Reaction Effect on Click
	ToggleButton.Size = UDim2.new(0, 48, 0, 48)
	TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = UDim2.new(0, 55, 0, 55)}):Play()
end)    
