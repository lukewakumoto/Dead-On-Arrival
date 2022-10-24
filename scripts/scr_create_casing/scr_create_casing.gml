// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_casing(_weapon){
	if (_weapon.casing_sprite != 0){
		
	
		var new_casing = instance_create_layer(_weapon.x + lengthdir_x(sprite_get_width(_weapon.weapon_sprite)/2,_weapon.direction),_weapon.y + lengthdir_y(sprite_get_width(_weapon.weapon_sprite)/2,_weapon.direction),"Instances", obj_casing)
		new_casing.sprite_index = _weapon.casing_sprite
		new_casing.image_angle = _weapon.direction
		new_casing.max_height = 100 + irandom_range(-25,25)
		new_casing.height = new_casing.max_height
		new_casing.rotational_velocity = irandom_range(-17,17)
		new_casing.casing_vel = [cos((_weapon.direction - 90  + irandom_range(-15,15)) * pi/180), sin((_weapon.direction - 90 + irandom_range(-15,15)) * pi/180)]
		new_casing.part_effect = _weapon.casings_particles[_weapon.caliber_index]
		
	
	}
	

}