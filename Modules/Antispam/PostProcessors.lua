local _, Engine = ...

local PostProcessors = Engine.Modules.Antispam.PostProcessors

local replicationSymbols = {
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
    '{',
    '|',
    '}',
    '~',
    'M'
}

local function DedupPostProcessor(payload)
    local text = payload.OriginalText

    -- ABCABC -> ABC
    local combinedText = string.sub(text .. text, 2, 2 * string.len(text) - 1)
    local index = string.find(combinedText, text, 1, true)
    if (index ~= nil) then
        text = string.sub(text, 1, index + 1) -- Fix Chinese characters
    end

    -- Replace replication symbols
    for _, i in pairs(replicationSymbols) do
        text = string.gsub(text, i .. i .. i .. '+', i .. i)
    end

    payload.PostText = text
end
PostProcessors.DedupPostProcessor = DedupPostProcessor

local function ThrottleProcessor(payload)
    if (IcyUIDB.Insights[payload.Text] ~= nil and 
        2 <= time() - IcyUIDB.Insights[payload.Text].LastSeen and 
        time() - IcyUIDB.Insights[payload.Text].LastSeen <= 60) then
        payload.Label = 'SPAM'
    end
end
PostProcessors.ThrottleProcessor = ThrottleProcessor