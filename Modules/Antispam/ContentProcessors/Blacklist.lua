local _, Engine = ...

local function BlacklistProcessor(payload, blacklist)
    local text = payload.Hash
    for _, i in pairs(blacklist) do
        if (string.match(text, i) ~= nil) then
            payload.IsSpam = 1
            return
        end
    end
end
Engine.Modules.Antispam.ContentProcessors.BlacklistProcessor = BlacklistProcessor