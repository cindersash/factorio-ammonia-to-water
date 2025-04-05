local added_recipes = {}

local ammonia_to_ice_recipe = {
  type = "recipe",
  name = "aw_ammonia-to-ice",
  icon = "__ammonia-to-water__/graphics/ammonia-to-ice-recipe.png",
  icon_size = 64,
  crafting_machine_tint = {
    primary = { 21, 28, 171 },          -- primary color 1
    secondary = { 255, 255, 255 },         -- primary color 2
    tertiary = { 21, 28, 171, 0.2 },      -- plume edge color
    quaternary = { 255, 255, 255, 0.2 }   -- plume core color
  },
  ingredients = {
    { type = "fluid", name = "ammonia", amount = 50 },
  },
  results = {
    { type = "item", name = "ice", amount = 5 },
  },
  category = "chemistry-or-cryogenics",
  enabled = false,
  allow_productivity = true,
  subgroup = "fluid-recipes",
  energy_required = 1,
  allow_decomposition = false
}

data:extend { ammonia_to_ice_recipe }
