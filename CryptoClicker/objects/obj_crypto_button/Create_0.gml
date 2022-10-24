/// @description Insert description here
// You can write your code in this editor
x = 200
y = 250
buttonRadius = 150
hovered = false

enum buttonStates  {
	IDLE,
	PRESSED
}

onRelease = function(){
	global.numCrypto += global.buttonValue
}


currButtonState = buttonStates.IDLE
prevButtonState = noone