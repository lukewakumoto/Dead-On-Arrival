/// @description Insert description here
// You can write your code in this editor

// make sure enemies are only hit once by any given bullet
if (ds_list_find_index(enemies_hit,other) == -1 and other.hp > 0){
	var _dist = point_distance(start_pos[0], start_pos[1], x, y)
	if (_dist < falloff_start){
		damage = damage_max
	}
	else if (_dist >= falloff_start and _dist < falloff_end){
		var _s = (damage_min - damage_max)/(falloff_end - falloff_start)
		damage = _s * _dist + damage_max - falloff_start * _s
	} 
	else if (_dist >= falloff_end){
		damage = damage_min	
	}
	
	ds_list_add(enemies_hit,other)
	scr_bullet_hit(id,other)
	
	//damage *= 0.95 // decrease damage slightly
	damage = ceil(damage)
	
	if (on_hit != noone){
		on_hit(x, y, id)	
	}
}
