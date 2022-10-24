/// @description Insert description here
// You can write your code in this editor

if (!reached_destination){
	percent += percent_speed/room_speed
	y -= animcurve_channel_evaluate(_channel,percent)
	direction = lerp(0, random_rotation_to, percent/1)

}

if (percent >= 1){
	reached_destination = true
	starting_alpha -= alpha_reduction_rate
}

