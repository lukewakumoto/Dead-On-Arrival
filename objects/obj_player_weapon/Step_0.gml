/// @description Allow the player to fire and reload their weapons

// correctly position the firearm
if (global.currGameState != gameState.PAUSED){


if (owner != noone){
	
	if (right_side){
		offset = 15
	}
	else{
		offset = -15	
	}
	

	
	
	x = owner.x + lengthdir_x(offset,owner.direction - 90) + lengthdir_x(weapon_offset,owner.direction)
	y = owner.y + lengthdir_y(offset,owner.direction - 90) + lengthdir_y(weapon_offset,owner.direction)
	direction = owner.direction
	image_angle = direction



}

if (keyboard_check_pressed(ord("C"))){
	if (!is_undefined(alternate_id)){
		scr_toggle_alt(alternate_id)
	}
}


// allow the player to fire if they click and they have ammunition
#region // firing\

if ((fire_type == fireType.FULLAUTO) && ammunition[weapon_id][0] != 0){
	var fire = mouse_check_button(mb_left)
}
else if (fire_type == fireType.CHARGE){
	var fire = mouse_check_button(mb_left)
}
else{
	var fire = mouse_check_button_pressed(mb_left)	
}

// if the barrel is sticking into the wall, the player cannot fire

if (collision_line(x + lengthdir_x(sprite_width,direction)/2,y + lengthdir_y(sprite_width,direction)/2,
		x + lengthdir_x(sprite_width,direction),
		y + lengthdir_y(sprite_width,direction),obj_obstacle,false,true)){
		gun_obstructed = true
}
else{
	gun_obstructed = false	
}
		
#region // functionality for burst fire
if (fire && canShoot) { // make it impossible to fire while already bursting
	if (fire_type == fireType.BURST){
		if (bursting == false){
			bursting = true
			curr_burst = 3
		}
		else{
			fire = false	
		}
	}
}

firing = fire
#endregion
#region // functionality for charge weapons
var _charge_rate = 2
if(fire_type == fireType.CHARGE){
	
	image_speed = lerp(curr_charge, max_charge, curr_charge/max_charge)
	
	if (curr_charge != 0 and !audio_is_playing(so_minigun_charge)){
		audio_play_sound(so_minigun_charge_2, 0, false, 1, 0.4, lerp(0.4, 1, curr_charge/max_charge))
	}
	if (curr_charge == 0){
		audio_stop_sound(so_minigun_charge_2)
	}
		
	if (firing && !reloading){
		curr_charge += _charge_rate
	}
	
	
	
	if (curr_charge < max_charge){
		fire = false
	}
}


if (!firing || reloading){
	curr_charge -= _charge_rate
}

curr_charge = clamp(curr_charge, 0, max_charge)

#endregion 

if (fire && ammunition[weapon_id][0] <= 0 && canShoot && fire_type != fireType.CHARGE){
	audio_play_sound(so_dry_fire,1,false)	
}

is_firing = false
is_empty = ammunition[weapon_id][0] <= 0

if (((fire && !is_empty && canShoot)
	|| (canShoot && bursting && curr_burst > 0 && !is_empty > 0))
	&& !gun_obstructed){
		
	is_firing = true
	image_speed = 1
	if (weapon_type != weaponType.MELEE){
		sprite_set_speed(sprite_index, (sprite_get_number(sprite_index))/fire_delay, spritespeed_framespersecond);
	}
	if (reloading){
		reloading = false // firing cancels the reload
		image_index = 0
		image_speed = 0
	} else{
		
		if (bursting){ 
			curr_burst --	
		} 
		canShoot = false
		if (bursting && curr_burst > 0){ // if burst fire, the delay will be shorter between shots
			alarm[0] = 0.1 * room_speed
		}
		else{
			alarm[0] = fire_delay * room_speed
		}
		audio_play_sound(weapon_sound,1,false)

		var _times_to_repeat = is_undefined(bullets_per_shot) ? 1 : bullets_per_shot
	
	
		repeat(min(_times_to_repeat, ammunition[weapon_id][0])){
			if (fire_type == fireType.BOLT){
				src = time_source_create(time_source_game, 0.5, time_source_units_seconds, scr_create_casing, [id], 1)
				time_source_start(src)
			} else if (fire_type != fireType.SINGLESHOT){
				scr_create_casing(id)
			}
			scr_fire_weapon(x, y,direction)	
			
			ammunition[weapon_id][0] -- // remove ammo from magazine
		}
		
		
		//scr_fire_weapon(x,y,direction)
		
		
		// shake the camera a bit
		var _amount_to_shake = caliber_damage/5
		_amount_to_shake = clamp(_amount_to_shake, 1.5, 7)
		global.camera_shake = _amount_to_shake
	}
	
	
}

if (curr_burst <= 0 || is_empty){
	bursting = false	
}


#endregion




// allow the player to reload
#region // reloading
var reload = keyboard_check_pressed(ord("R"))
if (fire && (ammunition[weapon_id][0] == 0)){
	reload = true	
}
var _reload_max_capacity = fire_type == fireType.SINGLESHOT ? 1 : magazine_capacity + 1
if (reload && !reloading && ammunition[weapon_id][0] < _reload_max_capacity && ammunition[weapon_id][1] > 0 && canShoot){
	reloading = true
	image_index = 0
	
	if (weapon_reload_sound != undefined){
		audio_play_sound(weapon_reload_sound,1,false)
	}
	
		
	if (fire_type == fireType.SINGLESHOT){
		src = time_source_create(time_source_game, 0.5, time_source_units_seconds, scr_create_casing, [id], 1)
		time_source_start(src)	
	}
	
	scr_create_reload_wheel(mouse_x,mouse_y)

	if (reload_type == 0){
		alarm[1] = reload_time * room_speed
	}
	else{
		alarm[2] = reload_time * room_speed
	}
	
}
#endregion

// allow the player to flip gun sides
var flip_gun = keyboard_check_pressed(ord("T"))
if (flip_gun){
	right_side = !right_side	
}
}
/*
if (keyboard_check_pressed(ord("O"))){
	for (var
}


