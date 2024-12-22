local wood_amount = 10

local IGNORE_ALL = 9999

data:extend({
  {
    type = "recipe",
    name = "space-garden",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type="item", name="low-density-structure", amount=20},
      mods["aai-industry"] and {type="item", name="glass", amount=100} or {type="item", name="concrete", amount=10},
      {type="item", name="processing-unit", amount=5},
      {type="item", name="pipe", amount=10},
      {type="item", name="landfill", amount=1}
    },
    results = {{type="item", name="space-garden", amount=1}}
  },
  {
    type = "recipe",
    name = "liquid-fertilizer",
    icon = "__wood-universe-assets__/graphics/icons/fluid/chemical-liquid-fertilizer.png",
    category = "chemistry-or-cryogenics",
    subgroup = "astroponics",
    order = "a[fertilizer]-a[chemical]",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    ingredients = {
      {type="fluid", name="sulfuric-acid", amount=10},
      {type="item", name="carbon", amount=1},
      {type="fluid", name="water", amount=10}
    },
    results = {
      {type="fluid", name="liquid-fertilizer", amount=20}
    }
  },
  {
    type = "recipe",
    name = "bioslurry-recycling",
    icon = "__wood-universe-assets__/graphics/icons/fluid/bioslurry-recycling.png",
    category = "chemistry-or-cryogenics",
    subgroup = "astroponics",
    order = "c[bioslurry]-a[recycling]",
    energy_required = 2,
    enabled = false,
    auto_recycle = false,
    allow_productivity = false,
    ingredients = {
      {type="fluid", name="bioslurry", amount=10, ignored_by_stats=IGNORE_ALL, ignored_by_productivity=IGNORE_ALL},
      {type="item", name="carbon", amount=1},
      {type="fluid", name="water", amount=10}
    },
    results = {
      {type="fluid", name="liquid-fertilizer", amount=20, ignored_by_stats=IGNORE_ALL, ignored_by_productivity=IGNORE_ALL}
    }
  },
  {
    type = "recipe",
    name = "tree-astroponics",
    icon = "__base__/graphics/icons/wood.png",
    category = "astroponics",
    subgroup = "astroponics",
    order = "b[agriculture]-a[wood]",
    energy_required = 30,
    enabled = false,
    auto_recycle = false,
    allow_productivity = true,
    ingredients = {
      {type="fluid", name="liquid-fertilizer", amount=50, ignored_by_stats=IGNORE_ALL, ignored_by_productivity=IGNORE_ALL},
      {type="item", name="tree-seed", amount=1}
    },
    results = {
      {type="item", name="wood", amount=wood_amount},
      {type="fluid", name="bioslurry", amount=25, ignored_by_stats=IGNORE_ALL, ignored_by_productivity=IGNORE_ALL}
    }
  }
})
