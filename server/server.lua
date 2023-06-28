local QBCore = exports['qb-core']:GetCoreObject()

local mixerInUse = false -- DO NOT CHANGE THIS

RegisterNetEvent('sz-pizzajob:server:makedough', function(data)
    mixerInUse = true -- No one can use the mixer
    local src = source
    QBCore.Functions.Notify(src, 'Began mixing...', 'primary', 3000)
    Wait(Config.MixerWaitTime * 1000)
    QBCore.Functions.Notify(src, 'Mixer has finished', 'success', 3000)
end)