local QBCore = exports['qb-core']:GetCoreObject()

local mixerInUse = false -- DO NOT CHANGE THIS

RegisterNetEvent('sz-pizzajob:server:makedough', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if mixerInUse then
        QBCore.Functions.Notify(src, 'Mixer already in use', 'error', 3000)
    else
        mixerInUse = true 
        Player.Functions.RemoveItem('butter', 1)
        Player.Functions.RemoveItem('flour', 1)
        Player.Functions.RemoveItem('milk', 1)
        Player.Functions.RemoveItem('salt', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, 'butter', 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, 'flour', 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, 'milk', 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, 'salt', 'remove', 1)
        QBCore.Functions.Notify(src, 'Began mixing...', 'primary', 3000)
        Wait(Config.MixerWaitTime * 1000)
        QBCore.Functions.Notify(src, 'Mixer has finished', 'success', 3000)
        Player.Functions.AddItem('dough', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, 'dough', 'add', 1)
        mixerInUse = false
    end
end)

-- Useable Items
QBCore.Functions.CreateUseableItem('pizzabox', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('pizzabox', 1)
    Player.Functions.AddItem('pizzaslice', 6)
    TriggerClientEvent('inventory:client:ItemBox', src, 'pizzaslice', 'remove', 6)
end)