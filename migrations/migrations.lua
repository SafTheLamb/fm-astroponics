for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["ice-melting"].enabled = technologies["astroponics"].researched
end
