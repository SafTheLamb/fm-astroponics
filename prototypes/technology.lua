data:extend({
  {
    type = "technology",
    name = "astroponics",
    icon = "__astroponics__/graphics/technology/astroponics.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="space-garden"},
      {type="unlock-recipe", recipe="liquid-fertilizer"},
      {type="unlock-recipe", recipe="bioslurry-recycling"},
      {type="unlock-recipe", recipe="tree-astroponics"},
      {type="unlock-recipe", recipe="ice-melting"}
    },
    prerequisites = {"landfill", "space-science-pack"},
    unit = {
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "biomending",
    icon = "__astroponics__/graphics/technology/biomending.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="pentapod-egg-biomending"},
      {type="unlock-recipe", recipe="biter-egg-biomending"},
    },
    prerequisites = {"biter-egg-handling", "production-science-pack"},
    unit = {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
      },
      time = 60
    }
  }
})

if settings.startup["astroponics-gleba-crops"].value then
  data:extend({
    {
      type = "technology",
      name = "gleba-astroponics",
      icons = {
        {icon="__astroponics__/graphics/technology/astroponics.png", icon_size=256},
        {icon="__space-age__/graphics/technology/yumako.png", icon_size=256, shift={-32, -32}, scale=0.3},
        {icon="__space-age__/graphics/technology/jellynut.png", icon_size=256, shift={32, -32}, scale=0.3}
      },
      effects = {
        {type="unlock-recipe", recipe="yumako-astroponics"},
        {type="unlock-recipe", recipe="jellynut-astroponics"}
      },
      prerequisites = {"advanced-asteroid-processing"},
      unit = {
        count = 2000,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"agricultural-science-pack", 1},
        },
        time = 60
      }
    }
  })
end

if settings.startup["astroponics-crude-oil"].value then
  data:extend({
    {
      type = "technology",
      name = "bioslurry-putrefaction",
      icon = "__astroponics__/graphics/technology/bioslurry-putrefaction.png",
      icon_size = 256,
      effects = {{type="unlock-recipe", recipe="bioslurry-putrefaction"}},
      prerequisites = {"advanced-asteroid-processing"},
      unit = {
        count = 500,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"agricultural-science-pack", 1},
        },
        time = 30
      }
    }
  })
end
