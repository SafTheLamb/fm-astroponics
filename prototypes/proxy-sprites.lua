local ficon = require("__fdsl__.lib.icon")
local meld = require("__core__.lualib.meld")

data:extend({
	{
		type = "sprite",
		name = "wcu-proxy-bioslurry-putrefaction",
		filename = "__astroponics__/graphics/icons/fluid/bioslurry-putrefaction.png",
		size = 64
	},
	{
		type = "sprite",
		name = "wcu-proxy-gleba-astroponics",
		layers = ficon.to_layers({
			ficon.make_corner_icon("item", "jellynut", ficon.alignment.top_right, 0.8),
			ficon.make_corner_icon("item", "yumako", ficon.alignment.bottom_left, 0.8),
			ficon.make_corner_icon("fluid", "liquid-fertilizer", ficon.alignment.top_left, 0.6)
		})
	},
	{
		type = "sprite",
		name = "wcu-proxy-more-glebaponics",
		layers = ficon.to_layers({
			ficon.make_corner_icon("item", "jellynut", ficon.alignment.top_right, 0.8),
			ficon.make_corner_icon("item", "yumako", ficon.alignment.bottom_left, 0.8),
			ficon.make_corner_icon("fluid", "liquid-fertilizer", ficon.alignment.top_left, 0.6),
			{icon="__core__/graphics/icons/technology/effect-constant/effect-constant-mining-productivity.png", scale=0.5},
		})
	}
})
