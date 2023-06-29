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

RegisterNetEvent('sz-pizzajob:server:giveitem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, v in pairs(data.returnItems) do
        Player.Functions.AddItem(v, data.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v], 'add', data.amount)
    end
end)

RegisterNetEvent('sz-pizzajob:server:removeitem', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for _, v in pairs(data.removeItems) do
        Player.Functions.RemoveItem(v, data.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v], 'remove', data.amount)
    end
end)

RegisterNetEvent('sz-pizzajob:server:removeeatitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
end)

-- Useable Items
QBCore.Functions.CreateUseableItem('pizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pizzabox', 1)
    Player.Functions.AddItem('pizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pizzaslice'], 'add', 6)
end)

QBCore.Functions.CreateUseableItem('pepperonipizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pepperonipizzabox', 1)
    Player.Functions.AddItem('pepperonipizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pepperonipizzaslice'], 'add', 6)
end)

QBCore.Functions.CreateUseableItem('cheesepizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('cheesepizzabox', 1)
    Player.Functions.AddItem('cheesepizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cheesepizzaslice'], 'add', 6)
end)

QBCore.Functions.CreateUseableItem('jalapenoandpepperonipizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('jalapenoandpepperonipizzabox', 1)
    Player.Functions.AddItem('jalapenoandpepperonipizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['jalapenoandpepperonipizzaslice'], 'add', 6)
end)

QBCore.Functions.CreateUseableItem('pepperonipizzaslice', function(source, item)
    TriggerClientEvent('sz-pizzajob:client:eat', source, item.name, 'Eating Pepperoni Pizza Slice', math.random(5000, 10000), math.random(40, 60), 'pizzas5')
end)

QBCore.Functions.CreateUseableItem('cheesepizzaslice', function(source, item)
    TriggerClientEvent('sz-pizzajob:client:eat', source, item.name, 'Eating Cheese Pizza Slice', math.random(5000, 10000), math.random(40, 60), 'pizzas4')
end)

QBCore.Functions.CreateUseableItem('jalapenoandpepperonipizzaslice', function(source, item)
    TriggerClientEvent('sz-pizzajob:client:eat', source, item.name, 'Eating Jalapeno & Pepperoni Pizza Slice', math.random(5000, 10000), math.random(40, 60), 'pizzas')
end)