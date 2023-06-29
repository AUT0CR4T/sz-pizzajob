local QBCore = exports['qb-core']:GetCoreObject()

local mixerInUse = false -- DO NOT CHANGE THIS


-- Events
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

RegisterNetEvent('sz-pizzajob:server:makepizzabase', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('sz-pizzajob:client:makepizzabase')
    Player.Functions.RemoveItem('dough', 1)
    Player.Functions.RemoveItem('tomatosuace', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dough'], 'remove', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomatosauce'], 'remove', 1)
    Player.Functions.AddItem('dough', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.returnItem], 'add', 1)
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

RegisterNetEvent('sz-pizzajob:server:removeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
end)

RegisterNetEvent('sz-pizzajob:server:givetopping', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(data.returnItem, data.amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.returnItem], 'add', data.amount)
    TriggerClientEvent('sz-pizzajob:client:toppingsmenu', src)
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

RegisterNetEvent('sz-pizzajob:server:givepizzabase', function(item, amount) -- Move to new add item event
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
end)

RegisterNetEvent('sz-pizzajob:server:givepizza', function(data) -- Needs re coding
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('gratedcheese', 1)
    Player.Functions.RemoveItem('slicedpepperoni', 1)
    Player.Functions.RemoveItem('pizzabase')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['gratedcheese'], 'remove', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['slicedpepperoni'], 'remove', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pizzabase'], 'remove', 1)
    Player.Functions.AddItem(data.returnItem, data.amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.returnItem], 'add', data.amount)
end)

RegisterNetEvent('sz-pizzajob:server:useoven', function(data) -- Make give item 1 function for everything
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(data.returnItem, data.amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.returnItem], 'add', data.amount)
end)

-- Useable Items
QBCore.Functions.CreateUseableItem('pizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pizzabox', 1)
    Player.Functions.AddItem('pizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pizzaslice'], 'add', 6)
end)

-- QBCore.Functions.CreateUseableItem('cheesepizzabox', function(source, item)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     Player.Functions.RemoveItem('pizzabox', 1)
--     Player.Functions.AddItem('', 6)
--     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cheesepizzabox'], 'add', 6)
-- end)

QBCore.Functions.CreateUseableItem('pepperonipizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pizzabox', 1)
    Player.Functions.AddItem('pepperonipizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pepperonipizzaslice'], 'add', 6)
end)

QBCore.Functions.CreateUseableItem('pizzaslice', function(source, item)
    TriggerClientEvent('sz-pizzajob:client:eat', source, item.name, 'Eating Pizza Slice', math.random(5000, 10000), math.random(40, 60), 'pizzas2')
end)