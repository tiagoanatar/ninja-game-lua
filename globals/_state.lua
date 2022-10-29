-- ///////////////////////////////////////////////////////////////
--// GLOBAL STATE
--///////////////////////////////////////////////////////////////

local item = require 'globals/states/item'
local enemy = require 'globals/states/enemy'
local player = require 'globals/states/player'

state = {
  
  -- save game data
  -----
  save = {},
  
  -- turn
  -----
  turn = {
    current = 'off',
    ttype = { 
      move = "move", item = "item", attack = "attack", enemy = "enemy", 
      skill = "skill", turning_off = "turning_off", off = "off"
    }
  },
          
  -- item
  -----
  item = item,
  
  -- player list
  -----
  player = player,
  
  -- enemy list
  -----
  enemy = enemy,
  
  -- combat
  -----
  combat = {
    screen = "off", -- activate combat screen combate: on, off, end
    enemy_index = 0,
    item_active = "off", -- on, off, end
    enemy_active = "off",
    atack_active = "off",
    ttype = { 
      off = "off", on = "on", tend = 'end'
    }
  },
  
  -- range
  -----
  range = {
    open = {},
    fim = {x =0, y = 0},
    temp = {x =0, y = 0},
    path_final = {},
    range_path_main = range_path_main
  },
  
  -- move
  -----
  move = {
    ref_index = 0,
    rand_h = 0, -- direcao movimento horizontal
    rand_v = 0 ,-- direcao movimento vertical
    rand_path_diago = 0, -- usado no movimento "path_diago" - escolhe sentido no movimento
    auto_move = false
  },
  
  -- cenario
  -----
  cenario = {
    global = {
    -- base
    w, h, size, ttype, music, 

    -- enemy
    ene_qtd, ene_type,

    -- style
    tatame_num, tatame_total, tatame_ref, textura_w, textura_h
    }
  }

}