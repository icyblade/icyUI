local _, Engine = ...

SLASH_ICYUI1 = '/icyui'

SlashCmdList['ICYUI'] = function(msg)
    if (msg == 'ahscan') then
        Engine.Modules.Economy.StartFullAHScan()
    elseif (msg == 'ahdump') then
        Engine.Modules.Economy.StartFullAHDump()
    else
        DEFAULT_CHAT_FRAME:AddMessage('Unknown command: '..msg)
    end
end
