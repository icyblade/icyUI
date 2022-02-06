local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors

local Patterns = {
    -- Leveling
    '1-70',
    '双法迷宫'
}

local function RMTProcessor(payload)
    ContentProcessors.BlacklistProcessor(payload, Patterns)
end
ContentProcessors.RMTProcessor = RMTProcessor
