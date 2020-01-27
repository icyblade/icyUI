local _, Engine = ...

Engine.Modules.Economy = {}

local function StartFullAHScan()
    local canQuery, canQueryAll = CanSendAuctionQuery()
    if (not canQuery) then
        print('Auction house busy')
        return
    end
    if (not canQueryAll) then
        print('Please re-login')
        return
    end

    QueryAuctionItems('', nil, nil, 0, false, 0, true, false, nil)
    -- TODO: integrate with StartFullAHDump
    print('Full AH scan complete')
end
Engine.Modules.Economy.StartFullAHScan = StartFullAHScan

local function StartFullAHDump()
    local batch, count = GetNumAuctionItems('list')
    local scanTime = time()
    for i = 1, batch do
        local name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo('list', i)
        table.insert(IcyUIDB.AHData, {
            name = name,
            count = count,
            buyoutPrice = buyoutPrice,
            itemId = itemId,
            scanTime = scanTime
        })
    end
end
Engine.Modules.Economy.StartFullAHDump = StartFullAHDump
