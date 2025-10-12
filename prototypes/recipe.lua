local wood_amount = mods["early-agriculture"] and settings.startup["early-agriculture-buff-tree-plant"].value and 10 or 4
local glass_item = (mods["aai-industry"] or (mods["crushing-industry"] and settings.startup["crushing-industry-glass"].value)) and "glass" or nil
local subgroup = mods["bioprocessing-tab"] and "astroponic-processes" or "fluid-recipes"

data:extend({
  {
    type = "recipe",
    name = "space-garden",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type="item", name="low-density-structure", amount=20},
      glass_item and {type="item", name=glass_item, amount=80} or {type="item", name="concrete", amount=10},
      {type="item", name="processing-unit", amount=5},
      {type="item", name="pipe", amount=10},
      {type="item", name="landfill", amount=10}
    },
    results = {{type="item", name="space-garden", amount=1}}
  },
  {
    type = "recipe",
    name = "liquid-fertilizer",
    localised_name = {"recipe-name.liquid-fertilizer-chemical"},
    icon = "__astroponics__/graphics/icons/fluid/chemical-liquid-fertilizer.png",
    category = "chemistry-or-cryogenics",
    subgroup = "astroponic-processes",
    order = "e[astroponics]-a[chemical]",
    surface_conditions = not mods["Space-Age-Without-Platforms"] and {{property="magnetic-field", min=0, max=99}} or nil,
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    ingredients = {
      {type="fluid", name="sulfuric-acid", amount=20},
      {type="item", name="carbon", amount=1},
      {type="fluid", name=mods["bztin"] and "organotins" or "water", amount=10}
    },
    results = {
      {type="fluid", name="liquid-fertilizer", amount=20}
    }
  },
  {
    type = "recipe",
    name = "bioslurry-recycling",
    icon = "__astroponics__/graphics/icons/fluid/bioslurry-recycling.png",
    category = "chemistry-or-cryogenics",
    subgroup = "astroponic-processes",
    order = "e[astroponics]-b[recycling]",
    surface_conditions = {{property="magnetic-field", min=0, max=5}},
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    allow_productivity = false,
    ingredients = {
      {type="fluid", name="bioslurry", amount=10, ignored_by_stats=10},
      {type="item", name=mods["wood-industry"] and "charcoal" or "carbon", amount=1},
      {type="fluid", name="water", amount=10}
    },
    results = {
      {type="fluid", name="liquid-fertilizer", amount=20, ignored_by_stats=20, ignored_by_productivity=20}
    }
  },
  {
    type = "recipe",
    name = "tree-astroponics",
    localised_name = {"recipe-name.tree-astroponics"},
    icons = {
      {icon="__base__/graphics/icons/wood.png"},
      {icon="__astroponics__/graphics/icons/fluid/liquid-fertilizer.png", shift={-8,-8}, scale=0.3},
    },
    category = "astroponics",
    subgroup = "astroponic-processes",
    order = "b[agriculture]-a[wood]",
    energy_required = 12,
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    allow_decomposition = false,
    ingredients = {
      {type="fluid", name="liquid-fertilizer", amount=50},
      {type="item", name="tree-seed", amount=1}
    },
    results = {
      {type="item", name="wood", amount=wood_amount},
      {type="fluid", name="bioslurry", amount=25, ignored_by_productivity=25}
    },
    main_product = "wood"
  }
})

if settings.startup["astroponics-gleba-crops"].value then
  data:extend({
    {
      type = "recipe",
      name = "yumako-astroponics",
      localised_name = {"recipe-name.yumako-astroponics"},
      icons = {
        {icon="__space-age__/graphics/icons/yumako.png"},
        {icon="__astroponics__/graphics/icons/fluid/liquid-fertilizer.png", shift={-8,-8}, scale=0.3}
      },
      category = "astroponics",
      subgroup = "astroponic-processes",
      order = "d[xeno]-a[yumako]",
      energy_required = 18,
      enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      ingredients = {
        {type="fluid", name="liquid-fertilizer", amount=100, ignored_by_stats=100},
        {type="item", name="calcite", amount=1},
        {type="item", name="yumako-seed", amount=1}
      },
      results = {
        {type="item", name="yumako", amount=20},
        {type="fluid", name="bioslurry", amount=40, ignored_by_productivity=40}
      },
      main_product = "yumako"
    },
    {
      type = "recipe",
      name = "jellynut-astroponics",
      localised_name = {"recipe-name.jellynut-astroponics"},
      icons = {
        {icon="__space-age__/graphics/icons/jellynut.png"},
        {icon="__astroponics__/graphics/icons/fluid/liquid-fertilizer.png", shift={-8,-8}, scale=0.3}
      },
      category = "astroponics",
      subgroup = "astroponic-processes",
      order = "d[xeno]-b[jellynut]",
      energy_required = 18,
      enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      ingredients = {
        {type="fluid", name="liquid-fertilizer", amount=100},
        {type="item", name="calcite", amount=1},
        {type="item", name="jellynut-seed", amount=1}
      },
      results = {
        {type="item", name="jellynut", amount=20},
        {type="fluid", name="bioslurry", amount=40, ignored_by_productivity=40}
      },
      main_product = "jellynut"
    }
  })
end

if settings.startup["astroponics-crude-oil"].value then
  data:extend({
    {
      type = "recipe",
      name = "bioslurry-putrefaction",
      localised_name = {"recipe-name.bioslurry-putrefaction"},
      icon = "__astroponics__/graphics/icons/fluid/bioslurry-putrefaction.png",
      category = "chemistry-or-cryogenics",
      subgroup = subgroup,
      order = "e[astroponics]-c[putrefaction]",
      energy_required = 5,
      emissions_multiplier = 10,
      enabled = false,
      auto_recycle = false,
      allow_productivity = true,
      ingredients = {
        {type="fluid", name="bioslurry", amount=10},
        {type="fluid", name="sulfuric-acid", amount=20},
        {type="item", name="carbon", amount=1},
        {type="item", name="calcite", amount=1}
      },
      results = {
        {type="fluid", name="crude-oil", amount=30}
      }
    }
  })
end
