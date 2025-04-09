MYTHICKEYSTONE_ITEMID = 180653

-- Create a frame to handle events
local frame = CreateFrame("Frame")

-- Trigger when the player leaves the world as Saved Variables are not saved until the player logs out
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

if not CurrentKey then
    CurrentKey = {}
end

-- Set the event handler function
frame:SetScript("OnEvent", function(self, event, ...)  
    C_Timer.NewTicker(5, function()
        local keystoneID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
        local key = C_ChallengeMode.GetMapUIInfo(keystoneID)
        local level = C_MythicPlus.GetOwnedKeystoneLevel()
        local _, className, _, _, _, _, _ = GetPlayerInfoByGUID(UnitGUID("player"))        


        if(CurrentKey["Key"] ~= key or CurrentKey["Level"] ~= level) then
            print("New key detected: " .. key .. " Level: " .. level .. " Saving...")

            CurrentKey["Key"] = key
            CurrentKey["Level"] = level
            CurrentKey["Class"] = className
            CurrentKey["Time"] = time()
        end
    end)
end)
