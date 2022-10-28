/// @description Draw the weapon and crosshair and laser
if (!reloading){
	sprite_index = weapon_sprite
} 
else{ // if the player is reloading, play the reloading animation
	if (weapon_reload != undefined){
		image_speed = 1
		sprite_index = weapon_reload
		sprite_set_speed(weapon_reload, (sprite_get_number(weapon_reload))/reload_time, spritespeed_framespersecond);
	}
}


draw_set_alpha(0.95)
if (weapon_type != weaponType.MELEE){
	scr_draw_laser(x + lengthdir_x(sprite_width/2,image_angle) ,y + lengthdir_y(sprite_width/2,image_angle)
				,image_angle,5000,c_yellow)
}

draw_set_alpha(1.0)





// Draw crosshair
if (!reloading){
	//cursor_sprite = curr_crosshair	
	
	var crosshair = noone
	
	if (ammunition[weapon_id][0] > 0){
		crosshair = spr_crosshair	
	} else{
		crosshair = spr_out_of_ammo	
	}
	
	draw_sprite(crosshair,0,mouse_x + lengthdir_x(offset,owner.direction - 90), mouse_y + lengthdir_y(offset,owner.direction - 90))
	if (instance_exists(obj_reload_wheel)){
		instance_destroy(obj_reload_wheel)	
	}
	if (keyboard_check(vk_shift)){
		draw_text(x,y,point_distance(x,y, mouse_x, mouse_y))	
		
		var _dmg_fall_start = is_undefined(caliber_falloff_start) ? 0 : caliber_falloff_start
		var _dmg_fall_end = is_undefined(caliber_falloff_end) ? 0 : caliber_falloff_end
		
		draw_circle(x + lengthdir_x(_dmg_fall_start, image_angle), y + lengthdir_y(_dmg_fall_start, image_angle), 10, false)
		draw_circle(x + lengthdir_x(_dmg_fall_end, image_angle), y + lengthdir_y(_dmg_fall_end, image_angle), 10, false)
	
		if (instance_exists(obj_enemy_parent)){
			draw_line(x, y, obj_enemy_parent.x, obj_enemy_parent.y)
		}
		
	}
}


//draw_line(x,y,x + lengthdir_x(500,image_angle),y + lengthdir_y(500,image_angle))
if (gun_obstructed){
	image_blend = c_red
}	else{
	image_blend = c_white	
}
draw_self()
