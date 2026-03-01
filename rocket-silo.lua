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
--add fluid_boxes to regular silo
local silo = data.raw["rocket-silo"]["rocket-silo"]

if silo then
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
end
