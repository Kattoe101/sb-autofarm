-- made by kattoe101 (github)
-- if u have any questions, suggestions or feedback you can dm me on discord (kattoe)
-- an autofarm gui for roblox sharkbite
-- created: 23-08-2023
-- updated: 28-08-2023


-- Instances:

local sbautofarm = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local OnOff = Instance.new("TextButton")
local TeethReceived = Instance.new("TextLabel")
local teeth = Instance.new("TextLabel")
local Webhook = Instance.new("TextBox")

--Properties:

sbautofarm.Name = "sb.autofarm"
sbautofarm.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
sbautofarm.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = sbautofarm
Frame.BackgroundColor3 = Color3.fromRGB(235, 152, 35)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.405108035, 0, 0.443817794, 0)
Frame.Size = UDim2.new(0, 222, 0, 85)

OnOff.Name = "On/Off"
OnOff.Parent = Frame
OnOff.BackgroundColor3 = Color3.fromRGB(255, 219, 12)
OnOff.BorderColor3 = Color3.fromRGB(0, 0, 0)
OnOff.Position = UDim2.new(0.0297019891, 0, 0.0731194019, 0)
OnOff.Size = UDim2.new(0, 54, 0, 32)
OnOff.Font = Enum.Font.SourceSans
OnOff.Text = "off"
OnOff.TextColor3 = Color3.fromRGB(0, 0, 0)
OnOff.TextSize = 34.000

TeethReceived.Name = "TeethReceived"
TeethReceived.Parent = Frame
TeethReceived.BackgroundColor3 = Color3.fromRGB(255, 219, 12)
TeethReceived.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeethReceived.Position = UDim2.new(0.306741923, 0, 0.090133667, 0)
TeethReceived.Size = UDim2.new(0, 146, 0, 30)
TeethReceived.Font = Enum.Font.SourceSans
TeethReceived.Text = "Teeth received: 0"
TeethReceived.TextColor3 = Color3.fromRGB(0, 0, 0)
TeethReceived.TextSize = 18.000
TeethReceived.TextWrapped = true

teeth.Name = "teeth"
teeth.Parent = TeethReceived
teeth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
teeth.BorderColor3 = Color3.fromRGB(0, 0, 0)
teeth.BorderSizePixel = 0
teeth.Position = UDim2.new(0, -3, 0.312000006, 0)
teeth.Visible = false
teeth.Font = Enum.Font.SourceSans
teeth.Text = ""
teeth.TextColor3 = Color3.fromRGB(0, 0, 0)
teeth.TextSize = 14.000

Webhook.Name = "Webhook"
Webhook.Parent = Frame
Webhook.BackgroundColor3 = Color3.fromRGB(255, 219, 12)
Webhook.BorderColor3 = Color3.fromRGB(0, 0, 0)
Webhook.Position = UDim2.new(0.0294249933, 0, 0.545426667, 0)
Webhook.Size = UDim2.new(0, 209, 0, 31)
Webhook.ClearTextOnFocus = false
Webhook.Font = Enum.Font.SourceSans
Webhook.PlaceholderColor3 = Color3.fromRGB(193, 162, 9)
Webhook.PlaceholderText = "Webhook url:"
Webhook.Text = ""
Webhook.TextColor3 = Color3.fromRGB(0, 0, 0)
Webhook.TextSize = 14.000
Webhook.TextWrapped = true

-- Scripts:

local function SRCX_fake_script() -- OnOff.on/off 
	local script = Instance.new('LocalScript', OnOff)

	local afk = script.Parent.Text
	
	script.Parent.MouseButton1Click:Connect(function()
		if script.Parent.Text == "off" then
			script.Parent.Text = "on"
		else
			script.Parent.Text = "off"
		end
	end)
	
end
coroutine.wrap(SRCX_fake_script)()
local function WVFCK_fake_script() -- OnOff.loop.tp 
	local script = Instance.new('LocalScript', OnOff)

	local textButton = script.Parent
	local isRunning = false
	
	textButton.MouseButton1Click:Connect(function()
		if textButton.Text == "on" then
			if not isRunning then
				isRunning = true
				while isRunning and textButton.Text == "on" do
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8.05339909, 464.527893, 31.5693302, 0.490018576, 4.31568949e-08, 0.871711969, 2.26567209e-08, 1, -6.2244311e-08, -0.871711969, 5.02510034e-08, 0.490018576)
					wait(4)
				end
			else
				isRunning = false
			end
		end
	end)
	
end
coroutine.wrap(WVFCK_fake_script)()
local function KCRXYTS_fake_script() -- TeethReceived.teethreceivedscript 
	local script = Instance.new('LocalScript', TeethReceived)

	local TotalTeeth = game:GetService("Players").LocalPlayer.PlayerGui.CoreGuis.Coins.Scorebox.TextLabel
	local StartTeeth = script.Parent.teeth
	local label = script.Parent
	
	local function onTextChanged()
		label.Text = "Teeth received: "..TotalTeeth.Text - StartTeeth.Rotation
	end
	
	TotalTeeth.Changed:Connect(onTextChanged)
	
end
coroutine.wrap(KCRXYTS_fake_script)()
local function BMPP_fake_script() -- Webhook.webhookscript 
	local script = Instance.new('LocalScript', Webhook)

	script.Parent.Parent.TeethReceived:GetPropertyChangedSignal("Text"):Connect(function()
		local TotalTeeth = game:GetService("Players").LocalPlayer.PlayerGui.CoreGuis.Coins.Scorebox.TextLabel
		local StartTeeth = script.Parent.Parent.TeethReceived.teeth
		local url = script.Parent.Text
		local data = {
			["embeds"] = {
				{
					["title"] = "received teeth: "..TotalTeeth.Text - StartTeeth.Rotation,
					["description"] = "total teeht: "..TotalTeeth.Text,
					["type"] = "rich",
					["color"] = tonumber(0x7269da)
				}
			}
		}
		local newdata = game:GetService("HttpService"):JSONEncode(data)
	
		local headers = {
			["content-type"] = "application/json"
		}
		request = http_request or request or HttpPost or syn.request
		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(abcdef)
	end)
	
end
coroutine.wrap(BMPP_fake_script)()
local function QOBKWN_fake_script() -- sbautofarm.draggable 
	local script = Instance.new('LocalScript', sbautofarm)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent.Frame
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(QOBKWN_fake_script)()
local function EBXKHA_fake_script() -- sbautofarm.preventkick 
	local script = Instance.new('LocalScript', sbautofarm)

	local vu = game:GetService("VirtualUser")
	
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end
coroutine.wrap(EBXKHA_fake_script)()
local function ESOQL_fake_script() -- sbautofarm.teethscript 
	local script = Instance.new('LocalScript', sbautofarm)

	wait(1)
	script.Parent.Frame.TeethReceived.teeth.Rotation = game:GetService("Players").LocalPlayer.PlayerGui.CoreGuis.Coins.Scorebox.TextLabel.Text
	wait(1)
	script:Destroy()
	
end
coroutine.wrap(ESOQL_fake_script)()
