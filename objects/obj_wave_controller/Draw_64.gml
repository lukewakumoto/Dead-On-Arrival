
draw_set_halign(fa_right)
draw_set_font(fnt_health)
draw_set_color(c_white)
draw_text(global.camera_width - 10,10,"Wave: " + string(curr_wave) + "/" + string(max_waves))
draw_text(global.camera_width - 10, 10 + string_height("Test"), "Enemies: " + string(global.enemiesLeft))
draw_text(global.camera_width - 10, 10 + string_height("Test")*2, "Active Enemies: " + string(instance_number(obj_enemy_parent)))
	
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
	
	
if (wave_delay_timer > 0){
	draw_text(global.camera_width/2,global.camera_height/4, "Time Until Next Wave: " + string(wave_delay_timer div room_speed))
}
	