if (!pause && obj_player1.key_start)
{
	var _cutscenehandler = false;
	with (obj_cutscene_handler)
	{
		if (!loop)
			_cutscenehandler = true;
	}
	with (obj_secretportal)
	{
		if (touched)
			_cutscenehandler = true;
	}
	with (obj_secretportalstart)
		_cutscenehandler = true;
	if (obj_savesystem.state == 0 && !_cutscenehandler && (room != rank_room && room != Realtitlescreen && room != timesuproom) && !instance_exists(obj_jumpscare) && !instance_exists(obj_fadeout) && !instance_exists(obj_technicaldifficulty))
	{
		selected = 0;
		peppinox = obj_camera.x
		peppinoy = obj_camera.y
		peppinosprite = obj_player.sprite_index
        selected = 0
		pause = 1
        audio_pause_all()
		instance_activate_object(obj_inputAssigner)
	}
}
with (obj_player1)
{
	other.paletteselect = paletteselect;
	other.spr_palette = spr_palette;
}
if pause
bz = lerp(bz,1,0.075)
else
bz = 2
if pausealpha != 0.5 && pause = 1
pausealpha += 0.025
else if pause = 0 && pausealpha > 0
pausealpha -= 0.05
if !audio_is_playing(mu_pause) && pause = 1
scr_music(mu_pause)
else if pause = 0
audio_stop_sound(mu_pause)
if (pause && !instance_exists(obj_option))
{
    application_surface_draw_enable(true)
	scr_getinput();
	var prevselected = selected;
	if selected < 0
	selected = 0
	if selected > 3
	selected = 3
	moveselect = -key_up2 + key_down2;
	selected += moveselect;
	if (moveselect != 0 && selected >= 0 && selected <= 2)
		selected = clamp(selected, 0, array_length(pause_menu) - 1);
	if (prevselected != selected)
	{
			audio_play_sound(sfx_menumove,1,false,global.option_sfx_volume,0,choose(0.9,0.95,1,1.05,1.1))
		switch (selected)
		{
			case 0:
				peppino_sprite = spr_player_idle;
				break;
			case 1:
				peppino_sprite = spr_file1;
				break;
			case 2:
				peppino_sprite = spr_player_panic;
				break;
			case 3:
				peppino_sprite = spr_player_winding;
				break;
		}
		peppino_sprite_number = sprite_get_number(peppino_sprite);
		peppino_index = 0;
	}
	if (key_jump)
	{
		switch (selected)
		{
            case 0:
				pause = 0
        instance_activate_all()
        scr_deactivate_escape()
        alarm[1] = 1
        audio_resume_all()
				
				break;
			case 2:
				var roomname = room_get_name(room);
				if (!global.snickchallenge)
				{
					var rm = -4;
					rm = global.leveltorestart;
					ds_list_clear(global.saveroom);
					ds_list_clear(global.baddieroom);
					if (rm != -4 && rm != -1)
					{
						instance_destroy(obj_fadeout);
						instance_activate_all();
						global.levelreset = false;
						scr_playerreset();
						global.levelreset = true;
						scr_room_goto(rm);
						pause = false;
						obj_player1.targetDoor = "A";
						obj_player1.restartbuffer = 15;
						obj_player2.restartbuffer = 15;
						if (instance_exists(obj_player2))
							obj_player2.targetDoor = "A";
						break;
					}
					else
					{
					}
				}
				break;
			case 1:
			scr_soundeffect(choose(sfx_menuselect1,sfx_menuselect2,sfx_menuselect3))
				with (instance_create(x, y, obj_option))
					depth = other.depth - 1;
				break;
			case 3:
                if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
                {
                    pause = false
                    instance_activate_all()
                    room = Realtitlescreen
                    with (obj_player1)
                    {
                        character = "P"
                        scr_characterspr()
                    }
                    scr_playerreset()
                    obj_player1.state = states.titlescreen
                    obj_player2.state = states.titlescreen
                    obj_player1.targetDoor = "A"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "A"
                    global.cowboyhat = false
                    global.coop = false
                }
                else
                {
                    pause = false
                    instance_activate_all()
                    scr_playerreset()
                    global.levelreset = true
                    obj_player1.targetDoor = "D"
                    if instance_exists(obj_player2)
                        obj_player2.targetDoor = "D"
                    room = rm_levelselect
                    alarm[0] = 2
                }
                break
        }

    }
	cursor_index += 0.35;
	if (cursor_index > cursor_sprite_number)
	{
		var p = cursor_index - floor(cursor_index);
		cursor_index = p;
	}
	peppino_index += 0.35;
	if (peppino_index > peppino_sprite_number)
	{
		p = peppino_index - floor(peppino_index);
		peppino_index = p;
	}
	for (var i = 0; i < array_length(toppin_sprite); i++)
	{
		toppin_index[i] += 0.35;
		if (toppin_index[i] > toppin_number[i])
		{
			var t = toppin_index[i];
			p = t - floor(t);
			toppin_index[i] = p;
		}
	}
	toppin_has[0] = global.shroomfollow;
	toppin_has[1] = global.cheesefollow;
	toppin_has[2] = global.tomatofollow;
	toppin_has[3] = global.sausagefollow;
	toppin_has[4] = global.pineapplefollow;
}
