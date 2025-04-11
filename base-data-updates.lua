local frep = require("__fdsl__.lib.recipe")

data.raw.recipe["wood-processing"].surface_conditions = nil

frep.replace_ingredient("overgrowth-yumako-soil", "water", "liquid-fertilizer")
frep.replace_ingredient("overgrowth-jellynut-soil", "water", "liquid-fertilizer")
