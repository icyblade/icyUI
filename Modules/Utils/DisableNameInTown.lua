local _, Engine = ...

local WORLD_MAP_FRAME = _G['WorldMapFrame']

local TOWN_MASK = {
    [1453] = true, -- Stormwind
    [1454] = true, -- Orgrimmar
    [1455] = true, -- Ironforge
    [1456] = true, -- Thunder Bluff
    [1457] = true, -- Darnassus
    [1458] = true -- Undercity
}

local TARGET_EVENTS = {'ZONE_CHANGED', 'ZONE_CHANGED_INDOORS', 'PLAYER_ENTERING_WORLD'}

local function DisableNameInTownCallback()
    local mapID = WORLD_MAP_FRAME:GetMapID()
    if (TOWN_MASK[mapID]) then
        SetCVar('UnitNameFriendlyPlayerName', 0)
        SetCVar('UnitNameFriendlyPetName', 0)
    else
        SetCVar('UnitNameFriendlyPlayerName', 1)
        SetCVar('UnitNameFriendlyPetName', 1)
    end
    return true
end

for k, v in pairs(TARGET_EVENTS) do
    Engine.AceEvent:RegisterEvent(v, DisableNameInTownCallback)
end
