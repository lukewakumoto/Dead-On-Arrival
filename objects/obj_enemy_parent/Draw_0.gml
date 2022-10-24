/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(fnt_weapon)
draw_set_color(c_white)
scr_draw_enemy_healthbar(x, y + sprite_height, sprite_width, 10, max_hp, hp)
/*draw_healthbar(x - sprite_width - 25, y + sprite_height,
				x + sprite_width + 25, y + sprite_height + 20, (hp/max_hp)*100,c_black,c_red,c_lime,0,true,true  )