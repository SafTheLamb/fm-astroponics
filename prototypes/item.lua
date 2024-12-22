local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "space-garden",
    icon = "__Krastorio2Assets__/icons/entities/greenhouse.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "space-platform",
    order = "g[space-garden]",
    place_result = "space-garden",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    stack_size = 10,
    weight = 100 * kg
  }
})
