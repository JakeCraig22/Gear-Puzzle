--[[
when the proximity prompt of the sandmound is prompted, the user is frozen for
5 seconds, the sandmound is destroyed, and the user is unfrozen
]]

local s = script.Parent
--[[local SandPiles = {
	s.Sand1.ProximityPrompt,
	s.Sand2.ProximityPrompt,
	s.Sand3.ProximityPrompt,
	s.Sand4.ProximityPrompt,
	s.Sand5.ProximityPrompt,
	s.Sand6.ProximityPrompt,
	s.Sand7.ProximityPrompt,
	s.Sand8.ProximityPrompt,
	s.Sand9.ProximityPrompt
}--]]

local empty = {} -- puts the sandmounds into a list
for i,v in ipairs(s:getDescendants()) do
	if v:IsA("ProximityPrompt") then
		table.insert(empty,v)
	end
end


for i, ProximityPrompt in ipairs(empty) do -- if the proximity prompt in one of the items in the list is prompted then...
	ProximityPrompt.Triggered:Connect(function(player)
		local hum = player.Character:FindFirstChild("Humanoid")
		hum.WalkSpeed = 0
		wait(5)
		ProximityPrompt.Parent:Destroy()
		hum.WalkSpeed = 16
	end)
end