/// @description Insert description here
// You can write your code in this editor

menu_active = false



menu_width = global.camera_width;
menu_height = global.camera_height;

op_y_offset = 50;
op_x_offset = 0;
op_border_width = 100; // width of the clickable box
op_border_height = 8; // height of the clickable box
op_space = 32; // space between each text
toggle_alt = false

menu_item = array_create(3,[])
menu_item = array_create(global.num_weapons, "")
num_menus = 4
#region
/*
WEAPONS


Tier 1
HI-POINT
MP5
TERMINATOR
MK18
G3
STONER
M40
CROWBAR

Tier 2
DEAGLE
VECTOR
SPAS12
AK15
BEOWULF
ULTIMAX
INTERVENTION
BASTARD

Tier 3
Nitro Express
P90
AA12
G11
SCARH
Minigun
M99


*/

#endregion
menu_item[0][0] = weapon.HI_POINT
menu_item[0][1] = weapon.MP5K
menu_item[0][2] = weapon.TERMINATOR
menu_item[0][3] = weapon.MK18
menu_item[0][4] = weapon.G3A1
menu_item[0][5] = weapon.STONER
menu_item[0][6] = weapon.M40

menu_item[1][0] = weapon.DEAGLE
menu_item[1][1] = weapon.VECTOR
menu_item[1][2] = weapon.SPAS
menu_item[1][3] = weapon.AK15
menu_item[1][4] = weapon.BEOWULF
menu_item[1][5] = weapon.ULTIMAX
menu_item[1][6] = weapon.INTERVENTION

menu_item[2][0] = weapon.NITRO
menu_item[2][1] = weapon.P90
menu_item[2][2] = weapon.AA12
menu_item[2][3] = weapon.G11
menu_item[2][4] = weapon.SCARH
menu_item[2][5] = weapon.MG42
menu_item[2][6] = weapon.M99


menu_item[3][0] = weapon.PATRIOT
menu_item[3][1] = weapon.MINIGUN
menu_item[3][2] = weapon.XM8

curr_menu = 0

/*
for (var i = 0; i < array_length(menu_item); i ++){
	menu_item[i] = scr_get_weapon_from_id(i)
}*/

selected_item = 0
alternate_weapon = noone
hovering = -1
