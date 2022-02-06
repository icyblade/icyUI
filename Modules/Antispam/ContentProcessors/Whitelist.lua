local _, Engine = ...

local function WhitelistProcessor(payload, whitelist)
    local text = payload.Hash
    for _, i in pairs(whitelist) do
        if (string.match(text, i) ~= nil) then
            return
        end
    end
    payload.IsSpam = 1
end
Engine.Modules.Antispam.ContentProcessors.WhitelistProcessor = WhitelistProcessor
