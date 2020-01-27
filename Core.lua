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
if (IcyUIDB.SenderBlacklist == nil) then
    IcyUIDB.SenderBlacklist = {}
end
if (IcyUIDB.AHData == nil) then
    IcyUIDB.AHData = {}
end
