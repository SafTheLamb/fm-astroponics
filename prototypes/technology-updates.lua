local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

ftech.add_prereq("space-platform-thruster", "astroponics")
ftech.remove_unlock("space-platform-thruster", "ice-melting")

if not mods["early-agriculture"] then
  ftech.add_unlock("astroponics", "wood-processing")
  ftech.remove_unlock("tree-seeding", "wood-processing")
  ftech.add_effect("tree-seeding", {type="change-recipe-productivity", recipe="wood-processing", change=0.5})
end
