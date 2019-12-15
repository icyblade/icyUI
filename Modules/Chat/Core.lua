local _, Engine = ...

Engine.Modules.Chat = {}

local function GetPlayerLevelByName(playerName)
    C_FriendList.AddFriend(playerName)
    C_FriendList.ShowFriends()

    local friendInfo =
        C_Timer.After(
        0.1,
        function()
            friendInfo = C_FriendList.GetFriendInfo(playerName)
            C_FriendList.AddOrRemoveFriend(playerName, '')
            return friendInfo
        end
    )

    if (friendInfo ~= nil) then
        return friendInfo.level
    else
        return nil
    end
end
Engine.Modules.Chat.GetPlayerLevelByName = GetPlayerLevelByName
