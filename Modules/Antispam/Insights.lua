local _, Engine = ...

local Insights = Engine.Modules.Antispam.Insights
local gcPeriod = 60  -- GC every minute
local retention = 3600  -- 1 hour of retention

local function GC()
    local now = GetTime()
    if (IcyUIDB.LastGCTime == nil or now - IcyUIDB.LastGCTime >= gcPeriod) then
        for key, data in pairs(IcyUIDB.Insights) do
            if (now - data >= retention) then
                IcyUIDB.Insights[key] = nil
            end
        end
        IcyUIDB.LastGCTime = now
    end
end

local function AddRecord(payload)
    IcyUIDB.Insights[payload.Hash] = GetTime()
    GC()
end
Insights.AddRecord = AddRecord
