local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors

local Patterns = {
    -- General trades
    '代工', '代做', '带材料', '包安装', '图纸',
    -- Enchanting
    'FM', '附魔', '十字军', '秘药',
    -- Trade Goods
    '亚麻布', '毛料', '丝绸', '魔纹布', '符文布', '月布', '恶魔布',
    '重皮', '厚皮', '魔暴龙',
    '元素火焰', '空气精华', '水之精华', 
    '瑟银', '萨弗隆铁锭', '奥术水晶', '奥金', '黑铁矿',
    '强效火焰防护药水', '超级能量合剂', '黑莲花', '雨燕草',
    '灵魂袋', '厚重的石头',
    -- BoE
    '乔丹法杖', '大法师之袍', '飓风', '夜刃', '命运', '提布', '剑师护手', 
    '寒冰指环', '斩首者康恩', '克罗', '屠龙技术纲要', '暗影之眼',
    '鬼雾', '虔诚', '博学',
    '奥术师', '恶魔之心', '夜幕杀手', '秩序之源', '巨人追猎者', '预言',
    -- Dungeons
    '遗物宝箱钥匙',
    -- Others
    '位面', '逃税'
}

local function TradeProcessor(payload)
    ContentProcessors.BlacklistProcessor(payload, Patterns)
end
ContentProcessors.TradeProcessor = TradeProcessor
