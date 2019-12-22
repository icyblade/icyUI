local _, Engine = ...

local HeaderProcessors = Engine.Modules.Antispam.HeaderProcessors

local function SenderProcessor(payload)
    for _, i in pairs(IcyUIDB.SenderBlacklist) do
        if (payload.PlayerName == i) then
            payload.Label = 'SPAM'
            return
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
