local enemy = {
  -- enemy active set
  list = {},
  
  -- ** common use
  
  -- enemy types
  ttype = {
    sword_a = {
      -- default stats
      life = 4, life_ref = 4, atk_power = 3,
    },
  }, 
  
  -- comportment module
  comp_random = {"stop", "path_diago", "sleep"},
  index_comp = 1,
  
  -- counter module
  counter = {},
  
  -- alert states
  alert_p = "off", -- player alert var
  alert_p_first = "off",
  alert_p_time = 0, -- see player or body - active time

  alert_d = "off", -- player destrust var
  alert_d_time = 0, -- suspicious - active time
  
  -- vision
  vision = {
    dead = {x = 0, y = 0},
    item = {x = 0, y = 0},
  }
}

return enemy