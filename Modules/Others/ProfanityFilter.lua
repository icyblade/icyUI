local _, Engine = ...

Engine.Modules.Utils.AutoDismount =
    Engine.AceEvent:RegisterEvent(
    'LOADING_SCREEN_DISABLED',
    function(...)
        ConsoleExec('portal TW')
	    ConsoleExec('profanityFilter 0')
    end
)
