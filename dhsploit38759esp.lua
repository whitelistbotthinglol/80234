getgenv().filluseteamcolor = true --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = true --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 1 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency
local holder = game.CoreGui:FindFirstChild("1ZtP5pjW") or Instance.new("Folder")
if enabled == false then
    holder:Destroy()
end

if holder.Name == "Folder" then
    holder.Name = "1ZtP5pjW"
    holder.Parent = game.CoreGui
end

if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end

if getgenv().enabled == true then 
    getgenv().enabled = false
    getgenv().enabled = true
end
while getgenv().enabled do
    task.wait()
    for _,v in pairs(game.Players:GetChildren()) do
        local chr = v.Character
        if chr ~= nil then
        local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
        esp.Name = v.Name
        if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
            else
        esp.Parent = holder
        if filluseteamcolor then
            esp.FillColor = v.TeamColor.Color
        else
            esp.FillColor = fillcolor 
        end
        if outlineuseteamcolor then
            esp.OutlineColor = v.TeamColor.Color
        else
            esp.OutlineColor = outlinecolor    
        end
        esp.FillTransparency = filltrans
        esp.OutlineTransparency = outlinetrans
        esp.Adornee = chr
        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        end
    end
end
