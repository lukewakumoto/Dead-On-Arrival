/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

max_hp = 50
hp = max_hp

corpse_sprite = spr_enemy_spitter_corpse_alt
attack_animation = spr_enemy_spitter_attack_alt
idle_sprite = spr_enemy_spitter_alt

alert_dist = 5000
attack_dis = 250
attack_delay = .5


attack_func = scr_enemy_attack()
damage = 45
move_spd = random_range(4.5,5)
value = 14
coin_type = 1
