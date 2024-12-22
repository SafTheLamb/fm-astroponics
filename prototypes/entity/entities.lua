local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "assembling-machine",
    name = "space-garden",
    icon = "__Krastorio2Assets__/icons/entities/greenhouse.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "space-garden"},
    max_health = 450,
    corpse = "space-garden-remnants",
    -- dying_explosion = "lab-explosion",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    surface_conditions = {{property="gravity", min=0, max=0}},
    crafting_categories = {"astroponics"},
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW",
    },
    energy_usage = "450kW",
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{flow_direction="input", direction=defines.direction.north, position={0, -3}}}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
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
            filename = "__Krastorio2Assets__/buildings/greenhouse/greenhouse.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 1,
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/greenhouse/greenhouse-sh.png",
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
            filename = "__Krastorio2Assets__/buildings/greenhouse/greenhouse-light.png",
            draw_as_light = true,
            width = 512,
            height = 512,
            frame_count = 1,
            repeat_count = 10,
            scale = 0.5,
            animation_speed = 0.35
          }
        },
        {
          fadeout = true,
          animation = {
            filename = "__Krastorio2Assets__/buildings/greenhouse/greenhouse-working.png",
            width = 512,
            height = 512,
            frame_count = 10,
            line_length = 5,
            scale = 0.5,
            animation_speed = 0.35,
          }
        }
      },
    },
    working_sound = {
      sound = {
        filename = "__wood-universe-assets__/sound/space-garden.ogg",
        volume = 0.3
      },
      audible_distance_modifier = 1,
      fade_in_ticks = 12,
      fade_out_ticks = 30
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    crafting_speed = 1
  }
})
