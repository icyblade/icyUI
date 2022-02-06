local _, Engine = ...

local PreProcessors = Engine.Modules.Antispam.PreProcessors

local confusionSymbols = {
    ' ',
    '!',
    '"',
    '#',
    '$',
    '%%',
    '&',
    "'",
    '%(',
    '%)',
    '%*',
    '%+',
    ',',
    '%-',
    '%.',
    '/',
    ':',
    ';',
    '<',
    '=',
    '>',
    '%?',
    '@',
    '%[',
    '\\',
    '%]',
    '^',
    '_',
    '`',
    -- { and } are WoW special char
    -- '{',
    '|',
    -- '}',
    '~',
    '，',
    '。',
    '《',
    '》',
    '！',
    '？'
}

local function DeconfusionPreProcessor(payload)
    local text = payload.Hash
    -- Convert to upper case due to limitation of case-insensitive regex
    text = string.upper(text)

    -- Remove confusion symbols
    for _, i in pairs(confusionSymbols) do
        text = string.gsub(text, i, '')
    end

    payload.Hash = text
end
PreProcessors.DeconfusionPreProcessor = DeconfusionPreProcessor
