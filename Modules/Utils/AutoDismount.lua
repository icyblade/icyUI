local _, Engine = ...

-- Code from unknown user
Engine.Modules.Utils.AutoDismount =
    Engine.AceEvent:RegisterEvent(
    'UI_ERROR_MESSAGE',
    function(event, code, msg)
        if
            (msg == ERR_ATTACK_MOUNTED or msg == ERR_MOUNT_ALREADYMOUNTED or msg == ERR_NOT_WHILE_MOUNTED or
                msg == SPELL_FAILED_NOT_MOUNTED or
                msg == ERR_TAXIPLAYERALREADYMOUNTED)
         then
            Dismount()
        end
    end
)
