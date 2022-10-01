-- ///////////////////////////////////////////////////////////////
--// VARS
--///////////////////////////////////////////////////////////////

local item_combat_active = false

-- enemy ref holder
local enemy_ref = state.enemy.list

local cont_x
local cont_y 

local temp_index = 1 -- used in items 3 e 4
local emission_rate = 1 -- used in item 6(smoke)

local anim_player_life_ref

-- calc correct margins
local text_margin = 0
local font = love.graphics.getFont()
local text_w = 0 -- get font size

-- ///////////////////////////////////////////////////////////////
--// LOCAL SUPPORT FUNCTIONS
--///////////////////////////////////////////////////////////////

-- factory function
local function tab_add()
  return {x = 0, y = 0, w = 45, h = 45, item = "name"}
end

-- reduce item total usage
local function item_gasto(index)
  state.player.i_max_use = state.player.i_max_use - 1
  state.item.list[index].qtd = state.item.list[index].qtd - 1
end

-- i_box_reset
local function i_box_reset()
  -- igualando a item box com posicao do player
  state.player.i_box.x = state.player.x
  state.player.i_box.y = state.player.y
end

-- ///////////////////////////////////////////////////////////////
--// ITEMS LOAD
--///////////////////////////////////////////////////////////////

-- states of state.item.list[x].use: off, on, using(items like bomb/shuriken), active(items like armor or that stay for some time(animation)) 
-- states of state.item.list[x].drop: off, floor, enemy 

function items_load()

  item_size = {
    w = 76,
    h = 76
  }

end

-- ///////////////////////////////////////////////////////////////
--// ITEMS RESET
--///////////////////////////////////////////////////////////////

function items_reset()
  
  -- igualando a item box com posicao do player
  state.player.i_box.x = state.player.x
  state.player.i_box.y = state.player.y
  
  -- deactivate global item use state
  state.item.use = false
  
  -- resetando itens nao "active"
  for i,v in ipairs(state.item.list) do
    if state.item.list[i].use ~= "active" then  
      state.item.list[i].use = "off" 
    end
  end
  
end

-- ///////////////////////////////////////////////////////////////
--// ITEMS MENU DRAW
--///////////////////////////////////////////////////////////////

function items_draw_menu()  
  for i,v in ipairs(state.item.list) do
    
    -- posicao 
    -----
    -- controle do x
    cont_x = (i - 1) % 5 * 115

    -- atualizando x e y
    state.item.list[i].x = sub_tela_x + cont_x + 50
    state.item.list[i].y = sub_tela_y + 30
        
    -- controle do y
    if i > 5 then state.item.list[i].y = sub_tela_y + 190 end
      
    -- draw img
    -----
    love.graphics.setColor(1, 1, 1, 1) -- normalizador de cor
    if state.item.list[i].qtd == 0 then love.graphics.setColor(1, 1, 1, 0.5) end

    -- print item
    love.graphics.draw(state.item.list[i].img, state.item.quad[state.item.list[i].q_ctl], state.item.list[i].x, state.item.list[i].y, 0, 1, 1)

    -- draw text 
    -----
    love.graphics.setColor(1, 1, 1, 0.4) -- normalizador de cor

    -- get text size
    text_w = font:getWidth(state.item.list[i].name)

    -- calculando a margem correta
    text_margin = (item_size.w - text_w) / 2 

    -- imprime texto
    love.graphics.setFont(asset.fonts.f1)
    love.graphics.print(state.item.list[i].name, state.item.list[i].x + text_margin, state.item.list[i].y + 85, 0, 1, 1)

    -- imprime number
    love.graphics.setColor(1, 1, 1, 1) 
    love.graphics.print(state.item.list[i].qtd, state.item.list[i].x + 34, state.item.list[i].y + 104, 0, 1, 1)

    -- retangulo do numero
    love.graphics.setColor(0.2, 0.2, 0.2, 1)
    love.graphics.rectangle("fill", state.item.list[i].x + 28, state.item.list[i].y + 120, 20, 5)

    -- hover
    -----
    -- checando se mouse bate em item
    if wm.x >= state.item.list[i].x 
    and wm.x < state.item.list[i].x + item_size.w
    and wm.y >= state.item.list[i].y 
    and wm.y < state.item.list[i].y + item_size.h
    and state.item.list[i].qtd > 0 then

      state.item.list[i].q_ctl = 2
      if love.mouse.isDown(1) and state.item.list[i].use == "off" then
          state.item.list[i].use = "on"
          state.item.use = true
      end
      
    else
        state.item.list[i].q_ctl = 1
    end

    -- escurecendo caso o item esteja vazio
    if state.item.list[i].qtd == 0 then
        state.item.list[i].q_ctl = 3
    end
    
  end -- FOR end
end

-- ///////////////////////////////////////////////////////////////
--// ITEMS DRAW USE
--///////////////////////////////////////////////////////////////

function items_draw_use()

  -- 1, 2, 3, 4 e 5 item
  -----
  if temp_index > 0 then
    -- guide box draw
    if state.item.list[temp_index].use == "using" then
      love.graphics.setColor(1, 0.1, 0.1, 0.3)
      love.graphics.rectangle("fill", state.player.i_box.x, state.player.i_box.y, 45, 45)
      -- movimento da item box
      func:mouse_action_box_update(state.player.i_box)
    end
    -- drop floor
    if state.item.list[temp_index].drop == "floor" and temp_index ~= 6 then
      state.item.list[temp_index].drop = "off"
      state.item.list[temp_index].use = "off"
    end
  end -- temp index

  -- 1 item_bomb
  -----
  if state.item.list[1].use == "active" then
    state.item.list[temp_index].drop = "off"
    
    -- active animation
    if state.item.list[temp_index].dura_control == "off" and state.item.list[temp_index].use == "active" then 
      if p_explosion_2.emit < 40 then 
        p_explosion_2.emit = p_explosion_2.emit + 2
      else
        state.item.list[temp_index].dura_control = "on"
      end
    end
    
    -- inactive animation
    if state.item.list[temp_index].dura_control == "on" then 
      p_explosion_2.emit = p_explosion_2.emit - 0.5
      if p_explosion_2.emit == 0 then 
        state.item.list[temp_index].use = "off" 
        state.item.list[temp_index].dura_control = "off"            
      else
      end
    end
    
    love.graphics.setBlendMode("add")
          
    p_explosion_2.p:start()
  for step = 1, 40 do p_explosion_2.p:update(0.0013020569458604) end
    p_explosion_2.p:emit(p_explosion_2.emit)
    particle_draw(p_explosion_2.p, state.item.list[temp_index].drop_p.x+20, state.item.list[temp_index].drop_p.y+20)
          
    p_explosion_1.p:start()
    p_explosion_1.p:emit(119)
    particle_draw(p_explosion_1.p, state.item.list[temp_index].drop_p.x+20, state.item.list[temp_index].drop_p.y+20)

  end

  -- 6 item_smoke
  -----
  if state.item.list[6].use == "active" then
    state.item.list[6].drop = "off"
    if state.item.list[6].dura > 0 then 
      if emission_rate < 233 then emission_rate = emission_rate + 50 end
      p_neblina.p:setEmissionRate(emission_rate) 
    end
    
    particle_draw(p_neblina.p, state.item.list[6].drop_p.x, state.item.list[6].drop_p.y)
  end

  -- 7 item_armor
  -----
  if state.item.list[7].use == "active" then
    if state.item.list[7].dura == 3 then
      love.graphics.setColor(1, 1, 1, 1) -- normalizador de cor
      love.graphics.draw(state.item.list[7].img_use, item.quad[1], camera.x +20 , camera.y + 150, 0, 1, 1)
    elseif state.item.list[7].dura == 2 then  
      love.graphics.draw(state.item.list[7].img_use, item.quad[2], camera.x +20 , camera.y + 150, 0, 1, 1)
    elseif state.item.list[7].dura == 1 then
      love.graphics.draw(state.item.list[7].img_use, item.quad[3], camera.x +20 , camera.y + 150, 0, 1, 1)
    end
  end

  -- itens alimentados na tabela geral
  -----
  love.graphics.setColor(1, 1, 1, 1) -- normalizador de cor
  for y,v in ipairs(grid_global) do
    for x,w in ipairs(grid_global) do
      for p = 1, 5 do
        if grid_global[y][x].item == state.item.list[p].name then
          love.graphics.draw(state.item.list[p].img, item.quad[1], grid_global[y][x].x + 10, grid_global[y][x].y + 10, 0, 0.3, 0.3)
        end
      end
    end
  end

end

-- ///////////////////////////////////////////////////////////////
--// ITEMS USE
--///////////////////////////////////////////////////////////////

function items_use()
  
  -- 1, 2, 3, 4, 5 and 6 - item_bomb, item_gold and makibishi ...etc
  -----
  for x = 1, 6 do
    if state.item.list[x].use == "on" and love.mouse.isDown(1) == false then
      state.item.list[x].use = "using"
      temp_index = x
    end
  end

  -- range item + key press use
  if state.item.list[temp_index].use == "using" and love.mouse.isDown(1) then
    for y,v in ipairs(grid_global) do
      for x,w in ipairs(grid_global[y]) do

        -- item on the floor
        if temp_index == 4 or temp_index == 5 or temp_index == 6 then
          if state.player.i_box.x == grid_global[y][x].x and state.player.i_box.y == grid_global[y][x].y and grid_global[y][x].ttype == "clear" then
            state.item.list[temp_index].drop = "floor"
            grid_global[y][x].ttype = "item"
            grid_global[y][x].item = state.item.list[temp_index].name
            item_gasto(temp_index)
            state.item.list[temp_index].drop_p.x = grid_global[y][x].x
            state.item.list[temp_index].drop_p.y = grid_global[y][x].y
          end
        end
      
        -- item on enemy
        if temp_index == 1 or temp_index == 2 or temp_index == 3 and combate_screen == "off" then
          if state.player.i_box.x == grid_global[y][x].x and state.player.i_box.y == grid_global[y][x].y and grid_global[y][x].ttype == "enemy" then
            
            state.item.list[temp_index].drop = "enemy"  
            state.item.list[temp_index].drop_p.x = grid_global[y][x].x
            state.item.list[temp_index].drop_p.y = grid_global[y][x].y
            item_gasto(temp_index)

            -- guardando informacao do inimigo
            for j,w in ipairs(enemy_ref) do 
              if enemy_ref[j].x == state.item.list[temp_index].drop_p.x and enemy_ref[j].y == state.item.list[temp_index].drop_p.y then
                state.item.list[temp_index].drop_enemy_i = j
              end
            end
            i_box_reset()
            
            -- bomb
            if temp_index == 1 then
              state.item.list[1].use = "active"
              state.item.list[1].dura = state.item.list[1].dura_ref
            end
              
          end
        end
      end 
    end
  end

  -- 6 item_smoke
  -----
  if state.item.list[6].drop == "floor" then

    state.item.list[6].use = "active"
    state.item.list[6].dura = state.item.list[6].dura_ref
    
  end

  -- 7 item_armor
  -----
  if state.item.list[7].use == "on" then
    
    state.item.list[7].power = 1
    state.item.list[7].dura = 3
    state.item.list[7].use = "active"
    
    item_gasto(7)
    state.turn.current = state.turn.ttype.off
    
  end

  -- 9 item_potion
  -----
  if state.item.list[9].use == "on" then
    
    state.item.list[9].use = "using"
    
    -- dano
    state.player.life = state.player.life + 3
    if state.player.life > state.player.life_ref then
      state.player.life = state.player.life_ref
    end
    --
      
    -- life player bar update
    anim_player_life_ref = state.player.life_ref/100 -- valor de refencia de cada porcento do life

    state.player.life_dano_ref = 3/anim_player_life_ref -- quantos porcento cada dano tira do player
    state.player.life_bar_after = math.floor(state.player.life_bar + (0.8 * state.player.life_dano_ref))
    
    state.player.life_bar = state.player.life_bar_after
    
    -- regulando tamanho em caso de a pocao subir demais
    if state.player.life_bar > 80 then state.player.life_bar = 80 end 
    
    item_gasto(9)
    
    state.item.list[9].use = "off"
    state.turn.current = state.turn.ttype.off
    
  end

  -- desativando tela, caso clique fora ou ESC
  if love.mouse.isDown(1) then
    if wm.x < sub_tela_x
    or wm.y < sub_tela_y
    or wm.x > sub_tela_x + asset.ui.sub_screen_01:getWidth()
    or wm.y > sub_tela_y + asset.ui.sub_screen_01:getHeight() then
      state.turn.current = state.turn.ttype.off
    end
  elseif love.keyboard.isDown("escape") then
    state.turn.current = state.turn.ttype.off
  end
    
end

-- ///////////////////////////////////////////////////////////////
--// ITEMS ENEMY EFFECT
--///////////////////////////////////////////////////////////////

function items_enemy_effect()

  -- items 1, 2 e 3
  if state.turn.current ~= state.turn.ttype.enemy then
        
    -- 1 bomb
    if state.item.list[1].drop_enemy_i > 0 then
      item_combat_active = true
      co_en_ref = state.item.list[1].drop_enemy_i -- global var da folha combat.lua
      state.item.list[1].drop_enemy_i = 0
    end
          
    -- 2 shuri
    if state.item.list[2].drop_enemy_i > 0 then
      item_combat_active = true
      co_en_ref = state.item.list[2].drop_enemy_i -- global var da folha combat.lua
      state.item.list[2].drop_enemy_i = 0
    end
        
    -- 3 - sleep
    if state.item.list[3].drop_enemy_i > 0 then
      local index = state.item.list[3].drop_enemy_i
      enemy_ref[index].comp = "sleep"
      enemy_ref[index].change_comp = "off"
      state.item.list[3].drop_enemy_i = 0
    end

  end

  -- items 5 - makibishi
  if state.turn.current == state.turn.ttype.enemy then
    for j,w in ipairs(enemy_ref) do
      for y,v in ipairs(grid_global) do
        for x,w in ipairs(grid_global[y]) do
          if grid_global[y][x].item == state.item.list[5].name then
            if enemy_ref[j].x == grid_global[y][x].x and enemy_ref[j].y == grid_global[y][x].y then
              enemy_ref[j].life = enemy_ref[j].life - 1
              en_stop_call = "on"
              grid_global[y][x].ttype = "clear"
              grid_global[y][x].item = 0
            end
          end
        end
      end
    end
  end

  -- items 6 - smoke
  for j,w in ipairs(enemy_ref) do
    for y,v in ipairs(grid_global) do
      for x,w in ipairs(grid_global[y]) do
        if grid_global[y][x].item == state.item.list[6].name then
          if func:ma_he(enemy_ref[j],grid_global[y][x]) < 315 and move_ref_in == 0 and enemy_ref[j].comp ~= "dead" then
            enemy_ref[j].comp = "confuse"
            enemy_ref[j].alert_anim = 6
          end
        end
      end
    end
  end

  -- incrementando duracao do item 6 - smoke
  if state.turn.current == state.turn.ttype.enemy then
    if state.item.list[6].use == "active" and state.item.list[6].dura_control == "off" and state.item.list[6].dura > 0 then
      state.item.list[6].dura = state.item.list[6].dura - 1
      state.item.list[6].dura_control = "on"
    end
  end

  if state.item.list[6].dura == 0 then 
    emission_rate = emission_rate - 1
    if emission_rate > 0 then
      p_neblina.p:setEmissionRate(emission_rate)                                                              
    end
    if emission_rate <= 20 then 
      state.item.list[6].use = "off" 
      state.item.list[6].dura = state.item.list[6].dura_ref
      if enemy_ref[state.enemy.index_comp].comp == "confuse" then
        enemy_ref[state.enemy.index_comp].comp = state.enemy.comp_random[love.math.random(1, 2)] -- escolha de comportamento
        enemy_ref[state.enemy.index_comp].change_comp = "off" -- interrompendo mudança de comportamento
      end -- global function - enemy_comp_coli 
      for y,v in ipairs(grid_global) do
        for x,w in ipairs(grid_global[y]) do
          if grid_global[y][x].item == state.item.list[6].name then
            grid_global[y][x].item = 0
          end
        end
      end
    end
  end

  if state.turn.current ~= state.turn.ttype.enemy then
    state.item.list[6].dura_control = "off"
  end

end
------------------
-- END - items_enemy_effect()
------------------