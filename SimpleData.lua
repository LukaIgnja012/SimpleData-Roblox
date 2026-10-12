--[[
    SimpleData Manager v1.0
    Created as an open-source tool for Roblox developers.
    Provides easy, reliable DataStore loading and saving for players.
--]]

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local SimpleData = {}
local playerDataStore = DataStoreService:GetDataStore("SimpleData_Store_v1")

local DEFAULT_DATA = {
    Coins = 100,
    Level = 1,
    XP = 0
}

local sessionData = {}

function SimpleData.LoadData(player)
    local userId = player.UserId
    local key = "Player_" .. userId
    
    local success, savedData = pcall(function()
        return playerDataStore:GetAsync(key)
    end)
    
    if success and savedData then
        sessionData[userId] = savedData
    else
        sessionData[userId] = table.clone(DEFAULT_DATA)
    end
    
    return sessionData[userId]
end

function SimpleData.SaveData(player)
    local userId = player.UserId
    local key = "Player_" .. userId
    
    if sessionData[userId] then
        local success, err = pcall(function()
            playerDataStore:SetAsync(key, sessionData[userId])
        end)
        
        if not success then
            warn("Failed to save data for " .. player.Name .. ": " .. tostring(err))
        end
    end
end

function SimpleData.GetData(player)
    return sessionData[player.UserId]
end

Players.PlayerRemoving:Connect(function(player)
    SimpleData.SaveData(player)
    sessionData[player.UserId] = nil
end)

return SimpleData
