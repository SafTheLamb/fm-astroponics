if mods["Voidcraft"] then
	local vcc = require("__Voidcraft__.prototypes.costs")

	local vc_recipes = {}
	table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__astroponics__", subgroup="voidcraft-orbital", fluid=60, secondary_item=true}, {"liquid-fertilizer", "tree-seed", "sulfur"}, "vga-ga", vcc.petrochem_liquid, "s6x-void-orbital", {0.4, 0.8, 0.133}))

	if next(vc_recipes) ~= nil  then
		data:extend(vc_recipes)
		for _, recipe in pairs(vc_recipes) do
			data:extend({
				VOIDCRAFT.coherize(recipe),
				VOIDCRAFT.fluxize(recipe)
			})
		end
	end
end
