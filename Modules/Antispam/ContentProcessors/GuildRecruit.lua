local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors

local Patterns = {
    '招收', '招募', 'DKP', 'GKP', '收人', '招人'
}

local function GuildRecruitProcessor(payload)
    ContentProcessors.BlacklistProcessor(payload, Patterns)
end
ContentProcessors.GuildRecruitProcessor = GuildRecruitProcessor
