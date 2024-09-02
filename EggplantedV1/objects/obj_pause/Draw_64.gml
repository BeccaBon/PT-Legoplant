if pause && !instance_exists(obj_keyconfig)
{
	if (!surface_exists(pause_surf))
	{
	pause_surf = surface_create(960,540)
	surface_set_target(pause_surf)
	draw_surface(application_surface,0,0)
	surface_reset_target()
	}
	else
	{
	draw_surface(pause_surf,0,0)
	}
	var pad = 48
	draw_sprite_ext(spr_pixel,0,0,0,960,540,0,c_white,pausealpha)
	draw_set_halign(fa_middle)
	draw_set_valign(fa_top)
	draw_sprite_ext(spr_pause_border,0,640,180,bz,bz,0,c_white,pausealpha*2)
	draw_sprite_ext(spr_pause_border,0,320,180,-bz,bz,0,c_white,pausealpha*2)
	var xx = 480
	var yy = 48
	for (var i = 0; i < array_length(pause_menu); i++)
	{
		var c = c_gray
		yy = (96 + (pad * i))
		if (selected == i)
		{
			c = 16777215
            draw_sprite_ext(spr_cursor, cursor_index, (xx - pushadd - 110), (yy + cursor_sprite_height / 2), 1, 1, 0, c_white, (pausealpha * 2))
		}
		draw_text_color(xx, yy, pause_menu[i], c, c, c, c, 1)
	}
	xx = 832
	yy = 467
	shader_set(global.Pal_Shader)
	pal_swap_set(spr_palette, paletteselect, 0)
	shader_reset()
	draw_set_font(global.collectfont)
	draw_set_halign(fa_center)
	xx = 740
	yy = 460	
	//draw_sprite_ext(spr_secretportal_idle, 0, 720, 482,1,1,0,c_white,pausealpha*2);
	//draw_set_font(global.combofont);
	//draw_set_halign(2);
	//draw_set_valign(1);
	//draw_set_color(c_white);
	//draw_text(932 - 60, 482 - 8, concat(global.secretfound, "/3"));
	//draw_set_alpha(1);
	//draw_sprite(spr_pizzascore, 0, xx, yy)
	//if (global.collect >= global.crank)
	//	draw_sprite(spr_pizzascore_pepper, 0, xx, yy)
	//if (global.collect >= global.brank)
	//	draw_sprite(spr_pizzascore_pepperoni, 0, xx, yy)
	//if (global.collect >= global.arank)
	//	draw_sprite(spr_pizzascore_olive, 0, xx, yy)
	//if (global.collect >= global.srank)
	//	draw_sprite(spr_pizzascore_shroom, 0, xx, yy)
	//draw_text(xx, (yy - 54), global.collect)
   //var _score = global.collect
    //var rank_ix = 0
    //if (_score >= global.srank && scr_is_p_rank())
    //    rank_ix = 5
    //else if (_score >= global.srank)
    //    rank_ix = 4
    //else if (_score >= global.arank)
    //    rank_ix = 3
    //else if (_score >= global.brank)
    //    rank_ix = 2
    //else if (_score >= global.crank)
    //    rank_ix = 1
    //draw_sprite_ext(spr_ranks_hud, rank_ix, (xx + 142), (yy - 22), 1, 1, 0, c_white, 1)
    //var spr_w = sprite_get_width(spr_ranks_hudfill)
    //var spr_h = sprite_get_height(spr_ranks_hudfill)
    //var spr_xo = sprite_get_xoffset(spr_ranks_hudfill)
    //var spr_yo = sprite_get_yoffset(spr_ranks_hudfill)
    //var perc = 0
    //switch rank_ix
    //{
    //    case 4:
    //        perc = 1
    //        break
    //    case 3:
    //        perc = ((_score - global.arank) / (global.srank - global.arank))
    //        break
    //    case 2:
    //        perc = ((_score - global.brank) / (global.arank - global.brank))
    //        break
    //    case 1:
    //        perc = ((_score - global.crank) / (global.brank - global.crank))
    //        break
    //    default:
    //      perc = (_score / global.crank)
    //}

    //var t = (spr_h * perc)
    //var top = (spr_h - t)
    //draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, (spr_h - top), ((xx + 142) - spr_xo), (((yy - 22) - spr_yo) + top))
	xx = 95
	yy = 467
	pad = 80
	//for (i = 0; i < array_length(toppin_sprite); i++)
	//	draw_sprite_ext(toppin_sprite[i], toppin_index[i], (xx + (pad * i)), (yy + 5), 1, 1, 0, c_white, (toppin_has[i] ? pausealpha*2 : pausealpha))
instance_deactivate_all(true)
instance_activate_object(obj_inputAssigner)
instance_activate_object(obj_option)
instance_activate_object(obj_audioconfig)
instance_activate_object(obj_keyconfig)
}
else
{
surface_free(pause_surf)
pause_surf = -1
}
