/// @description Insert description here
// You can write your code in this editor

// check if there are no enemies left, if there aren't, wait a few seconds before spawning the next wave.
if (global.enemiesLeft == 0 && global.currGameState != gameState.DOWNTIME){
		if (curr_wave < max_waves){
		alarm[0] = wave_delay
		wave_delay_timer = wave_delay

		global.prevgameState = global.currGameState
		global.currGameState = gameState.DOWNTIME
		if (curr_wave != 0){
			with (instance_create_layer(0,0,"Instances", obj_text_slide)){
				text_value = "Wave " + string(other.curr_wave) + " Completed\n" 
				+ string(other.max_waves - other.curr_wave) + " Waves Left"
			}
		}
	} else{
		global.currGameState = gameState.WON	
	}
}

// if there is a wave in progress, spawn enemies accoringly
if (global.currGameState == gameState.RUNNING){
	
	repeat(max(curr_wave div 3 + irandom_range(-1,1),1)){
		
		if ((instance_number(obj_enemy_parent) < max_enemies_spawn(curr_wave)) 
		&& (instance_number(obj_enemy_parent) < global.enemiesLeft) 
		&& wave_progress > 0){
			if (alarm[1] == -1){
				alarm[1] = spawn_delay	
			}
		}
	}
}



wave_delay_timer --;


/*
if (mouse_check_button_pressed(mb_left)){
		scr_create_explosion(mouse_x,mouse_y,200,100,.009)
}
