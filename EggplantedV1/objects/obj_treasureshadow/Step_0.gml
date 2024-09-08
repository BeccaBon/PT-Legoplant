/*
x = playerid.x
y = playerid.y
if playerid.grounded
	visible = true
else
	visible = false
image_xscale = playerid.xscale
if (!playerid.visible)
	visible = false
*/
x = obj_player1.x
y = obj_player1.y
if obj_player1.grounded
	visible = true
else
	visible = false
image_xscale = obj_player1.xscale
if (!obj_player1.visible)
	visible = false