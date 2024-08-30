function scr_soundeffect()
{
	var snd = argument[irandom((argument_count - 1))]
	var snd_id = audio_play_sound(snd, 1, false)
	audio_sound_gain(snd_id, (audio_sound_get_gain(snd_id) * global.option_sfx_volume), 0)
	exit;
}

function scr_soundeffect_pitched(snd, lowerpitch = 0.75, higherpitch = 1.25)
{ 
    if is_array(snd)
      snd = snd[irandom(array_length(snd)-1)]
    audio_play_sound(snd, 1, false)
    audio_sound_gain(snd, (audio_sound_get_gain(snd) * global.option_sfx_volume), 0)
    audio_sound_pitch(snd,random_range(lowerpitch, higherpitch))
    exit;
}

function sfx_gain(argument0)
{
	audio_sound_gain(argument0, (audio_sound_get_gain(argument0) * global.option_sfx_volume), 0)
	exit;
}

