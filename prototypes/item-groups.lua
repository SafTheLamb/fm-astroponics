data:extend({
	{
		type = "item-subgroup",
		name = "astroponics",
		group = "space",
		order = "e"
	},
	{
		type = "item-subgroup",
		name = "astroponic-processes",
		group = mods["bioprocessing-tab"] and "bioprocessing" or "intermediate-products",
		order = mods["bioprocessing-tab"] and "e" or "w"
	}
})
