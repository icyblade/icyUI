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
    local text = payload.Text

    -- ABCABCAB -> ABC
    for i = 1, text:len() do
        local targetText = text:sub(1, i)
        local p = floor(text:len() / i)
        local q = text:len() - p * i

        local validationText = ''
        for j = 1, p do
            validationText = validationText..targetText
        end
        validationText = validationText..targetText:sub(1, q)

        if (text == validationText) then
            text = targetText
            break
        end
    end

    -- Replace replication symbols
    for _, i in pairs(replicationSymbols) do
        text = string.gsub(text, i .. i .. i .. '+', i .. i)
    end

    payload.Text = text
end
PostProcessors.DedupPostProcessor = DedupPostProcessor

local function ThrottleProcessor(payload)
    if (IcyUIDB.Insights[payload.Hash] ~= nil and
        1 <= time() - IcyUIDB.Insights[payload.Hash] and
        time() - IcyUIDB.Insights[payload.Hash] <= 60) then
        payload.IsSpam = 1
    end
end
PostProcessors.ThrottleProcessor = ThrottleProcessor