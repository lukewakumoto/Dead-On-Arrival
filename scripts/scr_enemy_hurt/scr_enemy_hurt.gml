// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_hurt(enemy, damage){
	var _effective_damage = ceil(damage * random_range(1.0, 1.4))
	if (instance_exists(enemy)){
		audio_sound_pitch(enemy.hurt_sound,random_range(0.8,1.2))
		audio_play_sound(enemy.hurt_sound, 1, false);
		enemy.hp -= ceil(_effective_damage);
		var num = instance_create_layer(enemy.x + random_range(-25,25), enemy.y, "UI", obj_damage_number)
		num.damage_number_amount = ceil(_effective_damage)
	}
}