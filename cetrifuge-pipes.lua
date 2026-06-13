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
	{
		production_type = "output",
		pipe_picture = centrifugepipes,
		pipe_covers = pipecoverspictures(),
		volume = 200,
		pipe_connections = {
			{ flow_direction = "output", direction = defines.direction.north, position = { 0, 1 } },
		},
	},
}
data.raw["assembling-machine"]["centrifuge"].fluid_boxes_off_when_no_fluid_recipe = true
