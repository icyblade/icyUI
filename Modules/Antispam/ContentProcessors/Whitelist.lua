local _, Engine = ...

local function WhitelistProcessor(payload, whitelist)
    local text = payload.Text
    for _, i in pairs(whitelist) do
        if (string.match(text, i) ~= nil) then
            return
        end
    end
    payload.Label = 'SPAM'
end
Engine.Modules.Antispam.ContentProcessors.WhitelistProcessor = WhitelistProcessor
