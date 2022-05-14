local _, Engine = ...

local flag = true

Engine.Modules.Utils.ItemLevel =
    Engine.AceEvent:RegisterEvent(
    'PLAYER_ENTERING_WORLD',
    function()
        if flag then
            local callback = GameTooltip:GetScript('OnTooltipSetItem')
            GameTooltip:SetScript('OnTooltipSetItem', function(self, tooltip, ...)
                local _, itemLink = self:GetItem()
                if (itemLink ~= nil) then
                    local itemLevel = select(4, GetItemInfo(itemLink))
                    if itemLevel then
                        self:AddLine('iLvl: ' .. itemLevel, 255, 255, 255)
                    end
                end
                if callback then
                    return callback(self, tooltip, ...)
                end
            end)
            flag = false
        end
    end
)
