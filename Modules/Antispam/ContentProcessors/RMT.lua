local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors

local Patterns = {
    -- RMT
    '有偿', '老板', '手打', '出租', '躺尸', '消费', '1-10',
    -- 'G团', '金团', '内销',
    '包团', '包毕业', '代刷', '带刷', '不缺打手', '躺全程',
    -- Gold
    '大米', '小米', '水稻', '糯米', '小马', '大马', '粮食', '出米', '收米', '先G', '先R',
    '比例', '收G', '手工', '散卖', '小额', '刷G', '%d斤', '%d米',
    -- Raid Markers, commonly used
    '{星形}', '{圆形}', '{菱形}', '{三角}', '{月亮}', '{方块}', '{十字}', '{骷髅}', '{RT%d}',
    -- WeChat
    'VX', 'WX',
    -- Leveling
    '经验', '包级', 'AA', '1-60',
    '单法', '双法', '三法', 
    '小班', '中班', '大班', 
    '托管', '光速', '看电影', 
    '扫地', '童工', '弯腰', '不拾取', '自由拾取',
    '经验宝宝', '经验BB', '带血色', '带监狱',
    -- Battlegrounds
    '国家队', '1351', '15998', '崇拜', '战歌', '荣誉',
    '奥山', '澳山',
    -- Quests
    '史诗弓', '上古守护者的长弓', '大水任务',
    -- Others
    '连锁', 'R0', 'RO1',
}

local function RMTProcessor(payload)
    ContentProcessors.BlacklistProcessor(payload, Patterns)
end
ContentProcessors.RMTProcessor = RMTProcessor
