local QBCore = exports['qb-core']:GetCoreObject()


-- Targets
-- Duty
exports['qb-target']:AddBoxZone('sz-pizzajob:duty', vector3(804.41, -760.53, 31.27), 0.4, 0.4, {
    name = 'sz-pizzajob:duty',
    heading = 2,
    debugPoly = Config.Debug,
    minZ = 31.02,
    maxZ = 31.42,
}, {
    options = {
        {
            num = 1,
            type = 'server',
            event = 'QBCore:ToggleDuty',
            icon = 'fas fa-laptop',
            label = 'Duty',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1.2,
})

-- Boss Menu
exports['qb-target']:AddBoxZone('sz-pizzajob:bossmenu', vector3(794.97, -767.02, 31.27), 0.2, 0.4, {
    name = 'sz-pizzajob:bossmenu',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 31.22,
    maxZ = 31.57,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'qb-bossmenu:client:OpenMenu',
            icon = 'fas fa-computer',
            label = 'Management',
            job = {['pizzathis'] = 4, 5},
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Fries
exports['qb-target']:AddBoxZone('sz-pizzajob:makefries', vector3(808.35, -761.21, 26.78), 0.6, 0.7, {
    name = 'sz-pizzajob:makefries',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 0.6,
    maxZ = 0.7,
}, {
    options = {
        {
            num = 1,
            type = 'server',
            event = '',
            icon = 'fas fa-utensils',
            label = 'Make Fries',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Fridge
exports['qb-target']:AddBoxZone('sz-pizzajob:openfridge', vector3(805.93, -761.68, 26.78), 1.4, 0.2, {
    name = 'sz-pizzajob:openfridge',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.08,
    maxZ = 28.08,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:OpenFridge',
            icon = 'fas fa-snowflake',
            label = 'Open Fridge',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Make Dough
exports['qb-target']:AddBoxZone('sz-pizzajob:makedough', vector3(805.99, -757.23, 26.78), 1.0, 0.8, {
    name = 'sz-pizzajob:makedough',
    heading = 41,
    debugPoly = Config.Debug,
    minZ = 25.78,
    maxZ = 27.33,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = 'sz-pizzajob:client:makedough',
            icon = 'fas fa-power-off',
            label = 'Make Dough',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

-- Prepare Pizza
exports['qb-target']:AddBoxZone('sz-pizzajob:preparepizza', vector3(807.64, -756.87, 26.78), 0.6, 1.9, {
    name = 'sz-pizzajob:preparepizza',
    heading = 0,
    debugPoly = Config.Debug,
    minZ = 26.43,
    maxZ = 26.78,
}, {
    options = {
        {
            num = 1,
            type = 'client',
            event = '',
            icon = 'fas fa-pizza-slice',
            label = 'Prepare Pizza',
            job = 'pizzathis',
            drawColor = {255, 255, 255, 255},
            successDrawColor = {30, 144, 255, 255},
        }
    },
    distance = 1,
})

RegisterNetEvent('sz-pizzajob:client:OpenFridge', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "FridgeItems", Config.FridgeItems)
    end
end)

RegisterNetEvent('sz-pizzajob:client:makedough', function()
    local Player = QBCore.Functions.GetPlayerData()
    local jobDuty = Player.job.onduty
    if not jobDuty then
        QBCore.Functions.Notify('You are not clocked in!', 'error', 3000)
    else
        exports['qb-menu']:openMenu({
            {
                header = 'Dough Mixer',
                icon = 'fas fa-cloud',
                isMenuHeader = true,
            },
            {
                header = 'Make Dough',
                txt = 'Mix ingredients to make Dough',
                icon = 'fas fa-cloud',
                params = {
                    isServer = true,
                    event = 'sz-pizzajob:server:makedough',
                    args = {
                        item = 'dough'
                    }
                }
            }
        })
    end
end)