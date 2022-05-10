/// @description Create important objects
gpu_set_tex_filter(true)
randomize()
enum gameState {
	PAUSED,
	RUNNING,
	DOWNTIME,
	WON
}

audio_play_sound(so_ambience,1,true)

global.currGameState = gameState.RUNNING
global.prevGameState = noone
global.playerMoney = 0
global.displayed_money = 0
global.moneyToAdd = 0
global.moneyToAddTimer = 0;
global.playerIsDead = false
global.totalKills = 0
global.enemiesLeft = 0

favWeaponStruct = function(favoriteName, favoriteIcon,favoriteKills) constructor
{
	name = favoriteName
	icon = favoriteIcon
	kills = favoriteKills
}


global.favoriteWeapon = new favWeaponStruct(
		"",
		spr_weapon_assault_ak15_colored,
		weapon.HI_POINT)	



#region // deathText
display_dead_text = false // wether to display the death message or not
dead_text_size = 10
death_text = ""
#endregion

win_text_size = 10
win_text = "Congratulations, You Won!"

show_debug_message("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
money_increment = 10

enemies_per_wave_func = function(wave_num){
	return ceil(power(wave_num,2.2) + wave_num*random_range(5,8) + random_range(5,10))
}


max_enemies_spawn = function(wave_num){
	return ceil(enemies_per_wave_func(wave_num)/2)
}
wave_progress = 0

max_waves = 10






curr_wave = 0
wave_delay = 5 * room_speed
spawn_delay = .65 * room_speed
wave_delay_timer = wave_delay






// Create 
