/// @description Insert description here
// You can write your code in this editor

draw_set_circle_precision(64)
if (currButtonState == buttonStates.IDLE){
	draw_circle_color(x,y, buttonRadius, c_grey, c_grey, false)
}
else{
	draw_circle_color(x,y, buttonRadius*.98, c_dkgrey, c_dkgrey, false)	
}
