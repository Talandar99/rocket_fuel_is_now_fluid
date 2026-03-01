data.extend({
	{
		type = "fluid",
		subgroup = "fluid",
		name = "rocket-fuel",
		default_temperature = 25,
		base_color = { 245, 187, 0 },
		flow_color = { 188, 125, 0 },
		visualization_color = { 225, 167, 0 },
		icon = "__rocket_fuel_is_now_fluid__/light-oil.png",
		order = "a[fluid]-b[oil]-z[rocket-fuel]",
		icon_size = 64,
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		auto_barrel = true,
	},
})

local centrifugepipes = assembler3pipepictures()
centrifugepipes.north = util.empty_sprite()
centrifugepipes.south.filename = "__rocket_fuel_is_now_fluid__/graphics/centrifugepipes/centrifuge-pipe-S.png"
centrifugepipes.east.filename = "__rocket_fuel_is_now_fluid__/graphics/centrifugepipes/centrifuge-pipe-E.png"
centrifugepipes.west.filename = "__rocket_fuel_is_now_fluid__/graphics/centrifugepipes/centrifuge-pipe-W.png"

data.raw["assembling-machine"]["centrifuge"].fluid_boxes = {
	{
		production_type = "input",
		pipe_picture = centrifugepipes,
		pipe_covers = pipecoverspictures(),
		volume = 200,
		pipe_connections = {
			{ flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } },
		},
	},
}
data.raw["assembling-machine"]["centrifuge"].fluid_boxes_off_when_no_fluid_recipe = true

local function convert_ingredient_list(ingredients, fluid_amount)
	if not ingredients then
		return false
	end
	local changed = false
	for _, ing in pairs(ingredients) do
		local itype = ing.type or "item"
		local name = ing.name or ing[1]
		if itype == "item" and name == "rocket-fuel" then
			local amount = ing.amount or ing[2] or 1
			ing[1], ing[2] = nil, nil
			ing.type = "fluid"
			ing.name = "rocket-fuel"
			ing.amount = fluid_amount * amount
			changed = true
		end
	end
	return changed
end

local function convert_result_list(results, fluid_amount)
	if not results then
		return false
	end
	local changed = false
	for _, res in pairs(results) do
		local itype = res.type or "item"
		local name = res.name or res[1]
		if itype == "item" and name == "rocket-fuel" then
			local amount = res.amount or res[2] or 1
			res[1], res[2] = nil, nil
			res.type = "fluid"
			res.name = "rocket-fuel"
			res.amount = fluid_amount * amount
			changed = true
		end
	end
	return changed
end

for _, r in pairs(data.raw.recipe) do
	local changed = convert_ingredient_list(r.ingredients, 100)

	if changed then
		local cat = r.category or "crafting"
		if cat == "crafting" then
			r.category = "crafting-with-fluid"
		end
	end
end

for _, r in pairs(data.raw.recipe) do
	convert_result_list(r.results, 100)
end
