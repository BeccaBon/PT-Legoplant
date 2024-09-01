function scr_playersounds() //gml_Script_scr_playersounds
{
    with (obj_player)
    {
        if ispeppino
        {
            if (sprite_index == spr_mach1 && (!audio_is_playing(sfx_mach1)) && grounded)
            {
                mach1snd = audio_play_sound(sfx_mach1, 1, false)
                sfx_gain(mach1snd)
            }
            else if (sprite_index != spr_mach1 || (!grounded) || move == (-xscale))
                audio_stop_sound(mach1snd)
            if ((sprite_index == spr_mach || state == states.climbwall) && (!audio_is_playing(sfx_mach2)))
            {
                mach2snd = audio_play_sound(sfx_mach2, 1, false)
                sfx_gain(mach2snd)
            }
            else if (sprite_index != spr_mach && state != states.climbwall)
                audio_stop_sound(mach2snd)
            if (state == states.mach3 && sprite_index != spr_crazyrun && (!audio_is_playing(sfx_mach3)))
            {
                mach3snd = audio_play_sound(sfx_mach3, 1, false)
                sfx_gain(mach3snd)
            }
            else if (state != states.mach3 || sprite_index == spr_crazyrun)
                audio_stop_sound(mach3snd)
            if (sprite_index == spr_crazyrun && (!audio_is_playing(sfx_mach4)))
            {
                mach4snd = audio_play_sound(sfx_mach4, 1, false)
                sfx_gain(mach4snd)
            }
            else if (sprite_index != spr_crazyrun)
                audio_stop_sound(mach4snd)
        }
        else
        {
            if (sprite_index == spr_mach1 && (!audio_is_playing(sfx_mach2N)) && grounded)
            {
                mach1snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach1snd)
            }
            else if (sprite_index != spr_mach1 || (!grounded) || move == (-xscale))
                audio_stop_sound(mach1snd)
            if ((sprite_index == spr_mach || state == states.climbwall) && (!audio_is_playing(sfx_mach2N)))
            {
                mach2snd = audio_play_sound(sfx_mach2N, 1, false)
                sfx_gain(mach2snd)
            }
            else if (sprite_index != spr_mach && state != states.climbwall)
                audio_stop_sound(mach2snd)
            if (state == states.mach3 && sprite_index != spr_crazyrun && (!audio_is_playing(sfx_mach3N)))
            {
                mach3snd = audio_play_sound(sfx_mach3N, 1, false)
                sfx_gain(mach3snd)
            }
            else if (state != states.mach3 || sprite_index == spr_crazyrun)
                audio_stop_sound(mach3snd)
            if (sprite_index == spr_crazyrun && (!audio_is_playing(sfx_mach4N)))
            {
                mach4snd = audio_play_sound(sfx_mach4N, 1, false)
                sfx_gain(mach4snd)
            }
            else if (sprite_index != spr_crazyrun)
                audio_stop_sound(mach4snd)

            {

            }
        }
        if (state != states.Sjumpprep && audio_is_playing(superjumpprepsnd))
            audio_stop_sound(superjumpprepsnd)
        if (state != states.Sjumpprep && audio_is_playing(superjumpholdsnd))
            audio_stop_sound(superjumpholdsnd)
        if (sprite_index == spr_tumblestart && (!audio_is_playing(sfx_tumble1)) && floor(image_index) < 11)
            tumble1snd = audio_play_sound(sfx_tumble1, 1, false)
        sfx_gain(tumble1snd)
        if (sprite_index == spr_tumblestart && floor(image_index) == 11 && (!audio_is_playing(sfx_tumble2)))
        {
            tumble2snd = audio_play_sound(sfx_tumble2, 1, false)
            sfx_gain(tumble2snd)
            audio_stop_sound(tumble1snd)
        }
        if ((sprite_index == spr_tumble || sprite_index == spr_machroll) && (!audio_is_playing(sfx_tumble3)))
        {
            tumble3snd = audio_play_sound(sfx_tumble3, 1, false)
            sfx_gain(tumble3snd)
        }
        if (state != states.tumble && sprite_index != spr_machroll)
        {
            audio_stop_sound(tumble1snd)
            audio_stop_sound(tumble2snd)
            audio_stop_sound(tumble3snd)
        }
        if (audio_is_playing(suplexdashsnd) && state != states.handstandjump)
            audio_stop_sound(suplexdashsnd)
			        if (state == states.machcancel)
        {
            if (sprite_index == spr_playerN_wallbounce)
            {
                audio_stop_sound(tornadosnd)
                if (!audio_is_playing(sfx_machcancel))
                {
                    machcancelsnd = audio_play_sound(sfx_machcancel, 1, false)
                    sfx_gain(machcancelsnd)
                }
            }
            else
            {
                audio_stop_sound(machcancelsnd)
                if ((!grounded) && (!audio_is_playing(sfx_tornado)))
                {
                    audio_stop_sound(sfx_tornadoground)
                    tornadosnd = audio_play_sound(sfx_tornado, 1, false)
                    sfx_gain(tornadosnd)
                }
                if (grounded && (!audio_is_playing(sfx_tornadoground)))
                {
                    audio_stop_sound(sfx_tornado)
                    tornadosnd = audio_play_sound(sfx_tornadoground, 1, false)
                    sfx_gain(tornadosnd)
                }
            }
        }
        else
        {
            audio_stop_sound(tornadosnd)
            audio_stop_sound(machcancelsnd)
        }
        if ((sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend) && (!audio_is_playing(sfx_airspinstart)) && (!audio_is_playing(sfx_airspin)))
        {
            airspinsnd = audio_play_sound(sfx_airspin, 1, false)
            sfx_gain(airspinsnd)
        }
        else if (sprite_index != spr_playerN_sidewayspin && sprite_index != spr_playerN_sidewayspinend)
        {

            audio_stop_sound(airspinsnd)
            audio_stop_sound(sfx_airspinstart)
        }
		if state == states.firemouth && sprite_index == spr_playerN_firemouthspin
		{
			if !audio_is_playing(sfx_noisefiremouth)
					audio_play_sound(sfx_noisefiremouth,1,true)
		}
		else if audio_is_playing(sfx_noisefiremouth)
			audio_stop_sound(sfx_noisefiremouth)
    }
}




