local _, Engine = ...

local Insights = Engine.Modules.Antispam.Insights

local function AddRecord(payload)
    if (IcyUIDB.Insights[payload.Text] == nil) then
        IcyUIDB.Insights[payload.Text] = {
            Payload = payload,
            Count = 1,
            LastSeen = time()
        }
    else
        IcyUIDB.Insights[payload.Text].Count = IcyUIDB.Insights[payload.Text].Count + 1
        IcyUIDB.Insights[payload.Text].LastSeen = time()
    end
end
Insights.AddRecord = AddRecord

local function GC()
    local now = time()
    for key, data in pairs(IcyUIDB.Insights) do
        if (now - data.LastSeen >= 24 * 60 * 60) then
            IcyUIDB.Insights[key] = nil
        end
    end
end
