--[[
if the key is in the players inventory and the lock is clicked, the chest roof will
be moved to the side and the chest will be opened. 
]]

local clickDetector = script.Parent.ClickDetector
local ChestRoof = game.Workspace.GearPuzzleChallenge.BlueChallenge.Chest.ChestROOF

clickDetector.MouseClick:Connect(function(player)
	local backpack = player.Backpack
	local key = backpack and backpack:findFirstChild("BKey") 
	
	if key then -- Checks to see if the key is in the players inventory
		script.Parent:Destroy() -- destroys lock
		for i, part in ipairs(ChestRoof:GetDescendants()) do -- takes all parts of the chest
			if part:isA("BasePart") then
				local currentPosition = part.Position -- setting new position of chest roof
				part.Position = Vector3.new(currentPosition.X - 3.599, currentPosition.Y - 3.858, currentPosition.Z + 3.485)
			end
		end
	end
end)

--2230.895, 4.181, -2076.536
--2234.494, 8.039, -2080.021
--3.599, +3.858, +3.485