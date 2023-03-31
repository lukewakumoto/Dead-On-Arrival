// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart(){
	show_debug_message("=====================---------------------==============================BIIIIIIIIIIIIIIIIIIIIIIIIIIIIITCHFUCK")	
	
	part_system_destroy(global.particle_system)
	part_system_destroy(global.explosion_system)
	part_system_destroy(global.blood_particle)
	part_system_destroy(global.smear_particle)

	part_type_destroy(global.explosion_center_part)
	part_type_destroy(global.explosion_particle_part)
	part_type_destroy(global.smoke_particle_part)
	
	with (obj_player_weapon){
	
	for (var i = 0; i < global.num_weapons; i ++){
		ds_list_destroy(weapons[i])
	}

	for (var i = 0; i < global.num_calibers; i ++){
		ds_list_destroy(calibers[i])
	}


	
		}
	
	
	game_restart()
}