local _, Engine = ...

Engine.Modules.Utils.AutoJoinBigFoot =
    Engine.AceEvent:RegisterEvent(
    'CHAT_MSG_CHANNEL',
    function(...)
        for i = 1, 10 do
            local chatFrame = _G['ChatFrame' .. tostring(i)]
            local id = chatFrame:GetID()
            if (chatFrame.name == '频道') then
                JoinChannelByName('大脚世界频道', nil, id)
                JoinChannelByName('大脚世界频道2', nil, id)
                JoinChannelByName('大脚世界频道3', nil, id)
                JoinChannelByName('大脚世界频道4', nil, id)
                JoinChannelByName('大脚世界频道5', nil, id)
            end
        end
    end
)
