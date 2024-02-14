-- moves key to players inventory

local key = script.Parent
local clickDetector = key:FindFirstChild("ClickDetector")

clickDetector.MouseClick:Connect(function(player)
	local backpack = player.Backpack
	if backpack then
		local keyClone = key:Clone()
		keyClone.Parent = backpack
		key:Destroy()
	end
end)