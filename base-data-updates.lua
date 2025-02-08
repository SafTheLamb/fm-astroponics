local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Recipe changes

data.raw.recipe["wood-processing"].surface_conditions = nil

frep.replace_ingredient("overgrowth-yumako-soil", "water", "liquid-fertilizer")
frep.replace_ingredient("overgrowth-jellynut-soil", "water", "liquid-fertilizer")

-------------------------------------------------------------------------- BZ mods

if mods["bztitanium"] then
  frep.add_ingredient("space-garden", {type="item", name="steel-plate", amount=50})
end

if mods["bztin"] then
  frep.add_ingredient("space-garden", {type="item", name="solder", amount=10})
end

-------------------------------------------------------------------------- Technology changes

ftech.add_prereq("space-platform-thruster", "astroponics")
ftech.remove_unlock("space-platform-thruster", "ice-melting")

if not mods["early-agriculture"] then
  ftech.add_unlock("astroponics", "wood-processing")
  data.raw.technology["tree-seeding"].hidden = true
  data.raw.technology["tree-seeding"].enabled = false
  data.raw.technology["fish-breeding"].prerequisites = {"agricultural-science-pack"}
end

ftech.add_unlock("cryogenic-plant", "ammoniacal-liquid-fertilizer")
