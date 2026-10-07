local CoreGui = game:GetService("CoreGui")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")



local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local rootPart = character:WaitForChild("HumanoidRootPart")

local humanoid = character:WaitForChild("Humanoid")



local isR6 = (humanoid.RigType == Enum.HumanoidRigType.R6)



local parentGui = (gethui and gethui()) or CoreGui

if parentGui:FindFirstChild("FlingReverseDeltaGui") then

	parentGui.FlingReverseDeltaGui:Destroy()

end



local screenGui = Instance.new("ScreenGui")

screenGui.Name = "FlingReverseDeltaGui"

screenGui.ResetOnSpawn = false

screenGui.Parent = parentGui



local mainFrame = Instance.new("Frame")

mainFrame.Size = UDim2.new(0, 310, 0, 500)

mainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)

mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)

mainFrame.BackgroundTransparency = 0.35

mainFrame.BorderSizePixel = 0

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.Parent = screenGui



local corner = Instance.new("UICorner")

corner.CornerRadius = UDim.new(0, 10)

corner.Parent = mainFrame



-- TÍTULO DA GUI

local titleLabel = Instance.new("TextLabel")

titleLabel.Size = UDim2.new(1, 0, 0, 25)

titleLabel.Position = UDim2.new(0, 0, 0, 0)

titleLabel.BackgroundTransparency = 1

titleLabel.Text = "Troll Reverse (Invisible Seat Fix)"

titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

titleLabel.TextScaled = true

titleLabel.Font = Enum.Font.SourceSansBold

titleLabel.Parent = mainFrame



-- NAVEGAÇÃO

local navFrame = Instance.new("Frame")

navFrame.Size = UDim2.new(1, 0, 0, 30)

navFrame.Position = UDim2.new(0, 0, 0, 25)

navFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)

navFrame.BackgroundTransparency = 0.3

navFrame.BorderSizePixel = 0

navFrame.Parent = mainFrame



local function createTabBtn(text, pos, size)

	local btn = Instance.new("TextButton")

	btn.Size = size

	btn.Position = pos

	btn.BackgroundTransparency = 1

	btn.Text = text

	btn.TextColor3 = Color3.fromRGB(150, 150, 150)

	btn.TextScaled = true

	btn.Font = Enum.Font.SourceSansBold

	btn.Parent = navFrame

	return btn

end



local tabCount = isR6 and 5 or 4

local tabWidth = 1 / tabCount



local tab1Btn = createTabBtn("Fling", UDim2.new(0 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

local tab2Btn = createTabBtn("Reverse", UDim2.new(1 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

local tab3Btn = nil

local tab4Btn = nil

local tab5Btn = nil



if isR6 then

	tab3Btn = createTabBtn("Animacao", UDim2.new(2 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

	tab4Btn = createTabBtn("Head", UDim2.new(3 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

	tab5Btn = createTabBtn("Extras", UDim2.new(4 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

else

	tab4Btn = createTabBtn("Head", UDim2.new(2 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

	tab5Btn = createTabBtn("Extras", UDim2.new(3 * tabWidth, 0, 0, 0), UDim2.new(tabWidth, 0, 1, 0))

end



tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)



local page1 = Instance.new("Frame")

page1.Size = UDim2.new(1, 0, 0.85, 0)

page1.Position = UDim2.new(0, 0, 0.15, 0)

page1.BackgroundTransparency = 1

page1.Parent = mainFrame



local page2 = Instance.new("Frame")

page2.Size = UDim2.new(1, 0, 0.85, 0)

page2.Position = UDim2.new(0, 0, 0.15, 0)

page2.BackgroundTransparency = 1

page2.Visible = false

page2.Parent = mainFrame



local page3 = nil

if isR6 then

	page3 = Instance.new("Frame")

	page3.Size = UDim2.new(1, 0, 0.85, 0)

	page3.Position = UDim2.new(0, 0, 0.15, 0)

	page3.BackgroundTransparency = 1

	page3.Visible = false

	page3.Parent = mainFrame

end



local pageHead = Instance.new("Frame")

pageHead.Size = UDim2.new(1, 0, 0.85, 0)

pageHead.Position = UDim2.new(0, 0, 0.15, 0)

pageHead.BackgroundTransparency = 1

pageHead.Visible = false

pageHead.Parent = mainFrame



local page4 = Instance.new("Frame")

page4.Size = UDim2.new(1, 0, 0.85, 0)

page4.Position = UDim2.new(0, 0, 0.15, 0)

page4.BackgroundTransparency = 1

page4.Visible = false

page4.Parent = mainFrame



local function resetTabColors()

	tab1Btn.TextColor3 = Color3.fromRGB(150, 150, 150)

	tab2Btn.TextColor3 = Color3.fromRGB(150, 150, 150)

	if tab3Btn then tab3Btn.TextColor3 = Color3.fromRGB(150, 150, 150) end

	if tab4Btn then tab4Btn.TextColor3 = Color3.fromRGB(150, 150, 150) end

	if tab5Btn then tab5Btn.TextColor3 = Color3.fromRGB(150, 150, 150) end

	

	page1.Visible = false

	page2.Visible = false

	if page3 then page3.Visible = false end

	pageHead.Visible = false

	page4.Visible = false

end



tab1Btn.MouseButton1Click:Connect(function()

	resetTabColors()

	page1.Visible = true

	tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

end)



tab2Btn.MouseButton1Click:Connect(function()

	resetTabColors()

	page2.Visible = true

	tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

end)



if tab3Btn then

	tab3Btn.MouseButton1Click:Connect(function()

		resetTabColors()

		if page3 then page3.Visible = true end

		tab3Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	end)

end



tab4Btn.MouseButton1Click:Connect(function()

	resetTabColors()

	pageHead.Visible = true

	tab4Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

end)



if tab5Btn then

	tab5Btn.MouseButton1Click:Connect(function()

		resetTabColors()

		page4.Visible = true

		tab5Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	end)

end



local function createButton(parent, text, pos, size, bgCol)

	local btn = Instance.new("TextButton")

	btn.Size = size or UDim2.new(0.9, 0, 0.08, 0)

	btn.Position = pos

	btn.BackgroundColor3 = bgCol

	btn.BackgroundTransparency = 0.15

	btn.Text = text

	btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	btn.TextScaled = true

	btn.Font = Enum.Font.SourceSansBold

	btn.Parent = parent

	

	local btnCorner = Instance.new("UICorner")

	btnCorner.CornerRadius = UDim.new(0, 6)

	btnCorner.Parent = btn

	return btn

end



-- VARIÁVEIS DE CONFIGURAÇÃO DOS SLIDERS

local savedSettings = {

	headHeight = 1.5,

	backDistance = 1.3

}



local headOffsetHeight = savedSettings.headHeight

local backDistOffset = savedSettings.backDistance



local function createSlider(parent, titleText, pos, minVal, maxVal, defaultVal, onChange)

	local label = Instance.new("TextLabel")

	label.Size = UDim2.new(0.9, 0, 0.04, 0)

	label.Position = pos

	label.BackgroundTransparency = 1

	label.Text = titleText .. ": " .. tostring(defaultVal)

	label.TextColor3 = Color3.fromRGB(220, 220, 220)

	label.TextScaled = true

	label.Font = Enum.Font.SourceSans

	label.Parent = parent



	local track = Instance.new("Frame")

	track.Size = UDim2.new(0.9, 0, 0.025, 0)

	track.Position = UDim2.new(0.05, 0, pos.Y.Scale + 0.04, 0)

	track.BackgroundColor3 = Color3.fromRGB(50, 50, 60)

	track.BorderSizePixel = 0

	track.Parent = parent

	

	local trackCorner = Instance.new("UICorner")

	trackCorner.CornerRadius = UDim.new(1, 0)

	trackCorner.Parent = track



	local knob = Instance.new("TextButton")

	knob.Size = UDim2.new(0.1, 0, 1.8, 0)

	local initialPct = (defaultVal - minVal) / (maxVal - minVal)

	knob.Position = UDim2.new(math.clamp(initialPct - 0.05, 0, 0.9), 0, -0.4, 0)

	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

	knob.Text = ""

	knob.Parent = track



	local knobCorner = Instance.new("UICorner")

	knobCorner.CornerRadius = UDim.new(1, 0)

	knobCorner.Parent = knob



	local dragging = false

	knob.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

			dragging = true

		end

	end)



	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

			dragging = false

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then

			local mousePos = input.Position.X

			local trackAbsPos = track.AbsolutePosition.X

			local trackAbsSize = track.AbsoluteSize.X



			local pct = math.clamp((mousePos - trackAbsPos) / trackAbsSize, 0, 1)

			knob.Position = UDim2.new(pct - 0.05, 0, -0.4, 0)



			local calculatedVal = math.floor((minVal + (pct * (maxVal - minVal))) * 10) / 10

			label.Text = titleText .. ": " .. tostring(calculatedVal)

			onChange(calculatedVal)

		end

	end)

end



-- ABA 1: FLING ME

local isFlinging = false

local isReversingFling = false

local flingHistory = {}

local flingPower = 500

local flingReverseSpeed = 1



local flingBtn = createButton(page1, "Fling Me", UDim2.new(0.05, 0, 0.04, 0), nil, Color3.fromRGB(220, 50, 50))

local reverseFlingBtn = createButton(page1, "Reverse", UDim2.new(0.05, 0, 0.16, 0), nil, Color3.fromRGB(50, 150, 220))



createSlider(page1, "Forca Fling", UDim2.new(0.05, 0, 0.30, 0), 100, 2000, 500, function(val) flingPower = val end)

createSlider(page1, "Velocidade Reverse", UDim2.new(0.05, 0, 0.52, 0), 1, 5, 1, function(val) flingReverseSpeed = val end)



flingBtn.MouseButton1Click:Connect(function()

	if isReversingFling then return end

	isFlinging = not isFlinging

	if isFlinging then

		flingHistory = {}

		flingBtn.Text = "STOP FLING"

		flingBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)

	else

		flingBtn.Text = "Fling Me"

		flingBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)

		if rootPart then

			rootPart.AssemblyLinearVelocity = Vector3.zero

			rootPart.AssemblyAngularVelocity = Vector3.zero

		end

	end

end)



reverseFlingBtn.MouseButton1Click:Connect(function()

	if isReversingFling or #flingHistory == 0 then return end

	isFlinging = false

	flingBtn.Text = "Fling Me"

	flingBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)

	isReversingFling = true

	reverseFlingBtn.Text = "Volta..."

	

	if rootPart then

		rootPart.AssemblyLinearVelocity = Vector3.zero

		rootPart.AssemblyAngularVelocity = Vector3.zero

	end



	task.spawn(function()

		local index = #flingHistory

		while index >= 1 do

			if not character or not rootPart then break end

			if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Physics) end

			

			rootPart.CFrame = flingHistory[math.floor(index)]

			rootPart.AssemblyLinearVelocity = Vector3.zero

			rootPart.AssemblyAngularVelocity = Vector3.zero

			

			index = index - flingReverseSpeed

			task.wait(0.016)

		end

		

		if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end

		

		flingHistory = {}

		isReversingFling = false

		reverseFlingBtn.Text = "Reverse"

	end)

end)



-- ABA 2: REVERSE MANUAL

local isRecordingManual = false

local isReversingManual = false

local manualHistory = {}

local manualReverseSpeed = 1



local recordBtn = createButton(page2, "Record", UDim2.new(0.05, 0, 0.03, 0), nil, Color3.fromRGB(40, 180, 80))

local playBtn = createButton(page2, "Reverse Play", UDim2.new(0.05, 0, 0.15, 0), nil, Color3.fromRGB(50, 150, 220))

local stopBtn = createButton(page2, "Stop", UDim2.new(0.05, 0, 0.27, 0), nil, Color3.fromRGB(210, 50, 50))

local restartBtn = createButton(page2, "Restart", UDim2.new(0.05, 0, 0.39, 0), nil, Color3.fromRGB(200, 120, 30))



createSlider(page2, "Velocidade Reverse", UDim2.new(0.05, 0, 0.55, 0), 1, 5, 1, function(val) manualReverseSpeed = val end)



recordBtn.MouseButton1Click:Connect(function()

	if isReversingManual then return end

	isRecordingManual = not isRecordingManual

	if isRecordingManual then

		recordBtn.Text = "Recording..."

		recordBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)

	else

		recordBtn.Text = "Record"

		recordBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

	end

end)



stopBtn.MouseButton1Click:Connect(function()

	isRecordingManual = false

	isReversingManual = false

	recordBtn.Text = "Record"

	recordBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

	playBtn.Text = "Reverse Play"

	if rootPart then

		rootPart.AssemblyLinearVelocity = Vector3.zero

		rootPart.AssemblyAngularVelocity = Vector3.zero

	end

	if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end

end)



restartBtn.MouseButton1Click:Connect(function()

	if isReversingManual then return end

	manualHistory = {}

	isRecordingManual = false

	recordBtn.Text = "Record"

	recordBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

	restartBtn.Text = "Limpo!"

	task.wait(0.8)

	restartBtn.Text = "Restart"

end)



playBtn.MouseButton1Click:Connect(function()

	if isReversingManual or #manualHistory == 0 then return end

	isRecordingManual = false

	recordBtn.Text = "Record"

	recordBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)

	isReversingManual = true

	playBtn.Text = "Reversing..."

	

	if rootPart then

		rootPart.AssemblyLinearVelocity = Vector3.zero

		rootPart.AssemblyAngularVelocity = Vector3.zero

	end



	task.spawn(function()

		local index = #manualHistory

		while index >= 1 and isReversingManual do

			if not character or not rootPart then break end

			if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Physics) end

			

			rootPart.CFrame = manualHistory[math.floor(index)]

			rootPart.AssemblyLinearVelocity = Vector3.zero

			rootPart.AssemblyAngularVelocity = Vector3.zero

			

			index = index - manualReverseSpeed

			task.wait(0.016)

		end

		

		if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end

		

		isReversingManual = false

		playBtn.Text = "Reverse Play"

	end)

end)



-- ABA HEAD: SISTEMA COM CADEIRA INVISÍVEL (SEAT)

local invisibleSeat = nil

local seatWeld = nil

local headTarget = nil

local headMode = "Head"



local function getPlayerByPartialName(partial)

	partial = string.lower(partial)

	if partial == "" then return nil end

	for _, p in ipairs(Players:GetPlayers()) do

		if p ~= player then

			if string.find(string.lower(p.Name), partial) or string.find(string.lower(p.DisplayName), partial) then

				return p

			end

		end

	end

	return nil

end



local function destroySeat()

	if seatWeld then seatWeld:Destroy() seatWeld = nil end

	if invisibleSeat then invisibleSeat:Destroy() invisibleSeat = nil end

	if humanoid then humanoid.Sit = false end

end



local function createAndAttachSeat(targetPart, mode)

	destroySeat()

	if not targetPart or not rootPart then return end



	-- Criando a Cadeira Invisível

	invisibleSeat = Instance.new("Seat")

	invisibleSeat.Name = "InvisSeat_FE"

	invisibleSeat.Size = Vector3.new(1, 1, 1)

	invisibleSeat.Transparency = 1

	invisibleSeat.CanCollide = false

	invisibleSeat.Anchored = false

	invisibleSeat.Parent = Workspace



	-- Prende a Cadeira no Alvo através de WeldConstraint

	seatWeld = Instance.new("WeldConstraint")

	seatWeld.Part0 = invisibleSeat

	seatWeld.Part1 = targetPart

	seatWeld.Parent = invisibleSeat



	-- Ajusta a posição inicial da Cadeira

	if mode == "Head" then

		invisibleSeat.CFrame = targetPart.CFrame * CFrame.new(0, headOffsetHeight, 0)

	else

		invisibleSeat.CFrame = targetPart.CFrame * CFrame.new(0, headOffsetHeight - 1.5, backDistOffset) * CFrame.Angles(0, math.rad(180), 0)

	end



	-- Senta o seu personagem na cadeira invisível

	invisibleSeat:Sit(humanoid)

end



sitHeadBtn.MouseButton1Click:Connect(function()

	local target = getPlayerByPartialName(nameInput.Text)

	if target and target.Character and target.Character:FindFirstChild("Head") then

		headTarget = target.Character.Head

		headMode = "Head"

		createAndAttachSeat(headTarget, headMode)

	else

		sitHeadBtn.Text = "Jogador Nao Encontrado!"

		task.wait(1.5)

		sitHeadBtn.Text = "Sentar na Cabeca (Cadeira)"

	end

end)



sitBackBtn.MouseButton1Click:Connect(function()

	local target = getPlayerByPartialName(nameInput.Text)

	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then

		headTarget = target.Character.HumanoidRootPart

		headMode = "Back"

		createAndAttachSeat(headTarget, headMode)

	else

		sitBackBtn.Text = "Jogador Nao Encontrado!"

		task.wait(1.5)

		sitBackBtn.Text = "Sentar Costa a Costa (Cadeira)"

	end

end)



stopSitBtn.MouseButton1Click:Connect(function()

	headTarget = nil

	destroySeat()

end)



-- ABA EXTRAS

local activeCage = nil

local cageSize = 15



local function removeCage()

	if activeCage then

		activeCage:Destroy()

		activeCage = nil

	end

end



local function buildCage(size)

	removeCage()

	if not rootPart then return end



	local raycastParams = RaycastParams.new()

	raycastParams.FilterDescendantsInstances = {character}

	raycastParams.FilterType = Enum.RaycastFilterType.Exclude



	local rayResult = Workspace:Raycast(rootPart.Position, Vector3.new(0, -20, 0), raycastParams)

	local groundY = rayResult and rayResult.Position.Y or (rootPart.Position.Y - 3)



	activeCage = Instance.new("Model")

	activeCage.Name = "BarrierCage_FE"



	local thickness = 1

	local half = size / 2



	local centerPos = Vector3.new(rootPart.Position.X, groundY + half, rootPart.Position.Z)

	local centerCF = CFrame.new(centerPos)



	local wallsData = {

		{Size = Vector3.new(size, thickness, size), Offset = CFrame.new(0, -half, 0)},

		{Size = Vector3.new(size, thickness, size), Offset = CFrame.new(0, half, 0)},

		{Size = Vector3.new(size, size, thickness), Offset = CFrame.new(0, 0, half)},

		{Size = Vector3.new(size, size, thickness), Offset = CFrame.new(0, 0, -half)},

		{Size = Vector3.new(thickness, size, size), Offset = CFrame.new(half, 0, 0)},

		{Size = Vector3.new(thickness, size, size), Offset = CFrame.new(-half, 0, 0)}

	}



	for _, data in ipairs(wallsData) do

		local wall = Instance.new("Part")

		wall.Size = data.Size

		wall.CFrame = centerCF * data.Offset

		wall.Anchored = true

		wall.CanCollide = true

		wall.Material = Enum.Material.Neon

		wall.Transparency = 0.85

		wall.Parent = activeCage

	end



	activeCage.Parent = Workspace

end



local blockBtn = createButton(page4, "Criar Caixa Barreira", UDim2.new(0.05, 0, 0.05, 0), nil, Color3.fromRGB(40, 160, 120))

local removeBlockBtn = createButton(page4, "Remover Caixa", UDim2.new(0.05, 0, 0.18, 0), nil, Color3.fromRGB(180, 50, 50))



createSlider(page4, "Grossura do Bloco", UDim2.new(0.05, 0, 0.35, 0), 10, 100, 15, function(val)

	cageSize = val

	if activeCage then buildCage(cageSize) end

end)



blockBtn.MouseButton1Click:Connect(function() buildCage(cageSize) end)

removeBlockBtn.MouseButton1Click:Connect(function() removeCage() end)



-- RESET / LIMPEZA

player.CharacterAdded:Connect(function(newChar)

	character = newChar

	rootPart = character:WaitForChild("HumanoidRootPart")

	humanoid = character:WaitForChild("Humanoid")

	removeCage()

	destroySeat()

end)



-- UPDATE CONTINUO DA POSIÇÃO DA CADEIRA

RunService.RenderStepped:Connect(function()

	if invisibleSeat and headTarget and headTarget.Parent then

		if headMode == "Head" then

			invisibleSeat.CFrame = headTarget.CFrame * CFrame.new(0, headOffsetHeight, 0)

		else

			invisibleSeat.CFrame = headTarget.CFrame * CFrame.new(0, headOffsetHeight - 1.5, backDistOffset) * CFrame.Angles(0, math.rad(180), 0)

		end

	end

end)
