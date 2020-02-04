local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors
local AddToSenderBlacklist = Engine.Modules.Antispam.HeaderProcessors.AddToSenderBlacklist

local Patterns = {
    -- General
    '航班', '航空', '飞机', '直达', '机票', '飞碟', '灰机',
    '头等舱', '单程票', '专机', '空运', '高铁', '直通车', '直飞', '滴滴', '直接拉',
    -- Symbols
    '●', '★', '▉▉', '◆', '△', '■■', '✚', '◤',
}
local FlightLocations = {
    '血色', '厄运', '加基森', '冬泉谷', 
    '玛拉顿', 'MLD', '紫门',
    '斯坦索姆', 'STSM', 
    '艾萨拉', '取水', '灭火'
}

local function FlightProcessor(payload)
    local text = payload.Text
    local playerName = payload.PlayerName
    for _, i in pairs(Patterns) do
        if (string.match(text, i) ~= nil) then
            AddToSenderBlacklist(playerName)
            payload.Label = 'SPAM'
            return
        end
    end

    local hitCount = 0
    for _, i in pairs(FlightLocations) do
        if (string.match(playerName, i) ~= nil) then
            AddToSenderBlacklist(playerName)
            payload.Label = 'SPAM'
            return
        end
        if (string.match(text, i) ~= nil) then
            if (string.match(text, i..'%d') ~= nil) then
                AddToSenderBlacklist(playerName)
                payload.Label = 'SPAM'
                return
            end

            hitCount = hitCount + 1
            if (hitCount >= 3) then
                AddToSenderBlacklist(playerName)
                payload.Label = 'SPAM'
                return
            end
        end
    end
end
ContentProcessors.FlightProcessor = FlightProcessor
