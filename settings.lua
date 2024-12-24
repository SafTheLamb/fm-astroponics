data:extend({
  -- allow growing gleba crops in space
  {
    type = "bool-setting",
    name = "astroponics-gleba-crops",
    setting_type = "startup",
    default_value = true,
    order = "a"
  },
  -- turn excess bioslurry into crude oil
  {
    type = "bool-setting",
    name = "astroponics-crude-oil",
    setting_type = "startup",
    default_value = true,
    order = "b"
  }
})
