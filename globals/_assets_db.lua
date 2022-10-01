-- ///////////////////////////////////////////////////////////////
--// FONTS, IMAGES AND MUSIC
--///////////////////////////////////////////////////////////////

  
  asset = {
    
    player = {
      main = love.graphics.newImage("assets/imgs/play_main-02.png"),
      alert_icon = love.graphics.newImage("assets/imgs/enem/alert.png"),
    },
    
    enemy = {
      ttype = {
        sword_a = {
          sprite = love.graphics.newImage("assets/imgs/enem/enen_01.png"),
          profile = love.graphics.newImage("assets/imgs/enem/enen_01/ene_01_foto.png"),
        },
      },
      alert = love.graphics.newImage("assets/imgs/enem/alert.png"),
    },
    
    fonts = {
      f1 = love.graphics.newFont("assets/fonts/Roboto-Regular.ttf", 12),
      f2 = love.graphics.newFont("assets/fonts/Roboto-Regular.ttf", 39),
      f3 = love.graphics.newFont("assets/fonts/Roboto-Regular.ttf", 12),
      f4 = love.graphics.newFont("assets/fonts/Roboto-Regular.ttf", 18),
    },
    
    music = {
      bgm1 = love.audio.newSource("assets/music/teste_01.mp3", "stream") -- "stream" para musica e "static" para som
    },
    
    ui = {
      enemy_count = love.graphics.newImage("assets/imgs/enem/ene_contagem_01.png"), -- enemy count
      mouse_cursor = love.graphics.newImage("assets/imgs/cur_ninja.png"),
      combat_bk = love.graphics.newImage("assets/imgs/combate/combat_bk.png"),
      topbar = love.graphics.newImage("assets/imgs/telas/top_bar.png"),
      sub_screen_01 = love.graphics.newImage("assets/imgs/telas/sub_tela_01.png"),
      toplife_bar = love.graphics.newImage("assets/imgs/telas/top_lifebar.png"),
      
      turn = {
        bt = love.graphics.newImage("assets/imgs/telas/bt_turn_sprite.png"),
        bt_attack = love.graphics.newImage("assets/imgs/telas/bts_baixo_a_atk_sprite.png"),
        bt_move = love.graphics.newImage("assets/imgs/telas/bts_baixo_b_mov_sprite.png"),
        bt_item = love.graphics.newImage("assets/imgs/telas/bts_baixo_c_item_sprite.png"),
        bt_skil = love.graphics.newImage("assets/imgs/telas/bts_baixo_d_tech_sprite.png")
      }
      
    },
    
    particles = {
      fog = love.graphics.newImage("assets/imgs/particles/cloud.png"),
      
      explosion_1a = love.graphics.newImage("assets/imgs/particles/lightDot.png"),
      explosion_1b = love.graphics.newImage("assets/imgs/particles/light.png"),
      
      sword_1a = love.graphics.newImage("assets/imgs/particles/atack-01.png"),
      sword_1b = love.graphics.newImage("assets/imgs/particles/lightDot.png"),
      
      alert_player = love.graphics.newImage("assets/imgs/particles/enemy-alert.png"),
      alert_desconf = love.graphics.newImage("assets/imgs/particles/enemy-desconf.png"),
      alert_dead = love.graphics.newImage("assets/imgs/particles/enemy-dead.png"),
      alert_spleep = love.graphics.newImage("assets/imgs/particles/enemy-spleep.png"),
      alert_base = love.graphics.newImage("assets/imgs/particles/enemy-alert-black.png"),
    },

    item = {
      bomb = love.graphics.newImage("assets/imgs/item/item_bomb.png"),
      shuriken = love.graphics.newImage("assets/imgs/item/item_shuri.png"),
      sleep = love.graphics.newImage("assets/imgs/item/item_sleep.png"),
      gold = love.graphics.newImage("assets/imgs/item/item_gold.png"),
      makib = love.graphics.newImage("assets/imgs/item/item_makibishi.png"),
      smoke = love.graphics.newImage("assets/imgs/item/item_smoke.png"),
      armor = love.graphics.newImage("assets/imgs/item/item_armor.png"),
      poison = love.graphics.newImage("assets/imgs/item/item_poison.png"),
      poti = love.graphics.newImage("assets/imgs/item/item_potion.png"),
      rope = love.graphics.newImage("assets/imgs/item/item_rope.png"),
    },
    
  }
  
