local _, Engine = ...

local ContentProcessors = Engine.Modules.Antispam.ContentProcessors

local Patterns = {
    -- General trades
    '代工', '代做', '带材料', '包安装', '图纸', '开锁',
    -- Enchanting
    'FM', '附魔', '十字军', '秘药',
    '虚空裂蹄腿甲片',
    -- Trade Goods
    '铁桥',
    '亚麻布', '毛料', '丝绸', '魔纹布', '符文布', '月布', '恶魔布', '灵纹布',
    '重皮', '厚皮', '魔暴龙', '硬甲皮',
    '元素火焰', '空气精华', '水之精华',
    '瑟银', '萨弗隆铁锭', '奥术水晶', '奥金', '黑铁矿',
    '强效火焰防护药水', '超级能量合剂', '黑莲花', '雨燕草', '山鼠草', '梦叶草', '无情突袭',
    '灵魂袋', '厚重的石头', '氪金', '精金矿石',
    '图鉴：', '秘典：', '设计图：', '配方：',
    '天火钻石',
    -- BoE
    '乔丹法杖', '大法师之袍', '飓风', '夜刃', '命运', '提布', '剑师护手',
    '寒冰指环', '斩首者康恩', '克罗', '屠龙技术纲要', '暗影之眼',
    '鬼雾', '虔诚', '博学',
    '夜色之刃', '无懈防御指环',
    '奥术师', '恶魔之心', '夜幕杀手', '秩序之源', '巨人追猎者', '预言',
    -- Dungeons
    '遗物宝箱钥匙', '盘牙武器',
    -- Others
    '位面', '逃税', '守望堡烈酒',
    -- Adhoc
    'JJC', '竞技场', '通缉',
    'KLZ', '卡拉赞', 'MSLD', '马瑟里顿', 'GLR', '格鲁尔'
}

local function TradeProcessor(payload)
    ContentProcessors.BlacklistProcessor(payload, Patterns)
end
ContentProcessors.TradeProcessor = TradeProcessor
