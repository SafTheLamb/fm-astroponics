local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "space-garden",
    icon = "__astroponics__/graphics/icons/space-garden.png",
    subgroup = "space-platform",
    order = "g[space-garden]",
    place_result = "space-garden",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    stack_size = 10,
    weight = 200 * kg
  }
})
