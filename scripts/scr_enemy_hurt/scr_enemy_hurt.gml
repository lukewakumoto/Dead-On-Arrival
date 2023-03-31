// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_hurt(enemy, damage, by_explosion=false){
	var _crit_chance = 1
	var _crit_hit = false
	var _random_damage_mod =  random_range(1.0, 1.4)
	var _effective_damage = round(damage * _random_damage_mod)
	if (random(100) < _crit_chance){
		_effective_damage *= 2	
		_crit_hit = true
	}
	if (instance_exists(enemy)){
		audio_sound_pitch(enemy.hurt_sound,random_range(0.8,1.2))
		audio_play_sound(enemy.hurt_sound, 1, false);
		enemy.hp -= round(_effective_damage);
		var num = instance_create_layer(enemy.x + random_range(-25,25), enemy.y, "UI", obj_damage_number)
		num.damage_number_amount = round(_effective_damage)
		num.image_xscale += _crit_hit
		num.image_xscale += _random_damage_mod - 1
		num.image_yscale = num.image_xscale
		
		if (enemy.hp <= 0){
			with (enemy){
				scr_enemy_die(x, y, id, by_explosion, coin_type, die_func)	
			}
		}
		
	}
	global.total_damage += _effective_damage
	global.running_damage += _effective_damage
	if (global.dps_timer == 0){
		global.dps_timer = current_time
	}
	
}