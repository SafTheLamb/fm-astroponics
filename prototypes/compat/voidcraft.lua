if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")

  data:extend({
    VOIDCRAFT.voidcraft_recipe({prefix="__astroponics__", subgroup="voidcraft-orbital", fluid=60, secondary_item=true}, {"liquid-fertilizer", "tree-seed", "sulfur"}, "vga-ga", vcc.petrochem_liquid, "s6x-void-orbital", {0.4, 0.8, 0.133})
  })
end
