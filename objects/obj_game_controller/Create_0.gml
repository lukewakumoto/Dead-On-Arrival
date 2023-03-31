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
global.playerMoney = 1000000
global.displayed_money = 0
global.moneyToAdd = 0
global.moneyToAddTimer = 0;
global.playerIsDead = false
global.totalKills = 0
global.totalShots = 0
global.enemiesLeft = 0
global.worldXBound = 2500
global.worldYBound = 2110


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
win_text_updated = false

show_debug_message("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
money_increment = 10

// debugging variables
global.total_damage = 0
global.running_damage = 0
global.dps_timer = 0
