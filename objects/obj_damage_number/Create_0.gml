/// @description Insert description here
// You can write your code in this editor
damage_number_amount = 0
starting_alpha = 1
alpha_reduction_rate = 0.1
is_critical_hit = false

random_rotation_to = random_range(-15,15)

curve = animcurve_get(cv_damage_number_vel)
_channel = curve.channels[0];

 // percentage through the curve
percent = 0;
percent_speed = 1

reached_destination = false








