local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Dreams Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "DreamsHub",IntroText = "Dreams Hub Loading..."})
local plrs = game:GetService("Players")
local localplr = plrs.LocalPlayer
local highlights = {}


local function getPlayerFromCharacter(character)
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		if player.Character == character then
			return player
		end
	end
end



local function highlight(v)
	local localplrteam = localplr.Team
	if v == localplr then
	else
		local team = v.Team
		if team == nil then
			local highlight = Instance.new("Highlight")
			table.insert(highlights,highlight)
			highlight.Parent = v.Character
			highlight.Enabled = _G.on
			highlight.OutlineColor = _G.outlinecolor
			highlight.OutlineTransparency = _G.outlineopacity
			highlight.FillColor = _G.fillcolor
			highlight.FillTransparency = _G.outlineopacity
			v.CharacterAdded:Connect(function()
				local highlight = Instance.new("Highlight")
				table.insert(highlights,highlight)
				highlight.Parent = v.Character
				highlight.Enabled = _G.on
				highlight.OutlineColor = _G.outlinecolor
				highlight.OutlineTransparency = _G.outlineopacity
				highlight.FillColor = _G.fillcolor
				highlight.FillTransparency = _G.outlineopacity
				for i,v in pairs(highlights) do
					v.OutlineColor = _G.outlinecolor
					v.OutlineTransparency = _G.outlineopacity
					v.FillColor = _G.fillcolor
					v.FillTransparency = _G.fillopacity
				end
			end)
		else
			if _G.teamcolor then
				local highlight = Instance.new("Highlight")
				table.insert(highlights,highlight)
				highlight.Parent = v.Character
				highlight.Enabled = _G.on
				highlight.OutlineColor = team.TeamColor.Color
				highlight.OutlineTransparency = _G.outlineopacity
				highlight.FillColor = team.TeamColor.Color
				highlight.FillTransparency = _G.outlineopacity
				v.CharacterAdded:Connect(function()
					local highlight = Instance.new("Highlight")
					table.insert(highlights,highlight)
					highlight.Parent = v.Character
					highlight.Enabled = _G.on
					highlight.OutlineColor = team.TeamColor.Color
					highlight.OutlineTransparency = _G.outlineopacity
					highlight.FillColor = team.TeamColor.Color
					highlight.FillTransparency = _G.outlineopacity
				end)
			else
				local highlight = Instance.new("Highlight")
				table.insert(highlights,highlight)
				highlight.Parent = v.Character
				highlight.Enabled = _G.on
				highlight.OutlineColor = _G.outlinecolor
				highlight.OutlineTransparency = _G.outlineopacity
				highlight.FillColor = _G.fillcolor
				highlight.FillTransparency = _G.outlineopacity
				v.CharacterAdded:Connect(function()
					local highlight = Instance.new("Highlight")
					table.insert(highlights,highlight)
					highlight.Parent = v.Character
					highlight.Enabled = _G.on
					highlight.OutlineColor = _G.outlinecolor
					highlight.OutlineTransparency = _G.outlineopacity
					highlight.FillColor = _G.fillcolor
					highlight.FillTransparency = _G.outlineopacity
					for i,v in pairs(highlights) do
						v.OutlineColor = _G.outlinecolor
						v.OutlineTransparency = _G.outlineopacity
						v.FillColor = _G.fillcolor
						v.FillTransparency = _G.fillopacity
					end
				end)
			end
		end
	end
end

local Tab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "General"
})

local esp = Tab:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
		_G.on = Value
		local teams = game.Teams:GetChildren()
		if _G.on then
			for i,v in pairs(highlights) do
				v.Enabled = true
			end
			if #teams == 0 then
				OrionLib:MakeNotification({
					Name = "No Teams!",
					Content = "Detected no teams, can't do team colors.",
					Image = "rbxassetid://10253109726",
					Time = 5
				})
			end
		else
			for i,v in pairs(highlights) do
				v.Enabled = false
			end
		end
	end    
})

local teamcheck = Tab:AddToggle({
	Name = "Team Check",
	Default = false,
	Callback = function(Value)
		_G.teamcheck = Value
	end    
})
local Section = Tab:AddSection({
	Name = "Color"
})
Tab:AddColorpicker({
	Name = "Fill Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		if _G.teamcolor then
		else
			_G.fillcolor = Value
			for i,v in pairs(highlights) do
				v.FillColor = _G.fillcolor
			end
		end
	end	  
})
Tab:AddSlider({
	Name = "Fill Opacity",
	Min = 0,
	Max = 100,
	Default = 80,
	Color = Color3.fromRGB(75,75,75),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.fillopacity = Value/100
		for i,v in pairs(highlights) do
			v.FillTransparency = _G.fillopacity
		end
	end    
})
Tab:AddColorpicker({
	Name = "Outline Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		if _G.teamcolor then
		else
			_G.outlinecolor = Value
			for i,v in pairs(highlights) do
				v.OutlineColor = _G.outlinecolor
			end
		end
	end	  
})
Tab:AddSlider({
	Name = "Outline Opacity",
	Min = 0,
	Max = 100,
	Default = 80,
	Color = Color3.fromRGB(75,75,75),
	Increment = 1,
	ValueName = "%",
	Callback = function(Value)
		_G.outlineopacity = Value/100
		for i,v in pairs(highlights) do
			v.OutlineTransparency = _G.outlineopacity
		end
	end    
})
local teamcolor = Tab:AddToggle({
	Name = "Team Color",
	Default = false,
	Callback = function(Value)
		print("toggled")
		_G.teamcolor = Value
		local teams = game.Teams:GetChildren()
		if _G.teamcolor then
			print("its on")
			if #teams == 0 then
				_G.teamcolor = false
				OrionLib:MakeNotification({
					Name = "No Teams!",
					Content = "Detected no teams, can't do team colors.",
					Image = "rbxassetid://10253109726",
					Time = 5
				})
			else
				print("theres teams")
				print(highlights)
				for i,v in pairs(highlights) do
					print("highlight changed")
					local plr = getPlayerFromCharacter(v.Parent)
					local teamcolor = plr.Team.TeamColor.Color
					v.FillColor = teamcolor
					v.OutlineColor = teamcolor
					print(v.Name,"Changed to",teamcolor)
				end
			end
		end
	end    
})


local keybinds = Window:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://10252950743",
	PremiumOnly = false
})

keybinds:AddBind({
	Name = "ESP",
	Default = "Y",
	Hold = false,
	Callback = function()
		if _G.on then
			esp:Set(false)
			_G.on = false
		else
			esp:Set(true)
			_G.on = true
		end
	end 
})
keybinds:AddBind({
	Name = "Team Check",
	Default = "U",
	Hold = false,
	Callback = function()
		if _G.teamcheck then
			teamcheck:Set(false)
			_G.teamcheck = false
		else
			teamcheck:Set(true)
			_G.teamcheck = true
		end
	end    
})
keybinds:AddBind({
	Name = "Team Color",
	Default = "T",
	Hold = false,
	Callback = function()
		if _G.teamcolor then
			teamcolor:Set(false)
			_G.teamcolor = false
		else
			teamcolor:Set(true)
			_G.teamcolor = true
		end
	end    
})






for i,v in pairs(game.Players:GetChildren()) do
	highlight(v)
end

plrs.PlayerAdded:Connect(function(plr)
	highlight(plr)
end)
