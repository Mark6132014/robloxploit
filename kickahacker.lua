local Players = game:GetService("Players")
local player = Players.LocalPlayer
print("Loaded KickAHacker Script by Itzgametime Vip")

-- 🌀 Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SuiteKickTool"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- 📦 Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.4, 0) -- Scales with screen size
frame.Position = UDim2.new(0.5, -frame.Size.X.Offset/2, 0.5, -frame.Size.Y.Offset/2)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

-- 🧾 Title Label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🛡️ KickAHacker Script"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextScaled = true
title.Parent = frame

-- 🧍 Name Input
local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(0.8, 0, 0.2, 0)
nameBox.Position = UDim2.new(0.1, 0, 0.25, 0)
nameBox.PlaceholderText = "Enter player name"
nameBox.Text = ""
nameBox.TextScaled = true
nameBox.Font = Enum.Font.SourceSans
nameBox.TextColor3 = Color3.new(0, 0, 0)
nameBox.BackgroundColor3 = Color3.new(1, 1, 1)
nameBox.TextScaled = true
nameBox.Parent = frame

-- ⚔️ Kick Button
local kickButton = Instance.new("TextButton")
kickButton.Size = UDim2.new(0.8, 0, 0.2, 0)
kickButton.Position = UDim2.new(0.1, 0, 0.5, 0)
kickButton.Text = "Kick"
kickButton.Font = Enum.Font.SourceSansBold
kickButton.TextColor3 = Color3.new(1, 1, 1)
kickButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
kickButton.TextScaled = true
kickButton.Parent = frame

-- 📣 Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0.2, 0)
statusLabel.Position = UDim2.new(0, 0, 0.75, 0)
statusLabel.Text = ""
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextColor3 = Color3.new(1, 1, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextScaled = true
statusLabel.Parent = frame

-- ⚔️ Kick Logic
kickButton.MouseButton1Click:Connect(function()
	local targetName = nameBox.Text
	local targetPlayer = Players:WaitForChild(targetName)

	if targetPlayer then
		targetPlayer:Kick("You have been kicked by KickAHacker Script")
		statusLabel.Text = "✅ Kicked " .. targetName
		-- Show player that they've been kicked --
		local guiKicked = Instance.new("ScreenGui")
		guiKicked.Name = "kicked"
		guiKicked.ResetOnSpawn = false
		guiKicked.IgnoreGuiInset = true
		guiKicked.Parent = targetPlayer:WaitForChild("PlayerGui")

		-- 📦 Main Frame
		local frameKicked = Instance.new("Frame")
		frameKicked.Size = UDim2.new(0.4, 0, 0.4, 0) -- Scales with screen size
		frameKicked.Position = UDim2.new(0.5, -frame.Size.X.Offset/2, 0.5, -frame.Size.Y.Offset/2)
		frameKicked.AnchorPoint = Vector2.new(0.5, 0.5)
		frameKicked.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		frameKicked.BorderSizePixel = 0
		frameKicked.Parent = guiKicked

		-- 🧾 Title Label
		local titleKicked = Instance.new("TextLabel")
		titleKicked.Size = UDim2.new(1, 0, 0.2, 0)
		titleKicked.Position = UDim2.new(0, 0, 0, 0)
		titleKicked.Text = "🛡️ You have been kicked"
		titleKicked.Font = Enum.Font.SourceSansBold
		titleKicked.TextColor3 = Color3.new(1, 1, 1)
		titleKicked.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		titleKicked.TextScaled = true
		titleKicked.Parent = frameKicked

		-- 🧍 Name Input
		local nameBoxKicked = Instance.new("TextLabel")
		nameBoxKicked.Size = UDim2.new(0.8, 0, 0.2, 0)
		nameBoxKicked.Position = UDim2.new(0.1, 0, 0.25, 0)
		nameBoxKicked.Text = "Sorry, you have been kicked from KickAHacker Script to protect this experience. Go to https://mark6132014.github.io/robloxploit/kicked.html to learn more."
		nameBoxKicked.TextScaled = true
		nameBoxKicked.Font = Enum.Font.SourceSans
		nameBoxKicked.TextColor3 = Color3.new(0, 0, 0)
		nameBoxKicked.BackgroundColor3 = Color3.new(1, 1, 1)
		nameBoxKicked.TextScaled = true
		nameBoxKicked.Parent = frameKicked

		-- ⚔️ Kick Button
		local kickButtonKicked = Instance.new("TextButton")
		kickButtonKicked.Size = UDim2.new(0.8, 0, 0.2, 0)
		kickButtonKicked.Position = UDim2.new(0.1, 0, 0.5, 0)
		kickButtonKicked.Text = "Leave"
		kickButtonKicked.Font = Enum.Font.SourceSansBold
		kickButtonKicked.TextColor3 = Color3.new(1, 1, 1)
		kickButtonKicked.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		kickButtonKicked.TextScaled = true
		kickButtonKicked.Parent = frameKicked
		kickButtonKicked.MouseButton1Up:Connect(function()
			guiKicked.Parent.Parent:Kick("You left the game")
		end)
	else
		statusLabel.Text = "❌ Player not found: " .. targetName
	end
end)
