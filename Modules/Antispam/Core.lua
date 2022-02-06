local _, Engine = ...

local PreProcessors = Engine.Modules.Antispam.PreProcessors
local HeaderProcessors = Engine.Modules.Antispam.HeaderProcessors
local ContentProcessors = Engine.Modules.Antispam.ContentProcessors
local PostProcessors = Engine.Modules.Antispam.PostProcessors
local Insights = Engine.Modules.Antispam.Insights
local Utils = Engine.Modules.Antispam.Utils

local function MessageCallback(self, event, text, playerName, ...)
    local payload = {
        PlayerName = playerName,
        Hash = text,
        Text = text,
        IsSpam = 0
    }

    PreProcessors.DeconfusionPreProcessor(payload)
    HeaderProcessors.SenderProcessor(payload)
    ContentProcessors.RMTProcessor(payload)
    ContentProcessors.TradeProcessor(payload)
    PostProcessors.ThrottleProcessor(payload)
    PostProcessors.DedupPostProcessor(payload)

    if (payload.IsSpam == 1) then
        return true
    else
        Insights.AddRecord(payload)
        return false, payload.Text, playerName, ...
    end
end

local frame = CreateFrame('FRAME', 'AntiSpam')
frame:RegisterEvent('PLAYER_ENTERING_WORLD')
frame:SetScript(
    'OnEvent',
    function(self, event, ...)
        Utils.RemoveAllFilters('CHAT_MSG_CHANNEL')
        Utils.RemoveAllFilters('CHAT_MSG_YELL')
        ChatFrame_AddMessageEventFilter('CHAT_MSG_CHANNEL', MessageCallback)
        ChatFrame_AddMessageEventFilter('CHAT_MSG_YELL', MessageCallback)
    end
)
