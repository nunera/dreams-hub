local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Dreams Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "DreamsHub",IntroText = "Dreams Hub Loading..."})
local plrs = game:GetService("Players")
local localplr = plrs.LocalPlayer



local function highlight(v)
	if v == localplr then
	else
		local team = v.Team
		if team == nil then
			highlight = Instance.new("Highlight")
			highlight.Parent = v.Character
			highlight.OutlineColor = _G.outlinecolor
			highlight.OutlineTransparency = _G.outlineopacity
			highlight.FillColor = _G.fillcolor
			highlight.FillTransparency = _G.outlineopacity
		else
			lochighlight = Instance.new("Highlight")
			teamcolor = team.TeamColor
			color3team = teamcolor.Color
			highlight.Parent = v.Character
			highlight.OutlineColor = color3team
			highlight.OutlineTransparency = 0.3
			highlight.FillColor = color3team
			highlight.FillTransparency = 0.5
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
			if #teams == 0 then
				OrionLib:MakeNotification({
					Name = "No Teams!",
					Content = "Detected no teams, can't do team colors.",
					Image = "rbxassetid://10253109726",
					Time = 5
				})
			end
			for i,v in pairs(game.Players:GetChildren()) do
			   highlight(v)
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
		_G.fillcolor = Value
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
		_G.fillopacity = Value
	end    
})
Tab:AddColorpicker({
	Name = "Outline Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		_G.outlinecolor = Value
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
		_G.outlineopacity = Value
	end    
})
local teamcolor = Tab:AddToggle({
	Name = "Team Color",
	Default = false,
	Callback = function(Value)
		_G.teamcolor = Value
		local teams = game.Teams:GetChildren()
		if _G.teamcolor then
		if #teams == 0 then
		    _G.teamcolor = false
			OrionLib:MakeNotification({
				Name = "No Teams!",
				Content = "Detected no teams, can't do team colors.",
				Image = "rbxassetid://10253109726",
				Time = 5
			})
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
