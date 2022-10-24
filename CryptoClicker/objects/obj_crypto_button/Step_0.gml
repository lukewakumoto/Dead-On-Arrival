/// @description Insert description here
// You can write your code in this editor
hovered = point_in_circle(mouse_x,mouse_y,x,y,buttonRadius)


if (hovered && mouse_check_button_pressed(mb_left)){
	prevButtonState = currButtonState
	currButtonState = buttonStates.PRESSED
} 

if (currButtonState = buttonStates.PRESSED){
	if (!mouse_check_button(mb_left)){
		currButtonState = buttonStates.IDLE	
		onRelease()
	}
}