pause = false;
pause = 0
pausealpha = 0
pause_surf = -1
bz = 0
var i = false;
color = make_color_rgb(121, 103, 151);
player1 = -4;
player2 = -4;
selected = 0;
stickpressed = false;
pushadd = 0
image_speed = 0;
depth = -998;
pause_menu = ["RESUME", "OPTIONS", "RESTART", "EXIT"];
cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_cursor);
cursor_sprite_height = sprite_get_height(spr_cursor);
peppino_sprite = spr_player_idle;
peppino_sprite_number = sprite_get_number(peppino_sprite);
peppino_index = 0;
toppin_sprite[0] = spr_toppinshroom;
toppin_sprite[1] = spr_toppincheese;
toppin_sprite[2] = spr_toppintomato;
toppin_sprite[3] = spr_toppinsausage;
toppin_sprite[4] = spr_toppinpineapple;
for (i = 0; i < array_length(toppin_sprite); i++)
{
	toppin_number[i] = sprite_get_number(toppin_sprite[i]);
	toppin_index[i] = 0;
	toppin_has[i] = false;
}
