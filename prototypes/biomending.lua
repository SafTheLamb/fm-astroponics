function generate_biomending_recipe_icons_from_item(item)
  local icons = {}
  if item.icons == nil then
    icons = {
      {icon = "__astroponics__/graphics/icons/biomending.png"},
      {
        icon = item.icon,
        icon_size = item.icon_size,
        scale = (0.5 * defines.default_icon_size / (item.icon_size or defines.default_icon_size)) * 0.8,
      },
      {icon = "__astroponics__/graphics/icons/biomending-top.png"}
    }
  else
    icons = {{icon = "__astroponics__/graphics/icons/biomending.png"}}
    for i = 1, #item.icons do
      local icon = table.deepcopy(item.icons[i]) -- we are gonna change the scale, so must copy the table
      icon.scale = ((icon.scale == nil) and (0.5 * defines.default_icon_size / (icon.icon_size or defines.default_icon_size)) or icon.scale) * 0.8
      icon.shift = util.mul_shift(icon.shift, 0.8)
      icons[#icons + 1] = icon
    end
    icons[#icons + 1] = {icon = "__astroponics__/graphics/icons/biomending-top.png"}
  end
  return icons
end

local mendable_agriculture_items = {
  {type="item", name="pentapod-egg"},
  {type="item", name="biter-egg"}
}

for _,entry in pairs(mendable_agriculture_items) do
  local item = data.raw[entry.type][entry.name]
  data:extend({
    {
      type = "recipe",
      name = entry.name.."-biomending",
      localised_name = {"recipe-name.biomending", {item.localised_name or ("item-name."..entry.name)}},
      icons = generate_biomending_recipe_icons_from_item(item),
      category = "astroponics",
      subgroup = item.subgroup or "agriculture-products",
      order = item.order.."-b[mending]",
      enabled = false,
      unlock_results = false,
      allow_quality = false,
      result_is_always_fresh = true,
      ingredients = {
        {type="item", name=entry.name, amount=1, ignored_by_stats=1, ignored_by_productivity=1},
        {type="item", name="bioflux", amount=1},
        {type="fluid", name="liquid-fertilizer", amount=200}
      },
      results = {
        {type="item", name=entry.name, amount=1, probability=0.99, percent_spoiled=0.9, ignored_by_stats=1, ignored_by_productivity=1},
        {type="fluid", name="bioslurry", amount=40}
      },
      main_product = entry.name,
      energy_required = entry.energy_required or 0.5,
      crafting_machine_tint = data.raw.recipe[entry.name] and data.raw.recipe[entry.name].crafting_machine_tint or {primary = {0.5,0.5,0.5,0.5}, secondary = {0.5,0.5,0.5,0.5}, tertiary = {0.5,0.5,0.5,0.5}, quaternary = {0.5,0.5,0.5,0.5}}
    }
  })
end
