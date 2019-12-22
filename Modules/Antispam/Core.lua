local _, Engine = ...

local PreProcessors = Engine.Modules.Antispam.PreProcessors
local HeaderProcessors = Engine.Modules.Antispam.HeaderProcessors
local ContentProcessors = Engine.Modules.Antispam.ContentProcessors
local PostProcessors = Engine.Modules.Antispam.PostProcessors
local Insights = Engine.Modules.Antispam.Insights
local Utils = Engine.Modules.Antispam.Utils

local function MessageCallback(self, event, text, playerName, ...)
    local payload = {
        Event = event,
        OriginalText = text,
        PlayerName = playerName,
        Text = text,
        HitPatterns = {},
        Label = 'GOOD'
    }

    PreProcessors.DeconfusionPreProcessor(payload)
    HeaderProcessors.SenderProcessor(payload)
    ContentProcessors.RMTProcessor(payload)
    ContentProcessors.FlightProcessor(payload)
    ContentProcessors.TradeProcessor(payload)
    ContentProcessors.GuildRecruitProcessor(payload)
    PostProcessors.DedupPostProcessor(payload)

    if (payload.Label == 'SPAM') then
        return true
    else
        Insights.AddRecord(payload)
        return false, payload.PostText, playerName, ...
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
