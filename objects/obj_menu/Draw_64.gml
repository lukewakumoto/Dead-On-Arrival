/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (menu_active){

	draw_sprite_ext(sprite_index,image_index,0,0,menu_width div sprite_width + 1, menu_height div sprite_height,0,c_white,1)

	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_set_font(fnt_Tier)
	var tier_text = ""
	var tier_color = noone
	switch(curr_menu){
		case 0:
			tier_color = c_white
			tier_text = "Tier I"
			break;
		case 1:
			tier_text = "Tier II"
			tier_color = c_blue
			break;
		case 2:
			tier_text = "Tier III"
			tier_color = c_orange
			break;
			
		case 3:
			tier_text = "Tier IV"
			tier_color = c_red
			break;
	}
	
	draw_set_color(tier_color)
	
	draw_text(global.camera_width*(3/4),global.camera_height/7," < Q     " + tier_text + "     E >")
	
	draw_set_color(c_white)

	draw_set_font(fnt_menu)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	hovering = -1
	

	window_set_cursor(cr_arrow)	
	
	
	// draw the text, check if its selected by the mouse
	//var alternate_weapon = noone
	

	
	#region // draw weapon buttons
	for (var i = 0; i < array_length(menu_item[curr_menu]); i ++){
		var weapon_name = menu_item[curr_menu][i][? "wep_name"]//menu_item[curr_menu][i][? "wep_name"]
		var button_start_y = global.camera_height/3
		var button_height = string_height("Test") + 25
		var padding = 10
		curr_selected_weapon = i
		
		if (scr_player_has_weapon(menu_item[curr_menu][i][? "wep_id"])){
			draw_set_color(c_green)
		} 
		
		scr_draw_clickable_button_absolute(fa_middle,fa_middle,global.camera_width*(3/4),button_start_y + button_height*i + padding*i,weapon_name,
		fnt_menu,200,button_height,
		function(){selected_item = curr_selected_weapon})
	
	}
	
	#endregion
		


	
	var offset = 50
	//show_debug_message("SELECTED ITEM VALUE" + string(selected_item))
	//show_debug_message("LENGTH OF MENU ITEM CURR MENU" + string(min(selected_item,array_length(menu_item[curr_menu])) - 1))
	 selected_menu_item = menu_item[curr_menu][min(selected_item,array_length(menu_item[curr_menu]) - 1)]
	
	
	if (!is_undefined(selected_menu_item[? "alt_id"])){
			alternate_weapon = selected_menu_item[? "alt_id"]
	} else{
		alternate_weapon = noone
	}
		
		
	// draw the icon of the selected item
	if (selected_item != noone){
		
		
		/*if (alternate_weapon != noone and keyboard_check_pressed(ord("C"))){
			toggle_alt = !toggle_alt
		}*/
		
		if (!scr_player_has_weapon(selected_menu_item[? "wep_id"])){
			scr_draw_icon(10,offset,global.camera_width/4,selected_menu_item[? "wep_silhouette"])
		} else{
			scr_draw_icon(10,offset,global.camera_width/4,selected_menu_item[? "wep_icon"])
		}
		draw_text(offset,offset,selected_menu_item[? "alt_id"])
		


		
	}
	#region // draw weapon stats	
	offset += global.camera_width/4 + 25;
	var bar_offset_x = 180;
	var bar_offset_y = 20;
	var damage = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "damage"];
	var damage_str = string(damage)
	if (obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "number_of_shot"] > 1){
		damage *= obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "number_of_shot"]/2 
		damage_str = damage_str + "x" + string(obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "number_of_shot"])
		
	}
	
	var penetration = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "penetration"];
	
	var text_height = string_height("test");
	
	draw_text(10, offset, "Damage: " + damage_str);
	//draw_healthbar(bar_offset_x,offset + bar_offset_y,bar_offset_x + 120,offset+text_height-bar_offset_y, (damage/30)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height, "Penetration: " + string(penetration));
	//draw_healthbar(bar_offset_x,offset+text_height+bar_offset_y,bar_offset_x + 120,offset+text_height*2-bar_offset_y, (penetration/4)*100,c_black,c_red,c_lime,0,true,true );
	
	var _fire_mod = is_undefined(selected_menu_item[? "bullets_per_shot"]) ? 1 : selected_menu_item[? "bullets_per_shot"]
	var _bullets_per_second = ((room_speed/selected_menu_item[? "fire_delay"]) * _fire_mod)/room_speed
	draw_text(10, offset + text_height*2, "Fire Rate: " + string(_bullets_per_second) + " rounds/sec");
	//draw_healthbar(bar_offset_x,offset+text_height*2+bar_offset_y,bar_offset_x + 120,offset+text_height*3-bar_offset_y, (1/selected_menu_item[? "fire_delay"]/15)*100,c_black,c_red,c_lime,0,true,true );
	
	
	var _standard_dps = damage * _bullets_per_second
	var _damage_per_magazine = damage * selected_menu_item[? "mag_capacity"]
	var _time_to_deplete_magazine = selected_menu_item[? "mag_capacity"] / _bullets_per_second
	var _dps_without_pen = ((_damage_per_magazine) / (_time_to_deplete_magazine + selected_menu_item[? "reload_time"]))
	
	
	draw_text(10, offset + text_height*3, "DPS: " + string(_standard_dps ) + " ( " + string(_standard_dps  * (penetration + 1)) + " ) ");
	//draw_healthbar(bar_offset_x,offset+text_height*6+bar_offset_y,bar_offset_x + 120,offset + text_height*7-bar_offset_y, ((selected_menu_item[? "wep_weight"] - .25)/1.00)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*4, "Spread: " + string(selected_menu_item[? "spread"]) );
	//draw_healthbar(bar_offset_x,offset+text_height*3+bar_offset_y,bar_offset_x + 120,offset + text_height*4-bar_offset_y, (1/selected_menu_item[? "spread"]/3.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*5, "Reload Time: " + string(selected_menu_item[? "reload_time"]));
	//draw_healthbar(bar_offset_x,offset+text_height*4+bar_offset_y,bar_offset_x + 120,offset + text_height*5-bar_offset_y, (1/selected_menu_item[? "reload_time"]/1.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*6, "Magazine Size: " + string(selected_menu_item[? "mag_capacity"]));
	//draw_healthbar(bar_offset_x,offset+text_height*5+bar_offset_y,bar_offset_x + 120,offset + text_height*6-bar_offset_y, (selected_menu_item[? "mag_capacity"]/50)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*7, "Maneuverability: " + string(selected_menu_item[? "wep_weight"]));
	//draw_healthbar(bar_offset_x,offset+text_height*6+bar_offset_y,bar_offset_x + 120,offset + text_height*7-bar_offset_y, ((selected_menu_item[? "wep_weight"] - .25)/1.00)*100,c_black,c_red,c_lime,0,true,true );
#endregion	

	// draw weapon description
	draw_set_color(c_grey)
	draw_set_alpha(0.5)
	draw_rectangle(0,offset + text_height*8.5, 450, global.camera_height,false)

	draw_set_color(c_white)
	draw_set_alpha(1.0)
	draw_text_ext(10,offset + text_height*9,string(selected_menu_item[? "wep_description"]),text_height, 440)
	// Draw the weapon statistics and the buy button

	if (selected_item != noone){
		if (!scr_player_has_weapon(selected_menu_item[? "wep_id"])){ // If the player already has the weapon, sell ammo instead
			
			
			draw_text_transformed(global.camera_width/3,offset, "Cost: " + scr_money_format(selected_menu_item[? "wep_cost"]) , 1.5,1.5,0)

			draw_set_color(c_white)
			
			scr_draw_clickable_button(global.camera_width*(2/5),global.camera_height*(3/5),"BUY", fnt_menu, 32, 16, function(){
				
				/*if (!is_undefined(selected_menu_item[? "alt_id"])){
					scr_buy_weapon(obj_player_weapon.weapons[selected_menu_item[? "alt_id"]], 0, false)
				}*/
				
				
				scr_buy_weapon(selected_menu_item, selected_menu_item[? "wep_cost"])
				

				
				})
				
		} else if (not is_infinity(selected_menu_item[? "mag_capacity"])){
			var mag_size = selected_menu_item[? "mag_capacity"]
			var mag_cost = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "cost_per_shot"] * mag_size
			var x_offset = alternate_weapon == noone ? 0 : 50
			
			if (alternate_weapon != noone){
				var alt_mag_size = alternate_weapon[? "mag_capacity"]
				var alt_mag_cost = obj_player_weapon.calibers[alternate_weapon[? "caliber"]][? "cost_per_shot"] * alt_mag_size
				for(var _i = 0; _i < 3; _i ++){
					draw_set_halign(fa_center)
					draw_text_transformed(global.camera_width*(3/5) + x_offset,offset + (text_height + 32) * _i*2, string(_i + 1) + " grenades: "  + scr_money_format(alt_mag_cost * (_i + 1)) , 1.5,1.5,0)
					draw_set_halign(fa_left)
					
					scr_draw_clickable_button(global.camera_width*(3/5) + x_offset ,offset + (text_height + 32) * (_i * (2) + 1),"BUY AMMO", fnt_menu, 32, 16, function(modifier){
						var alt_mag_size = alternate_weapon[? "mag_capacity"]
						var alt_mag_cost = obj_player_weapon.calibers[alternate_weapon[? "caliber"]][? "cost_per_shot"] * alt_mag_size

						if (scr_drain_money(alt_mag_cost * modifier)){
							obj_player_weapon.ammunition[alternate_weapon][1] += alt_mag_size * modifier
						}
					},,_i + 1)
				}
			}
			
			for(var _j = 0; _j < 3; _j ++){
				draw_set_halign(fa_center)
				draw_text_transformed(global.camera_width*(2.5/5) - x_offset,offset + (text_height + 32)*2*_j, string(_j + 1) + " mags: " + scr_money_format(mag_cost*(_j+1)) , 1.5,1.5,0)
				draw_set_halign(fa_left)

			


				scr_draw_clickable_button(global.camera_width*(2.5/5) - x_offset ,offset +  (text_height + 32) * (_j * (2) + 1),"BUY AMMO", fnt_menu, 32, 16, function(modifier){
					var mag_size = selected_menu_item[? "mag_capacity"]
					var mag_cost = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "cost_per_shot"] * mag_size
					if (scr_drain_money(mag_cost * modifier)){
						obj_player_weapon.ammunition[selected_menu_item][1] += mag_size * modifier
					}
					
				
				}, ,_j + 1)
			}
			
			/*draw_text_transformed(global.camera_width*(2/5) - x_offset,offset + (text_height + 32)*2, "3 magazines: " + scr_money_format(mag_cost*3) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5) - x_offset,offset + (text_height + 32)*3,"BUY AMMO", fnt_menu, 32, 16, function(){
				var mag_size = selected_menu_item[? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "cost_per_shot"] * mag_size

				if (scr_drain_money(mag_cost*3)){
					obj_player_weapon.ammunition[selected_menu_item][1] += mag_size*3
				}
	
				
			})
			draw_text_transformed(global.camera_width*(2/5) - x_offset,offset + (text_height + 32)*4, "5 magazines: " + scr_money_format(mag_cost*5) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5) - x_offset,offset + (text_height + 32)*5,"BUY AMMO", fnt_menu, 32, 16, function(){
				var mag_size = selected_menu_item[? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[selected_menu_item[? "caliber"]][? "cost_per_shot"] * mag_size
				if (scr_drain_money(mag_cost*5)){
					obj_player_weapon.ammunition[selected_menu_item][1] += mag_size*5
				}
				
				
			}) */
			
		}
		
	}
}
else{ 
	window_set_cursor(cr_none)	
	hovering = -1
	//selected_item = 0
}

if (alternate_weapon != noone){
//show_debug_message(alternate_weapon) TODO
}
