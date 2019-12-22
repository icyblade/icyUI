local _, Engine = ...

local function BlacklistProcessor(payload, blacklist)
    local text = payload.Text
    for _, i in pairs(blacklist) do
        if (string.match(text, i) ~= nil) then
            payload.Label = 'SPAM'
            return
        end
    end
end
Engine.Modules.Antispam.ContentProcessors.BlacklistProcessor = BlacklistProcessor