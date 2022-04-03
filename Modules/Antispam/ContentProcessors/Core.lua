local _, Engine = ...

Engine.Modules.Antispam.ContentProcessors = {}

local function RuleProcessor(payload, rule)
    local text = payload.Hash
    local score = 0
    for pattern, weight in pairs(rule) do
        if (string.match(text, pattern) ~= nil) then
            score = score + weight
            if score >= 30 then
                payload.IsSpam = 1
                return
            end
        end
    end
    if score >= 30 then
        payload.IsSpam = 1
        return
    end
end
Engine.Modules.Antispam.ContentProcessors.RuleProcessor = RuleProcessor
