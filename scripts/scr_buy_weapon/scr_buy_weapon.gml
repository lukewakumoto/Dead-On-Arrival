// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buy_weapon(wep_id, cost, add_to_inventory=true){
	if (instance_exists(obj_player) && instance_exists(obj_player_weapon)){
		

		
		 // check if the player already has the weapon to afford duplicates and if they cann afford it
		if (!scr_player_has_weapon(wep_id)){
			if (scr_drain_money(cost)){
				
				
				with (obj_player_weapon){
					scr_change_weapon(wep_id)
				}
				
				if(add_to_inventory){
					with (obj_player){
						ds_list_add(weapon_inventory,wep_id)
						current_weapon = ds_list_size(weapon_inventory) - 1
					}
				}
				
			}			
		}
	}
	else{
		show_debug_message("EITHER THE PLAYER OR THE WEAPON OBJECT DOESN\" EXIST")
		return -1
	}
}