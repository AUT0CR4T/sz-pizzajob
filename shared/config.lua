Config = {}

Config.Debug = false

Config.MixerWaitTime = 30 -- How long it takes till the mixer has finished mixing -- Time in seconds

Config.FridgeItems = {
    label = 'Fridge',
    slots = 20,
    items = {
        [1] = {name = 'butter', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'flour', price = 0, amount = 50, info = {}, type = 'item', slot = 2},
        [3] = {name = 'milk', price = 0, amount = 50, info = {}, type = 'item', slot = 3},
        [4] = {name = 'salt', price = 0, amount = 50, info = {}, type = 'item', slot = 4}
    }
}

Config.StaffFridgeItems = {
    label = 'Fridge',
    slots = 20,
    items = {
        [1] = {name = 'water_bottle', price = 0, amount = 50, info = {}, type = 'item', slot = 1},
        [2] = {name = 'tosti', price = 0, amount = 50, info = {}, type = 'item', slot = 2},
        [3] = {name = 'kurkakola', price = 0, amount = 50, info = {}, type = 'item', slot = 3}
    }
}