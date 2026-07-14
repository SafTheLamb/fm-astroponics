local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local surface_conditions = mods["planet-muluna"] and {
	{property="pressure", min=0, max=100},
	{property="magnetic-field", min=0, max=1}, -- muluna but not cerys (lunaponics is totally different)
} or {{property="pressure", min=0, max=0}}

local function assemblerpipepicturesfrozen()
  return mods["space-age"] and {
    north = util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-N-frozen", {
      priority = "extra-high",
      scale = 0.5
    }),
    east = util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-E-frozen", {
      priority = "extra-high",
      scale = 0.5
    }),
    south = util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-S-frozen", {
      priority = "extra-high",
      scale = 0.5
    }),
    west = util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-W-frozen", {
      priority = "extra-high",
      scale = 0.5
    }),
  } or nil
end

data:extend({
	{
		type = "assembling-machine",
		name = "space-garden",
		icon = "__astroponics__/graphics/icons/space-garden.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 0.2, result = "space-garden"},
		max_health = 450,
		corpse = "space-garden-remnants",
		-- dying_explosion = "lab-explosion",
		collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		surface_conditions = surface_conditions,
		crafting_categories = {"astroponics"},
		crafting_speed = settings.startup["astroponics-garden-speed"].value,
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			drain = "1kW",
		},
		energy_usage = "450kW",
		heating_energy = "200kW",
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler3pipepictures,
				pipe_picture_frozen = assemblerpipepicturesfrozen(),
				frozen_patch = mods["space-age"] and util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-3-frozen", {
					priority = "high",
					scale = 0.5
				}) or nil,
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {{flow_direction="input", direction=defines.direction.north, position={0, -3}}}
			},
			{
				production_type = "output",
				pipe_picture = require("__base__.prototypes.entity.assembler-pictures").assembler3pipepictures,
				pipe_picture_frozen = assemblerpipepicturesfrozen(),
				frozen_patch = mods["space-age"] and util.sprite_load("__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-3-frozen", {
					priority = "high",
					scale = 0.5
				}) or nil,
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections = {{flow_direction="output", direction=defines.direction.south, position={0, 3}}}
			}
		},
		damaged_trigger_effect = hit_effects.entity(),
		module_slots = 3,
		allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__astroponics__/graphics/entity/space-garden/space-garden.png",
						priority = "high",
						width = 512,
						height = 512,
						frame_count = 1,
						scale = 0.5,
					},
					{
						filename = "__astroponics__/graphics/entity/space-garden/space-garden-shadow.png",
						priority = "high",
						width = 512,
						height = 512,
						shift = {0.32, 0},
						frame_count = 1,
						draw_as_shadow = true,
						scale = 0.5,
					},
				}
			},
			working_visualisations = {
				{
					fadeout = true,
					animation = {
						filename = "__astroponics__/graphics/entity/space-garden/space-garden-working.png",
						width = 512,
						height = 512,
						frame_count = 10,
						line_length = 5,
						scale = 0.5,
						animation_speed = 0.35,
					}
				},
				{
					fadeout = true,
					animation = {
						filename = "__astroponics__/graphics/entity/space-garden/space-garden-light.png",
						draw_as_light = true,
						width = 512,
						height = 512,
						frame_count = 1,
						repeat_count = 10,
						scale = 0.5,
						animation_speed = 0.35
					}
				}
			},
			frozen_patch = {
				filename = "__astroponics__/graphics/entity/space-garden/space-garden-frozen.png",
				width = 194,
				height = 174,
				scale = 13/12
			},
		},
		working_sound = {
			sound = {
				filename = "__astroponics__/sound/space-garden.ogg",
				volume = 0.3
			},
			audible_distance_modifier = 1,
			fade_in_ticks = 12,
			fade_out_ticks = 30
		},
		circuit_connector = circuit_connector_definitions.create_vector(
			universal_connector_template,
			{
				{ variation = 19, main_offset = util.by_pixel( 58.75,  58.625), shadow_offset = util.by_pixel( 58.75,  58.625), show_shadow = false },
				{ variation = 19, main_offset = util.by_pixel( 58.75,  58.625), shadow_offset = util.by_pixel( 58.75,  58.625), show_shadow = false },
				{ variation = 19, main_offset = util.by_pixel( 58.75,  58.625), shadow_offset = util.by_pixel( 58.75,  58.625), show_shadow = false },
				{ variation = 19, main_offset = util.by_pixel( 58.75,  58.625), shadow_offset = util.by_pixel( 58.75,  58.625), show_shadow = false },
			}
		),
		circuit_wire_max_distance = 9,
		vehicle_impact_sound = sounds.generic_impact,
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close
	}
})
