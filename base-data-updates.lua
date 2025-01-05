local frep = require("__fdsl__.lib.recipe")

data.raw.recipe["wood-processing"].surface_conditions = nil

frep.replace_ingredient("overgrowth-yumako-soil", "water", "liquid-fertilizer")
frep.replace_ingredient("overgrowth-jellynut-soil", "water", "liquid-fertilizer")

if mods["bztitanium"] then
  frep.add_ingredient("space-garden", {type="item", name="steel-plate", amount=50})
end

if mods["bztin"] then
  frep.add_ingredient("space-garden", {type="item", name="solder", amount=10})
end
