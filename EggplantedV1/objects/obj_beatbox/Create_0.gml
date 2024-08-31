scr_initenemy()
scr_soundeffect(sfx_breakdance)
audio_play_sound(sfx_breakdancemusic,1,true)
vsp = -11
if !obj_player1.ispeppino
	sprite_index = spr_beatboxN;
