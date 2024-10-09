local PoorUi = {}

function PoorUi:Create(Title)
	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Frame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Sector = Instance.new("TextLabel")

	--Properties:

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(97, 98, 100)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.304476649, 0, 0.313835472, 0)
	Main.Size = UDim2.new(0.389, 0,0.378, 0)

	TextLabel.Parent = Main
	TextLabel.BackgroundColor3 = Color3.fromRGB(33, 33, 34)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1.004, 0,0.09, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.Text = Title or "PoorUi Lib"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	Frame.Parent = Main
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 0, 0.0902527049, 0)
	Frame.Size = UDim2.new(0, 475, 0, 252)

	UIListLayout.Parent = Frame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	

	-- Scripts:

	local function HTPWKIO_fake_script() -- Main.SmoothDrag 
		local script = Instance.new('LocalScript', Main)

		local Drag = script.Parent
		local gsCoreGui = game:GetService("CoreGui")
		local gsTween = game:GetService("TweenService")
		local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.04
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)

	end
	coroutine.wrap(HTPWKIO_fake_script)()
	
	function PoorUi:CreateButton(Text,callback)
		local TextButton = Instance.new("TextButton")
		
		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0, 0, 0.0912698433, 0)
		TextButton.Size = UDim2.new(0.996, 0,0.1, 0)
		TextButton.Font = Enum.Font.SourceSansBold
		TextButton.Text = Text or "Button"
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextScaled = true
		TextButton.TextSize = 14.000
		TextButton.TextWrapped = true
		
		TextButton.MouseButton1Click:Connect(function()
			
			pcall(callback)
			
		end)
	end
end

return PoorUi

