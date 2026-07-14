local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

ftech.add_prereq("space-platform-thruster", "astroponics")
ftech.remove_unlock("space-platform-thruster", "ice-melting")

if not mods["early-agriculture"] then
  ftech.add_unlock("astroponics", "tree-seed")
  ftech.remove_unlock("tree-seeding", "tree-seed")
  ftech.add_effect("tree-seeding", {type="change-recipe-productivity", recipe="tree-seed", change=0.5})
end
