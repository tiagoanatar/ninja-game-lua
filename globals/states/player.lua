local player = {
  -- when you have multiple, use this istead
  list = {},
  
  -- ** single player
  
  -- base
  x = 45, y = 45, w = 45, h = 45, at_x = 1, at_y = 1, at_w = 45, at_h = 45, scaX = 1, atNumb = 1, 

  -- ficha
  life = 6, life_ref = 6, life_dano_ref = 0, life_bar = 80, life_bar_after = 80, atk_power = 1,

  -- max actions (X_max = move range, X_max_use = use quantity)
  m_max = 15, m_max_new = 15, -- move
  a_max = 1, a_max_new = 1, a_max_use = 1, a_max_use_new = 1, -- attack
  i_max = 3, i_max_new = 3, i_max_use = 5, i_max_use_new = 5, -- item

  -- alert box draw
  comp_alert = 1,
  
  -- ** common use
  
  -- range
  range_open_index = 0,
  m_box = {x = 0, y = 0, w = 45, h = 45}, -- posicao final do uso do move box
  trigger_auto_move = false,

  -- atk box
  a_box = {x = 0, y = 0, w = 45, h = 45}, -- posicao final do uso do ataque box
  atk_click = "off", -- cotrole de 1 click da caixa de ataque

  -- item box
  i_box = {x = 0, y = 0}, -- posicao final do uso de item
  item_click = "off", -- para os cliques multiplos dos items
  
}

return player