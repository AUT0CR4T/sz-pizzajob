Config = {}

Config.Debug = true

Config.MixerWaitTime = 30 -- How long it takes till the mixer has finished mixing -- Time in seconds

Config.FridgeItems = {
    label = 'Fridge',
    slots = 20,
    items = {
        [1] = {name = 'water_bottle', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'tosti', price = 0, amount = 50, info = {}, type = 'item', slot = 2}
    }
}