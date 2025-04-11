local frep = require("__fdsl__.lib.recipe")

if mods["bztitanium"] then
  frep.add_ingredient("space-garden", {type="item", name="steel-plate", amount=50})
end
if mods["bztin"] then
  frep.add_ingredient("space-garden", {type="item", name="solder", amount=10})
end
