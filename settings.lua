data:extend({
  {
    type = "bool-setting",
    name = "astroponics-gleba-crops",
    setting_type = "startup",
    default_value = true,
    order = "a"
  },
  {
    type = "bool-setting",
    name = "astroponics-crude-oil",
    setting_type = "startup",
    default_value = true,
    order = "b"
  },
  {
    type = "double-setting",
    name = "astroponics-garden-speed",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.01,
    order = "c"
  }
})

if not mods["early-agriculture"] then
  data:extend({
    {
      type = "bool-setting",
      name = "astroponics-more-wood",
      setting_type = "startup",
      default_value = true,
      order = "A"
    }
  })
end
