local _, Engine = ...

local DELAY = 0.3
local TEMP_EPOCH = 0

-- Code from unknown user
Engine.Modules.Utils.FastLoot =
    Engine.AceEvent:RegisterEvent(
    'LOOT_READY',
    function()
        local isAlone = (GetNumGroupMembers() == 0)
        if GetCVarBool('autoLootDefault') ~= IsModifiedClick('AUTOLOOTTOGGLE') then
            if (GetTime() - TEMP_EPOCH) >= DELAY then
                for i = GetNumLootItems(), 1, -1 do
                    LootSlot(i)
                    if isAlone then
                        ConfirmLootSlot(i)
                    end
                end

                TEMP_EPOCH = GetTime()
            end
        end
    end
)
