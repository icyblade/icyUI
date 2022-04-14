local _, Engine = ...

Engine.Modules.Utils.ItemLevel =
    Engine.AceEvent:RegisterEvent(
    'PLAYER_ENTERING_WORLD',
    function()
        local callback = GameTooltip:GetScript('OnTooltipSetItem')
        GameTooltip:SetScript('OnTooltipSetItem', function(self, tooltip, ...)
            local _, itemLink = self:GetItem()
            if (itemLink ~= nil) then
                local itemLevel = select(4, GetItemInfo(itemLink))
                if itemLevel then
                    self:AddLine('物品等级: ' .. itemLevel, 255, 255, 255)
                end
            end
            if callback then
                return callback(self, tooltip, ...)
            end
          end)
    end
)
