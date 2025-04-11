local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

ftech.add_prereq("space-platform-thruster", "astroponics")
ftech.remove_unlock("space-platform-thruster", "ice-melting")

if not mods["early-agriculture"] then
  ftech.add_unlock("astroponics", "wood-processing")
  data.raw.technology["tree-seeding"].hidden = true
  data.raw.technology["tree-seeding"].enabled = false
  data.raw.technology["fish-breeding"].prerequisites = {"agricultural-science-pack"}
end

if mods["wood-industry"] then
  ftech.add_prereq("astroponics", "kiln-smelting-2")
end
