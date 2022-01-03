local _, Engine = ...

-- Code from ExRT
local function GetFriendInfo(friend)
    local info = C_FriendList.GetFriendInfoByIndex(friend)
    if info then
        return info.name
    end
end

local function IsFriend(name)
    for i = 1, C_FriendList.GetNumFriends() do
        if (GetFriendInfo(i) == name) then
            return true
        end
    end

    for i = 1, select(2, BNGetNumFriends()) do
        if (select(5, BNGetFriendInfo(i)) == name) then
            return true
        end
    end

    return false
end

local function IsFlight(name)
    if (string.find(name, '一一小白') or string.find(name, '小白航空')) then
        return true
    end
    return false
end

Engine.Modules.Utils.AutoAcceptInvite =
    Engine.AceEvent:RegisterEvent(
    'PARTY_INVITE_REQUEST',
    function(event, name)
        if (name and (IsFriend(name) or IsFlight(name))) then
            AcceptGroup()
            for i = 1, 4 do
                local frame = _G['StaticPopup'..i]
                if (frame:IsVisible() and frame.which == 'PARTY_INVITE') then
                    frame.inviteAccepted = true
                    StaticPopup_Hide('PARTY_INVITE')
                    return
                end
            end
        end
    end
)
