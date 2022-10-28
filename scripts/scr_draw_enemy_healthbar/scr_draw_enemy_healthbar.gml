// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_enemy_healthbar(_x, _y, _width, _height, _max_health, _curr_health){
	draw_set_alpha(0.6)
	
	var _x_left = _x - _width/2
	var _x_right = _x + _width/2
	
	var _y_up = _y - _height/2
	var _y_down = _y + _height/2
	
	var _line_width = 2
	
	scr_draw_rectangle_width(_x_left, _y_up, _x_right, _y_down, _line_width)
	
	var _health_left = _x_left + _line_width
	var _health_right = _x_right - _line_width
	draw_rectangle_color(_health_left, _y_up + _line_width,
						 max(lerp(_health_left, _health_right, _curr_health / _max_health), _health_left), _y_down - _line_width,
						 c_green, c_green, c_green, c_green, false)
					
	if (_max_health > _curr_health){
		draw_rectangle_color(max(lerp(_health_left, _health_right, _curr_health / _max_health), _health_left), _y_up + _line_width,
							_health_right, _y_down - _line_width,
							c_red, c_red, c_red, c_red, false)
	}
						 
	draw_set_alpha(1)
	
	var _num_bars = floor(_max_health/5)
	for (var i = _x_left + _width/_num_bars; i < _x_right; i += _width/_num_bars){
		draw_set_color(c_black)
		draw_line(i, _y_up, i, _y_down)
		draw_set_color(c_white)
	}
}
