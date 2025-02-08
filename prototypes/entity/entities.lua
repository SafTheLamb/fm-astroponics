local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local function assemblerpipepicturesfrozen()
  return {
    north = {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-N-frozen.png",
      priority = "extra-high",
      width = 71,
      height = 38,
      shift = util.by_pixel(2.25, 13.5),
      scale = 0.5
    },
    east = {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-E-frozen.png",
      priority = "extra-high",
      width = 42,
      height = 76,
      shift = util.by_pixel(-24.5, 1),
      scale = 0.5
    },
    south = {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-S-frozen.png",
      priority = "extra-high",
      width = 88,
      height = 61,
      shift = util.by_pixel(0, -31.25),
      scale = 0.5
    },
    west = {
      filename = "__space-age__/graphics/entity/frozen/assembling-machine/assembling-machine-pipe-W-frozen.png",
      priority = "extra-high",
      width = 39,
      height = 73,
      shift = util.by_pixel(25.75, 1.25),
      scale = 0.5
    }
  }
end

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
    surface_conditions = mods["planet-muluna"] and {
      {property="pressure", min=0, max=100},
      {property="magnetic-field", min=0, max=1}, -- muluna but not cerys (lunaponics is totally different)
    } or {{property="pressure", min=0, max=0}},
    crafting_categories = {"astroponics"},
    crafting_speed = 1,
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
        pipe_picture = assembler3pipepictures(),
        pipe_picture_frozen = assemblerpipepicturesfrozen(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{flow_direction="input", direction=defines.direction.north, position={0, -3}}}
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_picture_frozen = assemblerpipepicturesfrozen(),
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
      frozen_patch = {
        filename = "__wood-universe-assets__/graphics/entity/space-garden/space-garden-frozen.png",
        width = 194,
        height = 174,
        scale = 13/12
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
    close_sound = sounds.machine_close
  }
})
