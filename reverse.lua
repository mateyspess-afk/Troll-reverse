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
titleLabel.Text = "Troll Reverse (FE Fix)"
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
	
	local savedCollisions = {}
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			savedCollisions[part] = part.CanCollide
			part.CanCollide = false
		end
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
		
		for part, state in pairs(savedCollisions) do
			if part and part.Parent then part.CanCollide = state end
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
	
	local savedCollisions = {}
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			savedCollisions[part] = part.CanCollide
			part.CanCollide = false
		end
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
		
		for part, state in pairs(savedCollisions) do
			if part and part.Parent then part.CanCollide = state end
		end
		if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
		
		isReversingManual = false
		playBtn.Text = "Reverse Play"
	end)
end)

-- ABA 3: ANIMAÇÃO + RAGDOLL
local isHelicopter = false
local isCrazyAnim = false
local isRagdoll = false
local spinSpeed = 50
local ragdollFolder = nil
local ragdollSteppedConnection = nil

if isR6 and page3 then
	local heliBtn = createButton(page3, "Helicoptero FE", UDim2.new(0.05, 0, 0.03, 0), nil, Color3.fromRGB(130, 60, 200))
	local crazyBtn = createButton(page3, "Spin Doido FE", UDim2.new(0.05, 0, 0.14, 0), nil, Color3.fromRGB(200, 100, 30))
	local ragdollBtn = createButton(page3, "Ragdoll FE (Fix)", UDim2.new(0.05, 0, 0.25, 0), nil, Color3.fromRGB(180, 140, 20))
	local resetAnimBtn = createButton(page3, "Reset Animacoes", UDim2.new(0.05, 0, 0.36, 0), nil, Color3.fromRGB(40, 180, 80))

	createSlider(page3, "Velocidade Giro", UDim2.new(0.05, 0, 0.50, 0), 10, 200, 50, function(val)
		spinSpeed = val
	end)

	local function toggleRagdoll(state)
		if not character or not humanoid then return end
		
		if ragdollSteppedConnection then
			ragdollSteppedConnection:Disconnect()
			ragdollSteppedConnection = nil
		end

		if state then
			if ragdollFolder then ragdollFolder:Destroy() end
			ragdollFolder = Instance.new("Folder")
			ragdollFolder.Name = "RagdollJoints"
			ragdollFolder.Parent = character

			humanoid:ChangeState(Enum.HumanoidStateType.Physics)
			
			for _, v in ipairs(character:GetDescendants()) do
				if v:IsA("Motor6D") and v.Name ~= "Neck" then
					v.Enabled = false
					
					local a0 = Instance.new("Attachment")
					local a1 = Instance.new("Attachment")
					a0.CFrame = v.C0
					a1.CFrame = v.C1
					a0.Parent = v.Part0
					a1.Parent = v.Part1

					local constraint = Instance.new("BallSocketConstraint")
					constraint.Attachment0 = a0
					constraint.Attachment1 = a1
					constraint.LimitsEnabled = true
					constraint.TwistLimitsEnabled = true
					constraint.Parent = ragdollFolder
				end
			end

			ragdollSteppedConnection = RunService.Stepped:Connect(function()
				if isRagdoll and character and humanoid then
					humanoid:ChangeState(Enum.HumanoidStateType.Physics)
					humanoid.PlatformStand = true
					for _, v in ipairs(character:GetDescendants()) do
						if v:IsA("Motor6D") and v.Name ~= "Neck" then
							v.Enabled = false
						end
					end
				end
			end)
		else
			if ragdollFolder then
				ragdollFolder:Destroy()
				ragdollFolder = nil
			end
			
			for _, v in ipairs(character:GetDescendants()) do
				if v:IsA("Motor6D") then
					v.Enabled = true
				end
			end
			humanoid.PlatformStand = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end
	end

	heliBtn.MouseButton1Click:Connect(function()
		isHelicopter = not isHelicopter
		if isCrazyAnim then isCrazyAnim = false crazyBtn.Text = "Spin Doido FE" end
		if isHelicopter then
			heliBtn.Text = "Stop Helicoptero"
			heliBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		else
			heliBtn.Text = "Helicoptero FE"
			heliBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 200)
			if rootPart then rootPart.AssemblyAngularVelocity = Vector3.zero end
		end
	end)

	crazyBtn.MouseButton1Click:Connect(function()
		isCrazyAnim = not isCrazyAnim
		if isHelicopter then isHelicopter = false heliBtn.Text = "Helicoptero FE" end
		if isCrazyAnim then
			crazyBtn.Text = "Stop Doido"
			crazyBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		else
			crazyBtn.Text = "Spin Doido FE"
			crazyBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 30)
			if rootPart then rootPart.AssemblyAngularVelocity = Vector3.zero end
		end
	end)

	ragdollBtn.MouseButton1Click:Connect(function()
		isRagdoll = not isRagdoll
		toggleRagdoll(isRagdoll)
		if isRagdoll then
			ragdollBtn.Text = "Stop Ragdoll"
			ragdollBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
		else
			ragdollBtn.Text = "Ragdoll FE (Fix)"
			ragdollBtn.BackgroundColor3 = Color3.fromRGB(180, 140, 20)
		end
	end)

	resetAnimBtn.MouseButton1Click:Connect(function()
		isHelicopter = false
		isCrazyAnim = false
		isRagdoll = false
		toggleRagdoll(false)
		
		heliBtn.Text = "Helicoptero FE"
		heliBtn.BackgroundColor3 = Color3.fromRGB(130, 60, 200)
		crazyBtn.Text = "Spin Doido FE"
		crazyBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 30)
		ragdollBtn.Text = "Ragdoll FE (Fix)"
		ragdollBtn.BackgroundColor3 = Color3.fromRGB(180, 140, 20)
		
		if rootPart then
			rootPart.AssemblyAngularVelocity = Vector3.zero
		end
	end)
end

-- ABA HEAD: CADEIRA INVISIVEL (SEM COPIAR A ANIMACAO DO ALVO)
local isSittingOnHead = false
local headMode = "Head"
local headTarget = nil
local invisibleSeat = nil
local seatWeld = nil
local originalPartState = {}

local nameInput = Instance.new("TextBox")
nameInput.Size = UDim2.new(0.9, 0, 0.07, 0)
nameInput.Position = UDim2.new(0.05, 0, 0.02, 0)
nameInput.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
nameInput.BackgroundTransparency = 0.2
nameInput.PlaceholderText = "Nick ou inicio do Nick..."
nameInput.Text = ""
nameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
nameInput.PlaceholderColor3 = Color3.fromRGB(140, 140, 150)
nameInput.TextScaled = true
nameInput.Font = Enum.Font.SourceSans
nameInput.Parent = pageHead

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent = nameInput

local sitHeadBtn = createButton(pageHead, "Sentar na Cabeca", UDim2.new(0.05, 0, 0.10, 0), nil, Color3.fromRGB(50, 120, 220))
local sitBackBtn = createButton(pageHead, "Sentar Costa com Costa", UDim2.new(0.05, 0, 0.19, 0), nil, Color3.fromRGB(220, 120, 0))
local stopSitBtn = createButton(pageHead, "Soltar / Sair", UDim2.new(0.05, 0, 0.28, 0), nil, Color3.fromRGB(200, 50, 50))

createSlider(pageHead, "Altura na Cabeca", UDim2.new(0.05, 0, 0.38, 0), 0.5, 5.0, headOffsetHeight, function(val)
	headOffsetHeight = val
end)

createSlider(pageHead, "Distancia Costas", UDim2.new(0.05, 0, 0.52, 0), 0.5, 3.0, backDistOffset, function(val)
	backDistOffset = val
end)

local saveSlidersBtn = createButton(pageHead, "💾 Salvar Config dos Sliders", UDim2.new(0.05, 0, 0.68, 0), nil, Color3.fromRGB(40, 180, 80))

saveSlidersBtn.MouseButton1Click:Connect(function()
	savedSettings.headHeight = headOffsetHeight
	savedSettings.backDistance = backDistOffset
	
	saveSlidersBtn.Text = "✅ Configurações Salvas!"
	saveSlidersBtn.BackgroundColor3 = Color3.fromRGB(30, 200, 100)
	task.wait(1.5)
	saveSlidersBtn.Text = "💾 Salvar Config dos Sliders"
	saveSlidersBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
end)

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
	if seatWeld then
		seatWeld:Destroy()
		seatWeld = nil
	end
	if invisibleSeat then
		invisibleSeat:Destroy()
		invisibleSeat = nil
	end
end

local function getFlatTargetCFrame()
	if not headTarget or not headTarget.Parent then return nil end
	local targetRoot = headTarget.Parent:FindFirstChild("HumanoidRootPart")
	if not targetRoot then return nil end

	local look = targetRoot.CFrame.LookVector
	local flatLook = Vector3.new(look.X, 0, look.Z)
	if flatLook.Magnitude < 0.001 then
		flatLook = Vector3.new(0, 0, -1)
	else
		flatLook = flatLook.Unit
	end

	local position
	if headMode == "Head" then
		position = Vector3.new(targetRoot.Position.X, headTarget.Position.Y + headOffsetHeight, targetRoot.Position.Z)
	else
		position = targetRoot.Position - (flatLook * backDistOffset) + Vector3.new(0, headOffsetHeight - 1.5, 0)
		flatLook = -flatLook
	end

	return CFrame.lookAt(position, position + flatLook)
end

local function createInvisibleSeat()
	destroySeat()
	local seatCFrame = getFlatTargetCFrame()
	if not seatCFrame or not humanoid or not rootPart then return false end

	invisibleSeat = Instance.new("Seat")
	invisibleSeat.Name = "InvisibleHeadSeat"
	invisibleSeat.Size = Vector3.new(2, 0.5, 2)
	invisibleSeat.Transparency = 1
	invisibleSeat.CanCollide = false
	invisibleSeat.CanTouch = false
	invisibleSeat.CanQuery = false
	invisibleSeat.Anchored = true
	invisibleSeat.CFrame = seatCFrame
	invisibleSeat.Parent = Workspace

	rootPart.CFrame = seatCFrame * CFrame.new(0, 1.5, 0)
	invisibleSeat:Sit(humanoid)
	task.wait()
	seatWeld = invisibleSeat:FindFirstChild("SeatWeld")
	return seatWeld ~= nil
end

local function enableSittingState()
	originalPartState = {}
	if character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				originalPartState[part] = {CanCollide = part.CanCollide, Massless = part.Massless}
				part.CanCollide = false
				part.Massless = true
			end
		end
	end
	if humanoid then
		humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
	end
end

local function disableSittingState()
	destroySeat()
	if humanoid then
		humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
		humanoid.Sit = false
		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
	end
	for part, state in pairs(originalPartState) do
		if part and part.Parent then
			part.CanCollide = state.CanCollide
			part.Massless = state.Massless
		end
	end
	originalPartState = {}
end

local function startInvisibleSeat(target, mode)
	disableSittingState()
	headTarget = mode == "Head" and target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
	headMode = mode
	if not headTarget then return false end
	enableSittingState()
	isSittingOnHead = createInvisibleSeat()
	if not isSittingOnHead then
		disableSittingState()
		headTarget = nil
	end
	return isSittingOnHead
end

sitHeadBtn.MouseButton1Click:Connect(function()
	local target = getPlayerByPartialName(nameInput.Text)
	if not target or not target.Character or not startInvisibleSeat(target, "Head") then
		sitHeadBtn.Text = "Jogador Nao Encontrado!"
		task.wait(1.5)
		sitHeadBtn.Text = "Sentar na Cabeca"
	end
end)

sitBackBtn.MouseButton1Click:Connect(function()
	local target = getPlayerByPartialName(nameInput.Text)
	if not target or not target.Character or not startInvisibleSeat(target, "Back") then
		sitBackBtn.Text = "Jogador Nao Encontrado!"
		task.wait(1.5)
		sitBackBtn.Text = "Sentar Costa com Costa"
	end
end)

stopSitBtn.MouseButton1Click:Connect(function()
	isSittingOnHead = false
	headTarget = nil
	disableSittingState()
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

-- LIMPEZA AO MORRER
local function setupDeathCleanup(char)
	local hum = char:WaitForChild("Humanoid", 5)
	if hum then
		hum.Died:Connect(function()
			removeCage()
			isSittingOnHead = false
			disableSittingState()
		end)
	end
end

if character then setupDeathCleanup(character) end

player.CharacterAdded:Connect(function(newChar)
	character = newChar
	rootPart = character:WaitForChild("HumanoidRootPart")
	humanoid = character:WaitForChild("Humanoid")
	removeCage()
	isSittingOnHead = false
	disableSittingState()
	setupDeathCleanup(newChar)
end)

-- LOOP PRINCIPAL FIXADO EM PRE-RENDER
local hue = 0
RunService.RenderStepped:Connect(function()
	if isSittingOnHead and headTarget and headTarget.Parent and invisibleSeat then
		local seatCFrame = getFlatTargetCFrame()
		if seatCFrame then
			invisibleSeat.CFrame = seatCFrame
		else
			isSittingOnHead = false
			headTarget = nil
			disableSittingState()
		end
	end

	if activeCage then
		hue = (hue + 0.005) % 1
		local rgbColor = Color3.fromHSV(hue, 0.9, 1)
		for _, part in ipairs(activeCage:GetChildren()) do
			if part:IsA("BasePart") then part.Color = rgbColor end
		end
	end
end)

-- LOOP DE FÍSICA E FLING
local lastFlingTime = 0
local lastManualTime = 0

RunService.Heartbeat:Connect(function()
	local now = tick()
	
	if isFlinging and not isReversingFling and rootPart then
		if now - lastFlingTime >= 0.016 then
			lastFlingTime = now
			table.insert(flingHistory, rootPart.CFrame)
			if #flingHistory > 2000 then table.remove(flingHistory, 1) end
		end
		rootPart.AssemblyAngularVelocity = Vector3.new(
			math.random(-flingPower, flingPower),
			math.random(-flingPower, flingPower),
			math.random(-flingPower, flingPower)
		)
		rootPart.AssemblyLinearVelocity = Vector3.new(
			math.random(-flingPower/2, flingPower/2),
			math.random(50, flingPower/2),
			math.random(-flingPower/2, flingPower/2)
		)
	end
	
	if isRecordingManual and not isReversingManual and rootPart then
		if now - lastManualTime >= 0.016 then
			lastManualTime = now
			table.insert(manualHistory, rootPart.CFrame)
			if #manualHistory > 3000 then table.remove(manualHistory, 1) end
		end
	end
	
	if isR6 then
		if isHelicopter and rootPart then
			rootPart.AssemblyAngularVelocity = Vector3.new(0, spinSpeed, 0)
		end
		
		if isCrazyAnim and rootPart then
			rootPart.AssemblyAngularVelocity = Vector3.new(
				math.random(-spinSpeed*2, spinSpeed*2),
				math.random(-spinSpeed*2, spinSpeed*2),
				math.random(-spinSpeed*2, spinSpeed*2)
			)
		end
	end
end)