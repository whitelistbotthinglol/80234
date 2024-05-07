local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'dahood sploit v69',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Main')
LeftGroupBox:AddToggle('MyToggle', {
    Text = 'toggle esp',
    Default = false, -- Default value (true / false)
    Tooltip = 'meh', -- Information shown when you hover over the toggle
})

local MyButton = LeftGroupBox:AddButton({
    Text = 'silent aim',
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/whitelistbotthinglol/3DfuTbH/main/dahoodsploit72349main.lua"))()
    end,
    DoubleClick = false,
    Tooltip = 'dahood silent aim'
})

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    --getgenv().enabled = true

    loadstring(game:HttpGet("https://raw.githubusercontent.com/whitelistbotthinglol/3DfuTbH/main/dahood8902350uninject.lua"))()

    --print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('dahoodsploit')
SaveManager:SetFolder('dahoodsploit/dahood')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
--SaveManager:LoadAutoloadConfig()

local function espload()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/whitelistbotthinglol/3DfuTbH/main/dhsploit38759esp.lua"))() 
end

getgenv().enabled = true
Toggles.MyToggle:OnChanged(function()
    getgenv().enabled = not getgenv().enabled
    --loadstring(game:HttpGet("https://raw.githubusercontent.com/whitelistbotthinglol/3DfuTbH/main/dhsploit38759esp.lua"))()
    local success, result = pcall(espload)
end)
