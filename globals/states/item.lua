local item = {
  use = false, -- will trigger the panel do not display

  quad = {
    love.graphics.newQuad(0, 0, 76, 76, 228, 76),
    love.graphics.newQuad(76, 0, 76, 76, 228, 76),
    love.graphics.newQuad(152, 0, 76, 76, 228, 76)
  },

  list = {

    -- 1 item_bomb
    {
      name = st_main.item.bomb,
      img = asset.item.bomb or '',
      q_ctl = 1, -- quad control
      x = 0,
      y = 0,
      qtd = 2, -- quantity
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0},
      drop_enemy_i = 0,
      --
      dura = 1,
      dura_ref = 1,
      dura_control = "off"
    },
    --

    -- 2 item_shuri
    {
      name = st_main.item.shuriken,
      img = asset.item.shuriken,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 2,
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0},
      drop_enemy_i = 0
    },
    --

    -- 3 item_sleep
    {
      name = st_main.item.sleep,
      img = asset.item.sleep,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 8,
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0},
      drop_enemy_i = 0
    },
    --

    -- 4 item_gold
    {
      name = st_main.item.gold,
      img = asset.item.gold,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 2,
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0}
    },
    --

    -- 5 item_makibishi
    {
      name = st_main.item.makib,
      img = asset.item.makib,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 2,
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0}
    },
    --

    -- 6 item_smoke
    {
      name = st_main.item.smoke,
      img = asset.item.smoke,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 4,
      use = "off",
      --
      drop = "off",
      drop_p = {x = 0, y = 0},
      dura = 2,
      dura_ref = 2,
      dura_control = "off"
    },
    --

    -- 7 item_armor
    {
      name = st_main.item.armor,
      img = asset.item.armor,
      img_use = asset.item.smoke,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 4,
      use = "off", 
      --
      power = 0, 
      dura = 3
    },
    --

    -- 8 item_poison
    {
      name = st_main.item.poison,
      img = asset.item.poison,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 4,
      use = "off"
    },
    --

    -- 9 item_potion
    {
      name = st_main.item.poti,
      img = asset.item.poti,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 3,
      use = "off"
    },
    --

    -- 10 item_rope
    {
      name = st_main.item.rope,
      img = asset.item.rope,
      q_ctl = 1,
      x = 0,
      y = 0,
      qtd = 4,
      use = "off"
    }
    --

  }
}

return item