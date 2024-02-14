--[[
This script is for the function of the entire gear puzzle
]]

local GearNames = {
	"GearPuzzlePiece1",
	"GearPuzzlePiece2",
	"GearPuzzlePiece3",
	"GearPuzzlePiece4",
	"GearPuzzlePiece5",
	"GearPuzzlePiece6",
	"GearPuzzlePiece7"
}

local GearTools = {}
-- inserts items from players backpack into table: GearTools
game.Players.PlayerAdded:Connect(function(player)
	task.wait(5)
	--print("player added")
	player.Backpack.ChildAdded:Connect(function(item)
		--print("child added")
		if item:IsA("Tool") then
			--print("tool")
			local gearName = item.Name
			for i, name in ipairs(GearNames) do
				if string.find(gearName, name) then
					table.insert(GearTools, item)
					--print("Inserted Tool:", item.Name)
					break
				end
			end
		end
	end)
end)

local GH = game.workspace.GearPuzzleChallenge.BlueChallenge.GearHangers

local Hangers = {
	GH.BadHanger1,
	GH.BadHanger2,
	GH.BadHanger3,
	GH.BadHanger4,
	GH.BadHanger5,
	GH.CorrectHanger1,
	GH.CorrectHanger2,
	GH.CorrectHanger3,
	GH.CorrectHanger4,
	GH.CorrectHanger5,
	GH.CorrectHanger6,
	GH.CorrectHanger7
}

local currentGearIndex = 1
--places the gears on the hangers if hangers are clicked 
for i, piece in ipairs(Hangers) do 
	local clickDetector = piece:FindFirstChild("ClickDetector")
	if clickDetector then
		clickDetector.MouseClick:Connect(function(player)
			--print(clickDetector.Parent)

			local clickedHanger = piece
			if currentGearIndex <= #GearTools  then
				--print("works!")
				local gearToPlace = GearTools[currentGearIndex] -- The placed gear goes by the first gear in inventory
				if not gearToPlace:IsDescendantOf(clickedHanger) then
					local handle = gearToPlace:FindFirstChild("Handle")
					local gearPiece = gearToPlace:FindFirstChild("GearPuzzlePiece")
					if handle and gearPiece then
						handle.CFrame = clickedHanger.CFrame 
						gearPiece.CFrame = clickedHanger.CFrame
						gearToPlace.Parent = clickedHanger
						handle.Anchored = true
						gearPiece.Anchored = true
						--print("Placed gear" .. currentGearIndex)
						if gearToPlace.Name == "GearPuzzlePiece1" then
							gearToPlace.Handle.Orientation = Vector3.new(-0.66, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(-0.66, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece2" then
							gearToPlace.Handle.Orientation = Vector3.new(7.87, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(7.87, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece3" then
							gearToPlace.Handle.Orientation = Vector3.new(-13.22, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(-13.22, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece4" then
							gearToPlace.Handle.Orientation = Vector3.new(5.18, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(5.18, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece5" then
							gearToPlace.Handle.Orientation = Vector3.new(11.84, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(11.84, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece6" then
							gearToPlace.Handle.Orientation = Vector3.new(17.02, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(17.02, -135.92, -90)
						elseif gearToPlace.Name == "GearPuzzlePiece7" then
							gearToPlace.Handle.Orientation = Vector3.new(0, -135.92, -90)
							gearToPlace.GearPuzzlePiece.Orientation = Vector3.new(0, -135.92, -90)
						end
					else
						--print("Handle or GearPuzzlePiece not found in Gear")
					end
				end
				currentGearIndex = currentGearIndex + 1
			else
				--print("no gears to place!")
			end
		end)
	end 
end

for i, piece in ipairs(Hangers) do
	local clickDetector = piece:FindFirstChild("ClickDetector")
	if clickDetector then--print("good clicker")
		clickDetector.MouseClick:Connect(function(player)
			local gearOnHanger = piece:FindFirstChildOfClass("Tool")
			if gearOnHanger then
				local handle2 = gearOnHanger:FindFirstChild("Handle")
				local gearPiece2 = gearOnHanger:FindFirstChild("GearPuzzlePiece")
				handle2.Anchored = false
				gearPiece2.Anchored = false
				gearOnHanger.Parent = player.Backpack
				--print("Gear picked up")
				-- Additional logic for repositioning the gear back to its initial state if needed
			end
		end)
	end 
end

local allPiecesInPlace = false
local lever = game.workspace.GearPuzzleChallenge.BlueChallenge.lever.lever.ClickDetector
local GH = game.workspace.GearPuzzleChallenge.BlueChallenge.GearHangers
local CorrectHangers = {
	GH.CorrectHanger1,
	GH.CorrectHanger2,
	GH.CorrectHanger3,
	GH.CorrectHanger4,
	GH.CorrectHanger5,
	GH.CorrectHanger6,
	GH.CorrectHanger7
}


local function checkAllPiecesInPlace() -- Checks to see if all pieces are in the right place
--[[
Note that the gear pieces are in the right place if their parents are the hangers of correlation
eg, GearPuzzlePiece1 corresponds to CorrectHanger1 and so on
]]
	for i, correctHanger in ipairs(CorrectHangers) do
		--print(correctHanger.Name)
		for i, child in ipairs(correctHanger:GetChildren()) do
			--print(child.Name)
		end
		local gearPieceName = "GearPuzzlePiece" .. i
		local gearPiece = correctHanger:FindFirstChild(gearPieceName)
		if not gearPiece then
			allPiecesInPlace = false 
			--print("wrong")
			break
		else
			allPiecesInPlace = true
			--print("right")
		end
	end
	if allPiecesInPlace then 
		--print("good")
		for i, correctHanger in ipairs(CorrectHangers) do
			local gearPieceName = "GearPuzzlePiece" .. i
			local gearPiece = correctHanger:FindFirstChild(gearPieceName)
			if gearPiece then
				--print("YES YES YES")
				local handle = gearPiece:FindFirstChild("Handle")
				local puzzlePiece = gearPiece:FindFirstChild("GearPuzzlePiece")

				task.delay(2, function() -- raising the flag when all pieces are in place
					local flag = workspace.GearPuzzleChallenge.BlueChallenge.Flag.Flag
					local bar = workspace.GearPuzzleChallenge.BlueChallenge.Flag.Cyl
					local Tween = game:GetService("TweenService")

					local barTween = {}
					barTween.Position = Vector3.new(2233.107, 28.602, -2080.002)
					local barTweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quart)
					local barTween = Tween:Create(bar, barTweenInfo, barTween)

					local flagTween = {}
					flagTween.Size = Vector3.new(6.67, 19.501, 0.276)
					flagTween.Position = Vector3.new(2233.09, 18.733, -2080.049)
					local flagTweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quart)
					local flagTween = Tween:Create(flag, flagTweenInfo, flagTween)

					barTween:Play()
					flagTween:Play()
				end)
				
				if handle and puzzlePiece then
					game.Workspace.GearPuzzleChallenge.BlueChallenge.GearPuzzlePieces.AGearLockedPiece.Script.Disabled = false
					game.Workspace.GearPuzzleChallenge.BlueChallenge.GearPuzzlePieces.BGearLockedPiece.Script.Disabled = false
					--print("spin dat ish")
					coroutine.wrap(function() -- wraps function to spin gears before the flag is raised
						for j = 1, 1000 do -- rotation of gears once all pieces are in place
							handle.CFrame = handle.CFrame * CFrame.fromEulerAnglesXYZ(0, 0.15, 0)
							puzzlePiece.CFrame = puzzlePiece.CFrame * CFrame.fromEulerAnglesXYZ(0, 0.15, 0)
							task.wait()
						end
					end)()
				else
					--print("Handle or GearPuzzlePiece not found in Gear")
				end
			end
		end
	end
end

lever.MouseClick:Connect(function() -- Once the lever is clicked, checks all pieces are in place
	print("event fired")
	checkAllPiecesInPlace()
end) 
