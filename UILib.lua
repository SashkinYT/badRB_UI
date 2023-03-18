local Lib = {}
local TweenS = game:GetService("TweenService")
local Uis = game:GetService("UserInputService")

function Lib:CreateUI(title)
	local ui = {}
	
	local tabs = 0
	
	local gsui = Instance.new("ScreenGui")
	local coregui = game:GetService("CoreGui")
	local frame = Instance.new("Frame")
	local tabsFrame = Instance.new("ScrollingFrame")
	local frameCorner = Instance.new("UICorner")
	local destroyCorner = Instance.new("UICorner")
	local frameMove = Instance.new("TextButton")
	local moveFrame = false
	local destroyUI = Instance.new("TextButton")
	local uiTitle = Instance.new("TextLabel")
	local tabFolder = Instance.new("Folder")
	
	tabFolder.Parent = frame

	frame.Size = UDim2.new(0.3, 0, 0.4, 0)
	frame.Position = UDim2.new(0,100,0,100)
	frameCorner.CornerRadius = UDim.new(0.05, 0.8)
	frameCorner.Parent = frame
	frame.BorderSizePixel = 0
	frame.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
	frame.Parent = gsui
	frame.ClipsDescendants = true
	gsui.Parent = coregui
	
	local Info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 2, true, 0.5)
	local target = {BackgroundColor3 = Color3.new(0.203922, 1, 0.364706)}
	TweenS:Create(frame, Info, target):Play()
	
	wait(8)
	
	tabsFrame.Size = UDim2.new(0.35, 0, 0.8, 0)
	tabsFrame.Position = UDim2.new(0.015,0,0.15,0)
	tabsFrame.BorderSizePixel = 0
	tabsFrame.BackgroundTransparency = 1
	tabsFrame.CanvasSize = UDim2.new(0,0,0,0)
	tabsFrame.Parent = frame
	
	spawn(function()
		local player = game.Players.LocalPlayer
		while wait() do
			tabsFrame.CanvasSize = UDim2.new(0,0,0,tabs*70)
		end
	end)

	spawn(function()
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()
		while wait() do
			if moveFrame then
				local Info = TweenInfo.new(0.2)
				local target = {Position = UDim2.new(0,mouse.X,0,mouse.Y)}
				TweenS:Create(frame, Info, target):Play()
			end
		end
	end)


	frameMove.BorderSizePixel = 0
	frameMove.Size = UDim2.new(1, 0, 0.1, 0)
	frameMove.AutoButtonColor = false
	frameMove.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
	frameMove.Text = ""
	frameMove.BackgroundTransparency = 0
	frameMove.MouseButton1Down:Connect(function ()
		moveFrame = true
	end)
	local Info = TweenInfo.new(0.5)
	local target = {BackgroundTransparency = 0,BackgroundColor3 = Color3.new(0.3,0.3,0.3)}
	TweenS:Create(frameMove, Info, target):Play()

	uiTitle.Text = title
	uiTitle.Font = Enum.Font.FredokaOne
	uiTitle.TextScaled = true
	uiTitle.BorderSizePixel = 0
	uiTitle.TextColor3 = Color3.new(0.3,0.3,0.3)
	uiTitle.Size = UDim2.new(0.3, 0, 1, 0)
	uiTitle.BackgroundColor3 = Color3.new(0.3,0.3,0.3)
	uiTitle.BackgroundTransparency = 0
	uiTitle.Parent = frameMove
	local Info = TweenInfo.new(0.5)
	local target = {BackgroundTransparency = 0,TextColor3 = Color3.new(0.203922, 1, 0.364706)}
	TweenS:Create(uiTitle, Info, target):Play()

	destroyCorner.CornerRadius = UDim.new(0.2, 0.8)
	destroyCorner.Parent = destroyUI
	destroyUI.Text = "X"
	destroyUI.Font = Enum.Font.FredokaOne
	destroyUI.TextScaled = true
	destroyUI.BorderSizePixel = 0
	destroyUI.Size = UDim2.new(0.1, 0, 1, 0)
	destroyUI.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
	destroyUI.TextColor3 = Color3.new(0.3,0.3,0.3)
	destroyUI.Position = UDim2.new(0.895,0,0,0)
	destroyUI.BackgroundTransparency = 1
	destroyUI.Parent = frameMove
	local Info = TweenInfo.new(0.5)
	local target = {BackgroundTransparency = 0,TextColor3 = Color3.new(1,1,1)}
	TweenS:Create(destroyUI, Info, target):Play()
	destroyUI.MouseButton1Click:Connect(function ()
		local Info = TweenInfo.new(0.5)
		local target = {Size = UDim2.new(0,0,0,0)}
		TweenS:Create(frame, Info, target):Play()
		wait(0.5)
		gsui:Destroy()
	end)

	Uis.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			moveFrame = false
		end
	end)

	frameMove.Parent = frame

	gsui.Name = title
	gsui.ResetOnSpawn = false

	function ui:NewTab(TabName)
		tabs += 1
		local objectsC = 0
		local tabButton = Instance.new("TextButton")
		local tabCorner = Instance.new("UICorner")
		local objects = {}
		tabCorner.CornerRadius = UDim.new(0.3, 0.8)
		tabCorner.Parent = tabButton
		tabButton.Position = UDim2.new(0.01,0,0,tabs*52.5)
		tabButton.Size = UDim2.new(0.9,0,0,50)
		tabButton.Text = TabName
		tabButton.BackgroundColor3 = Color3.new(0.203922, 1, 0.364706)
		tabButton.TextColor3 = Color3.new(0.2,0.2,0.2)
		tabButton.TextScaled = true
		tabButton.Font = Enum.Font.FredokaOne
		tabButton.BackgroundTransparency = 1
		tabButton.Parent = tabsFrame
		local Info = TweenInfo.new(0.5)
		local target = {BackgroundTransparency = 0,TextColor3 = Color3.new(0,0,0)}
		TweenS:Create(tabButton, Info, target):Play()
		
		
		local tabFrame = Instance.new("ScrollingFrame")
		tabFrame.Size = UDim2.new(0.6, 0, 0.8, 0)
		tabFrame.Position = UDim2.new(2,0,0.15,0)
		tabFrame.BorderSizePixel = 0
		tabFrame.BackgroundTransparency = 1
		tabFrame.Visible = true
		tabFrame.CanvasSize = UDim2.new(0,0,0,0)
		tabFrame.Parent = tabFolder
		
		tabButton.MouseButton1Click:Connect(function()
			for _, tab in pairs(tabFolder:GetChildren()) do
				if tab ~= tabFrame then
					local Info = TweenInfo.new(0.5)
					local target = {Position = UDim2.new(2,0,0.15,0)}
					TweenS:Create(tab, Info, target):Play()
				end
			end
			local Info = TweenInfo.new(0.5)
			local target = {Position = UDim2.new(0.38,0,0.15,0)}
			TweenS:Create(tabFrame, Info, target):Play()
		end)
		
		spawn(function()
			local player = game.Players.LocalPlayer
			while wait() do
				tabFrame.CanvasSize = UDim2.new(0,0,0,objectsC*70)
				
			end
		end)
		
		function objects:NewObject(ObjectName, TypeOfObject, execute_function)
			if TypeOfObject == "Text" then
				local label = Instance.new("TextLabel")
				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(0.3,0.8)
				corner.Parent = label
				label.Text = ObjectName
				label.Font = Enum.Font.FredokaOne
				label.TextScaled = true
				label.BorderSizePixel = 0
				label.Position = UDim2.new(0.01,0,0,objectsC*52.5)
				label.Size = UDim2.new(0.9,0,0,50)
				label.BackgroundColor3 = Color3.new(0.203922, 1, 0.364706)
				label.TextColor3 = Color3.new(0,0,0)
				label.Parent = tabFrame
				objectsC += 1
			elseif TypeOfObject == "Button" then
				local button = Instance.new("TextButton")
				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(0.3,0.8)
				corner.Parent = button
				button.Text = ObjectName
				button.Font = Enum.Font.FredokaOne
				button.TextScaled = true
				button.BorderSizePixel = 0
				button.Position = UDim2.new(0.01,0,0,objectsC*52.5)
				button.Size = UDim2.new(0.9,0,0,50)
				button.BackgroundColor3 = Color3.new(0.2,0.25,0.25)
				button.TextColor3 = Color3.new(0.203922, 1, 0.364706)
				button.Parent = tabFrame
				button.MouseButton1Click:Connect(execute_function)
				objectsC += 1
			elseif TypeOfObject == "Input" then
				local textbox = Instance.new("TextBox")
				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(0.3,0.8)
				corner.Parent = textbox
				textbox.Text = ObjectName
				textbox.Font =  Enum.Font.FredokaOne
				textbox.PlaceholderText = ObjectName
				textbox.PlaceholderColor3 = Color3.new(0.12549, 0.623529, 0.227451)
				textbox.TextScaled = true
				textbox.BorderSizePixel = 0
				textbox.Position = UDim2.new(0.01,0,0,objectsC*52.5)
				textbox.Size = UDim2.new(0.9,0,0,50)
				textbox.BackgroundColor3 = Color3.new(0.2,0.25,0.25)
				textbox.TextColor3 = Color3.new(0.203922, 1, 0.364706)
				textbox.Parent = tabFrame
				textbox.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						execute_function(textbox.Text)
						textbox.Text = ""
					end
				end)
				objectsC += 1
			elseif TypeOfObject == "Toggle" then
				local button = Instance.new("TextButton")
				local corner = Instance.new("UICorner")
				local enabled = false
				corner.CornerRadius = UDim.new(0.3,0.8)
				corner.Parent = button
				button.Text = ObjectName
				button.Font = Enum.Font.FredokaOne
				button.TextScaled = true
				button.BorderSizePixel = 0
				button.Position = UDim2.new(0.01,0,0,objectsC*52.5)
				button.Size = UDim2.new(0.9,0,0,50)
				button.BackgroundColor3 = Color3.new(0.866667, 0.341176, 0.0941176)
				button.TextColor3 = Color3.new(0, 0, 0)
				button.Parent = tabFrame
				button.MouseButton1Click:Connect(function()
					enabled = not enabled
					if enabled == true then
						local Info = TweenInfo.new(0.5)
						local target = {BackgroundColor3 = Color3.new(0.278431, 0.486275, 0.866667)}
						TweenS:Create(button, Info, target):Play()
					else
						local Info = TweenInfo.new(0.5)
						local target = {BackgroundColor3 = Color3.new(0.866667, 0.341176, 0.0941176)}
						TweenS:Create(button, Info, target):Play()
					end
					execute_function(enabled)
					
				end)
				objectsC += 1
			end
		end
		
		return objects
	end

	return ui
end

function Init()
	return Lib
end

local comment = [[
local window = Lib:CreateUI("LibUI")


local tab1 = window:NewTab("Tab1"):NewObject("Toggle!", "Toggle", function(text)
	print(text)
end)
local tab2 = window:NewTab("Tab2"):NewObject("Kick!", "Toggle", function(text)
	game.Players.LocalPlayer:Kick(text)
end)
]]

