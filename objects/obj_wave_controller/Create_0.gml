
enemies_per_wave_func = function(wave_num){
	return ceil(power(wave_num,2.2) + wave_num*random_range(5,8) + random_range(5,10))
}


max_enemies_spawn = function(wave_num){
	return ceil(enemies_per_wave_func(wave_num)/2)
}

wave_progress = 9
max_waves = 10
curr_wave = 9
wave_delay = 5 * room_speed
spawn_delay = .45 * room_speed
wave_delay_timer = wave_delay






// Create 
