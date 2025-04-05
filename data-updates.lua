local function allow_recipe_productivity(recipe_name)
	for _, module in pairs(data.raw.module) do
		if module.category == "productivity" and module.limitation then
			table.insert(module.limitation, recipe_name)
		end
	end
end

allow_recipe_productivity("aw_ammonia-to-ice")
