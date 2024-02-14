-- Teleporter using two objects. 

local TeleportPart1 = script.Parent.TeleportPart1 
local TeleportPart2 = script.Parent.TeleportPart2


TeleportPart2.Touched:Connect(function(hit) -- function for when object is touched
	local w = hit.Parent:FindFirstChild("HumanoidRootPart")
	if w then
		w.CFrame = TeleportPart1.CFrame + Vector3.new(0, 5, 0) -- teleports player to other object on event
		TeleportPart1.CanTouch = false
		wait(1) -- Waits one second before the teleporter can be clicked again
		TeleportPart1.CanTouch = true
	end
end)