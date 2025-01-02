local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("space-platform-thruster", "astroponics")

if not mods["early-agriculture"] then
  ftech.add_unlock("astroponics", "wood-processing")
  data.raw.technology["tree-seeding"].hidden = true
  data.raw.technology["tree-seeding"].enabled = false
  data.raw.technology["fish-breeding"].prerequisites = {"agricultural-science-pack"}
end
