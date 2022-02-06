local _, Engine = ...

local HeaderProcessors = Engine.Modules.Antispam.HeaderProcessors

local function SenderProcessor(payload)
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
                payload.IsSpam = 1
                return
            end
        end
    end
end
HeaderProcessors.SenderProcessor = SenderProcessor
