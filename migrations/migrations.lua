for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if technologies["astroponics"].researched then
    recipes["ice-melting"].enabled = true
  end
end
