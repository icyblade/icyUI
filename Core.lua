local _, Engine = ...

_G['IcyUI'] = Engine
Engine.LibStub = LibStub
Engine.AceEvent = LibStub('AceEvent-3.0')
Engine.AceLocale = LibStub('AceLocale-3.0')

if (IcyUIDB == nil) then
    IcyUIDB = {}
end
if (IcyUIDB.Insights == nil) then
    IcyUIDB.Insights = {}
end
