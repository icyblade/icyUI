local _, Engine = ...

Engine.Modules.Utils.ProfanityFilter =
    Engine.AceEvent:RegisterEvent(
    'LOADING_SCREEN_DISABLED',
    function(...)
        ConsoleExec('portal TW')
	    ConsoleExec('profanityFilter 0')
        ConsoleExec('overrideArchive 0')
    end
)
