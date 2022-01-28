local _, Engine = ...

Engine.Modules.Utils = {}

Engine.Modules.Utils.Core =
    Engine.AceEvent:RegisterEvent(
    'LOADING_SCREEN_DISABLED',
    function(...)
        ConsoleExec('ffxGlow', 0)
        ConsoleExec('weatherDensity', 1)
        ConsoleExec('cameraDistanceMaxZoomFactor', 3.4)
    end
)
