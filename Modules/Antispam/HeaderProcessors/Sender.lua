local _, Engine = ...

local HeaderProcessors = Engine.Modules.Antispam.HeaderProcessors

local function SenderProcessor(payload)
    for _, i in pairs(IcyUIDB.SenderBlacklist) do
        if (payload.PlayerName == i) then
            payload.Label = 'SPAM'
            return
        end
    end

    -- Global Ignore
    local name = payload.PlayerName
    if (string.find(payload.PlayerName, '-', 1, true) ~= nil) then
        name = string.sub(payload.PlayerName, 1, string.find(payload.PlayerName, '-', 1, true) - 1)
    end
    if (GlobalIgnoreDB ~= nil) then
        for index, fullName in pairs(GlobalIgnoreDB.ignoreList) do
            local blacklistName = string.sub(fullName, 1, string.find(fullName, '-', 1, true) - 1)
            if (
                GlobalIgnoreDB.typeList[index] == 'player' and 
                GlobalIgnoreDB.factionList[index] == 'Alliance' and 
                name == blacklistName
            ) then
                payload.Label = 'SPAM'
                return
            end
        end
    end
end
HeaderProcessors.SenderProcessor = SenderProcessor

local function AddToSenderBlacklist(playerName)
    for _, i in pairs(IcyUIDB.SenderBlacklist) do
        if (playerName == i) then
            return
        end
    end
    table.insert(IcyUIDB.SenderBlacklist, playerName)
end
HeaderProcessors.AddToSenderBlacklist = AddToSenderBlacklist
