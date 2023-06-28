local QBCore = exports['qb-core']:GetCoreObject()

local mixerInUse = false -- DO NOT CHANGE THIS

RegisterNetEvent('sz-pizzajob:server:makedough', function(data)
    local src = source
    if mixerInUse then
        QBCore.Functions.Notify(src, 'Mixer already in use', 'error', 3000)
    else
        mixerInUse = true 
        QBCore.Functions.Notify(src, 'Began mixing...', 'primary', 3000)
        Wait(Config.MixerWaitTime * 1000)
        QBCore.Functions.Notify(src, 'Mixer has finished', 'success', 3000)
        mixerInUse = false
    end
end)