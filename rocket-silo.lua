function rocketsilopipes()
	return {
		north = {

			filename = "__rocket_fuel_is_now_fluid__/graphics/rocketsilopipes/rocketsilopipe-NN.png",
			priority = "extra-high",
			width = 71,
			--height = 38,
			height = 76,
			--shift = util.by_pixel(2.25, 13.5),
			shift = util.by_pixel(2.25, 23),
			scale = 0.5,
		},
		east = {
			filename = "__rocket_fuel_is_now_fluid__/graphics/rocketsilopipes/rocketsilopipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__rocket_fuel_is_now_fluid__/graphics/rocketsilopipes/rocketsilopipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__rocket_fuel_is_now_fluid__/graphics/rocketsilopipes/rocketsilopipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

local function has_fluid_boxes(entity)
	return entity.fluid_boxes and next(entity.fluid_boxes) ~= nil
end

local vanilla = data.raw["rocket-silo"] and data.raw["rocket-silo"]["rocket-silo"]
if not vanilla then
	return
end

local target_box = vanilla.collision_box

local function has_fluid_energy_source(entity)
	return entity.energy_source and entity.energy_source.type == "fluid" and entity.energy_source.fluid_box
end

for name, silo in pairs(data.raw["rocket-silo"]) do
	if
		silo
		and not has_fluid_boxes(silo)
		and not has_fluid_energy_source(silo)
		and silo.collision_box
		and silo.collision_box[1]
		and silo.collision_box[2]
		and silo.collision_box[1][1] == target_box[1][1]
		and silo.collision_box[1][2] == target_box[1][2]
		and silo.collision_box[2][1] == target_box[2][1]
		and silo.collision_box[2][2] == target_box[2][2]
	then
		silo.fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = rocketsilopipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "input-output", direction = defines.direction.north, position = { 0, -4 } },
					{ flow_direction = "input-output", direction = defines.direction.south, position = { 0, 4 } },
					{ flow_direction = "input-output", direction = defines.direction.east, position = { 4, 0 } },
					{ flow_direction = "input-output", direction = defines.direction.west, position = { -4, 0 } },
				},
			},
		}

		silo.fluid_boxes_off_when_no_fluid_recipe = true

		-- log("Added fluid input to rocket-silo: " .. name)
	end
end
