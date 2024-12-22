data:extend({
  {
    type = "corpse",
    name = "space-garden-remnants",
    icon = "__Krastorio2Assets__/buildings/greenhouse/greenhouse.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-g-a",
    selection_box = {{-4, -4}, {4, 4}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2, {
      filename = "__Krastorio2Assets__/remnants/big-random-pipes-remnant/big-random-pipes-remnant.png",
      line_length = 1,
      width = 266,
      height = 196,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(7, 5.5),
      scale = 0.5
    })
  }
})
