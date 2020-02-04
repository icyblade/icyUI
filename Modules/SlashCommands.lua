local _, Engine = ...

SLASH_ICYUI1 = '/icyui'

SlashCmdList['ICYUI'] = function(msg)
    DEFAULT_CHAT_FRAME:AddMessage('Unknown command: '..msg)
end
