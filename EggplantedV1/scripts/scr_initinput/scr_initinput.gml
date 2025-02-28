function scr_initinput()
{
	ini_open("saveData.ini")
	
	global.key_up = ini_read_string("ControlsKeys", "up", vk_up)
	global.key_right = ini_read_string("ControlsKeys", "right", vk_right)
	global.key_left = ini_read_string("ControlsKeys", "left", vk_left)
	global.key_down = ini_read_string("ControlsKeys", "down", vk_down)
	global.key_jump = ini_read_string("ControlsKeys", "jump", ord("Z"))
	global.key_slap = ini_read_string("ControlsKeys", "slap", ord("X"))
	global.key_taunt = ini_read_string("ControlsKeys", "taunt", ord("C"))
	global.key_shoot = ini_read_string("ControlsKeys", "shoot", ord("A"))
	global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift)
	global.key_start = ini_read_string("ControlsKeys", "start", vk_escape)
	global.key_chainsaw = ini_read_string("ControlsKeys", "chainsaw", ord("V"))
	global.key_groundpound = ini_read_string("ControlsKeys", "groundpound", ord("A"))
	
	global.key_upC = ini_read_string("ControllerButton", "up", gp_padu)
	global.key_rightC = ini_read_string("ControllerButton", "right", gp_padr)
	global.key_leftC = ini_read_string("ControllerButton", "left", gp_padl)
	global.key_downC = ini_read_string("ControllerButton", "down", gp_padd)
	global.key_jumpC = ini_read_string("ControllerButton", "jump", gp_face1)
	global.key_slapC = ini_read_string("ControllerButton", "slap", gp_face3)
	global.key_tauntC = ini_read_string("ControllerButton", "taunt", gp_face4)
	global.key_shootC = ini_read_string("ControllerButton", "shoot", gp_face2)
	global.key_attackC = ini_read_string("ControllerButton", "attack", gp_shoulderr)
	global.key_startC = ini_read_string("ControllerButton", "start", gp_start)
	global.key_chainsawC = ini_read_string("ControllerButton", "chainsaw", gp_shoulderl)
	global.key_groundpoundC = ini_read_string("ControllerButton", "chainsaw", gp_shoulderrb)
	global.gamepad_groundpound = ini_read_real("InputConfig", "groundpound", 1);
	global.keyboard_superjump = ini_read_real("InputConfig", "kb_superjump", 1);
	global.keyboard_groundpound = ini_read_real("InputConfig", "kb_groundpound", 1);
	
	ini_close()
}
