data:extend({
  {
    type = "technology",
    name = "astroponics",
    icon = "__Krastorio2Assets__/technologies/greenhouse.png",
    icon_size = 256,
    effects =
    {
      {type="unlock-recipe", recipe="space-garden"},
      {type="unlock-recipe", recipe="liquid-fertilizer"},
      {type="unlock-recipe", recipe="bioslurry-recycling"},
      {type="unlock-recipe", recipe="tree-astroponics"}
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
  }
})
