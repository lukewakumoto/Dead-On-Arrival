/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_damage)
var fnt_scale = is_critical_hit ? 2 : 1
draw_text_transformed_color(x, y, damage_number_amount,fnt_scale, fnt_scale, direction, c_red, c_red, c_red, c_red, starting_alpha)





