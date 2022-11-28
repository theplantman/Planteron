local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = Orion:MakeWindow({
    ["ConfigFolder"] = "Planteron",
    ["HidePremium"] = false,
    ["IntroEnabled"] = true,
    ["IntroText"] = "Planteron Loaded",
    ["Name"] = "Planteron"
})
local Main = Window:MakeTab({
	["Icon"] = "rbxassetid://4483345998",
	["Name"] = "Main",
    ["PremiumOnly"] = false
})
Main:AddSection({
	["Name"] = "Morphs"
})
local Morph = "Blue"
Main:AddDropdown({
	["Callback"] = function(Value)
        Morph = Value
    end,
    ["Default"] = Morph,
    ["Name"] = "Morphs",
    ["Options"] = {
        "Blue",
        "Boiling Hot",
        "Freezing Cold",
        "Ghost Blue",
        "Ghost Green",
        "Gooey",
        "Green",
        "Jack-O-Blue",
        "Jack-O-Green",
        "LabcoatGuy",
        "Orange",
        "PibbyBlue",
        "Purple",
        "PurpleVent",
        "Spooky Blue",
        "Spooky Green",
        "True Gold",
        "True Rainbow",
        "Withered Friend",
        "Yellow"
    }
})
Main:AddButton({
	["Callback"] = function()
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local SpecialMorphs = {
                ["Boiling Hot"] = CFrame.new(43.1899605, 41.0326233, 32.342308, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                ["Freezing Cold"] = CFrame.new(43.1557617, 41.0326233, 18.9937057, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                ["Ghost Blue"] = CFrame.new(103.032646, 41.1149902, 2.87130642, -0.00256192684, 0, -0.999996722, 0, 1, 0, 0.999996722, 0, -0.00256192684),
                ["Ghost Green"] = CFrame.new(97.4854965, 41.3083649, -52.6151962, 0.0185906291, -0, -0.999827325, 0, 1, -0, 0.999827325, 0, 0.0185906291),
                ["Jack-O-Blue"] = CFrame.new(106.265503, 41.2452545, -30.7273808, 0.999996662, -0, -0.00258965837, 0, 1, -0, 0.00258965837, 0, 0.999996662),
                ["Jack-O-Green"] = CFrame.new(105.93647, 41.2719727, -21.5505676, -0.9998281, 0, -0.018558437, 0, 1, 0, 0.018558437, 0, -0.9998281),
                ["Spooky Blue"] = CFrame.new(63.7830086, 41.1149902, 2.87130642, -0.00256192684, 0, -0.999996722, 0, 1, 0, 0.999996722, 0, -0.00256192684),
                ["Spooky Green"] = CFrame.new(83.7328491, 41.3083649, 2.47840977, -0.0185909271, 0, 0.999827325, 0, 1, 0, -0.999827325, 0, -0.0185909271),
                ["True Gold"] = CFrame.new(43.2247276, 41.0326233, 45.9128227, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                ["True Rainbow"] = CFrame.new(43.2176132, 41.0326233, 73.2835541, 1, 0, 0, 0, 1, 0, 0, 0, 1),
                ["Withered Friend"] = CFrame.new(45.0982246, 41.1280327, -60.2397881, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            }
            local function Check()
                for Index, CFrame in pairs(SpecialMorphs) do
                    if Index == Morph then
                        return true
                    end
                end
                return false
            end
            local function MorphInto(Model)
                local OldMorphCFrame = Model.Part.CFrame
                Model.Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait()
                Model.Part.CFrame = OldMorphCFrame
            end
            if not Check() then
                for Index, Model in pairs(game.Workspace:GetChildren()) do
                    if Model.ClassName == "Model" and Model:FindFirstChild("QuackPad") and Model:FindFirstChild(Morph) or Model.ClassName == "Model" and Model:FindFirstChild("QuackPad") and Model.QuackPad:FindFirstChild(Morph) then
                        MorphInto(Model)
                    end
                end
            elseif Check() then
                for Index, Model in pairs(game.Workspace:GetChildren()) do
                    if Model.ClassName == "Model" and Model:FindFirstChild("QuackPad") and Model.Part.CFrame == SpecialMorphs[Morph] then
                        MorphInto(Model)
                    end
                end
            end
        end
  	end,
    ["Name"] = "Morph"
})
Orion:Init()
