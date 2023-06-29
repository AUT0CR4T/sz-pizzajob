local QBCore = exports['qb-core']:GetCoreObject()

local mixerInUse = false -- DO NOT CHANGE THIS

RegisterNetEvent('sz-pizzajob:server:makedough', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local returnItem = data.returnItem
    if mixerInUse then
        QBCore.Functions.Notify(src, 'Mixer already in use', 'error', 3000)
    else
        mixerInUse = true 
        Player.Functions.RemoveItem('butter', 1)
        Player.Functions.RemoveItem('flour', 1)
        Player.Functions.RemoveItem('milk', 1)
        Player.Functions.RemoveItem('salt', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['butter'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['flour'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['milk'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['salt'], 'remove', 1)
        QBCore.Functions.Notify(src, 'Began mixing...', 'primary', 3000)
        Wait(Config.MixerWaitTime * 1000)
        QBCore.Functions.Notify(src, 'Mixer has finished', 'success', 3000)
        Player.Functions.AddItem('dough', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[returnItem], 'add', 1)
        mixerInUse = false
    end
end)

-- RegisterNetEvent('sz-pizzajob:server:makepizzabase', function(data)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     TriggerClientEvent('sz-pizzajob:client:makepizzabase')
--     Player.Functions.RemoveItem('dough', 1)
--     Player.Functions.RemoveItem('tomatosuace', 1)
--     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dough'], 'remove', 1)
--     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomatosauce'], 'remove', 1)
--     Player.Functions.AddItem('dough', 1)
--     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.returnItem], 'add', 1)
-- end)

RegisterNetEvent('sz-pizzajob:server:addHunger', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local hunger = Player.PlayerData.metadata["hunger"]
    local addhunger = hunger + amount
    if addhunger > 100 then
        addhunger = 100
    end

    if not Player then return end

    Player.Functions.SetMetaData('hunger', addhunger)
    TriggerClientEvent('hud:client:UpdateNeeds', source, addhunger, Player.PlayerData.metadata.hunger)
end)

RegisterNetEvent('sz-pizzajob:server:removeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pizzaslice'], 'remove', amount)
end)

-- Useable Items
QBCore.Functions.CreateUseableItem('pizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pizzabox', 1)
    Player.Functions.AddItem('pizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pizzaslice'], 'remove', 6)
end)

QBCore.Functions.CreateUseableItem('pizzaslice', function(source, item)
    TriggerClientEvent('sz-pizzajob:client:eat', source, item.name, 'Eating Pizza Slice', math.random(5000, 10000), math.random(40, 60), 'pizzas2')
end)

RegisterNetEvent('sz-pizzajob:server:addHunger', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local hunger = Player.PlayerData.metadata["hunger"]
    local addhunger = hunger + amount
    if addhunger > 100 then
        addhunger = 100
    end

    if not Player then return end

    Player.Functions.SetMetaData('hunger', addhunger)
    TriggerClientEvent('hud:client:UpdateNeeds', source, addhunger, Player.PlayerData.metadata.hunger)
end)