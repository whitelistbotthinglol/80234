local holder = game.Players.LocalPlayer:FindFirstChild("1ZtP5pjW")
if holder then holder:Destroy() end
local globalholder = game:GetService("CoreGui"):FindFirstChild("1ZtP5pjW")
if globalholder then globalholder:Destroy() end
--[[
if holder then
    if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
        holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
    end
end
--]]
