local _, Engine = ...

local Utils = Engine.Modules.Antispam.Utils

local function RemoveAllFilters(event)
    --[[
      Remove all filters of a given event
  
      Parameters
      ----------
      event: str
        E.g. CHAT_MSG_CHANNEL
    ]]
    local current_filters = ChatFrame_GetMessageEventFilters(event)
    if (current_filters ~= nil) then
        for _, filter in pairs(current_filters) do
            ChatFrame_RemoveMessageEventFilter(event, filter)
        end
    end
end
  
Utils.RemoveAllFilters = RemoveAllFilters
