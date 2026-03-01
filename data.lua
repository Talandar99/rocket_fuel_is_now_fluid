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
