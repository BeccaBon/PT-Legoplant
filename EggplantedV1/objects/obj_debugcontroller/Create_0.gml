#macro debug (GM_build_type == "run")
enum debug_text_type
{
	normal,
	command,
	traced,
	error
}

depth = -500;
DEBUG = true;
if (parameter_count() > 2)
	DEBUG = true;
if !DEBUG
{
	var n = parameter_count();
	for (var i = 0; i < n; i++)
	{
		var s = parameter_string(i);
		if (s == "-debug" || s == "debug")
			DEBUG = true;
	}
}
if !DEBUG
	instance_destroy();
if DEBUG
{
	active = false;
	showoverlay = false;
	SET_GAME_SPEED = new DebugCommand("set_game_speed", "Sets the game speed", "<int>", function(int)
	{
		game_set_speed(floor(real(int)), gamespeed_fps);
	});
	SET_BOSS_HP = new DebugCommand("set_boss_hp", "", "<int>", function(int)
	{
		with obj_baddie
			elitehit = real(int);
	});
SWITCH_CHAR = new DebugCommand("switch_char", "Switches character", "<character string>, <ispeppino bool>", function(char, _ispeppino)
	{
		with (obj_player)
		{
			character = char;
			ispeppino = _ispeppino;
			scr_characterspr();
		}
	});
	SHOW_DEBUG_OVERLAY = new DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function()
	{
		show_debug_overlay(!showoverlay);
		showoverlay = !showoverlay;
	});	
	HIDETILES = new DebugCommand("hidetiles", "", "<bool>", function(toggle)
	{
		if (is_undefined(toggle))
			global.hidetiles = !global.hidetiles;
		else
			global.hidetiles = toggle;
		layer_set_visible("Tiles_BG", !global.hidetiles);
		layer_set_visible("Tiles_BG2", !global.hidetiles);
		layer_set_visible("Tiles_BG3", !global.hidetiles);
		layer_set_visible("Tiles_1", !global.hidetiles);
		layer_set_visible("Tiles_2", !global.hidetiles);
		layer_set_visible("Tiles_3", !global.hidetiles);
		layer_set_visible("Tiles_4", !global.hidetiles);
		layer_set_visible("Tiles_Foreground1", !global.hidetiles);
		layer_set_visible("Tiles_Foreground2", !global.hidetiles);
		layer_set_visible("Tiles_Foreground3", !global.hidetiles);
	});
	GIVEKEY = new DebugCommand("givekey", "", "", function()
	{
		global.key_inv = true;
	});
	LOADTEST = new DebugCommand("loadtest", "", "", function()
	{
		with obj_debugcontroller
		{
			DoCommand("player_room rm_testing4 A");
			alarm[0] = 20;
		}
	});
	OTHERTEST = new DebugCommand("othertest", "", "", function()
	{
		with obj_debugcontroller
		{
			DoCommand("showcollisions 1");
			alarm[0] = 20;
		}
	});
	SETCOMBO = new DebugCommand("set_combo", "Set the combo", "<combo> <combotime:optional>", function(combo, combotime)
	{
		if combo == undefined
			exit;
		if combotime == undefined
			combotime = 60;
		
		global.combo = real(combo);
		global.combotime = real(combotime);
		with obj_player
			supercharge = 10;
	});
	GIVEHEAT = new DebugCommand("giveheat", "Gives heat", "", function()
	{
		global.style += 100;
	});
	ALLTOPPINS = new DebugCommand("alltoppins", "Adds all the toppins", "", function()
	{
		if (!instance_exists(obj_pizzakincheese))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
		if (!instance_exists(obj_pizzakintomato))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
		if (!instance_exists(obj_pizzakinsausage))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
		if (!instance_exists(obj_pizzakinpineapple))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
		if (!instance_exists(obj_pizzakinshroom))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
		global.cheesefollow = true;
		global.tomatofollow = true;
		global.sausagefollow = true;
		global.pineapplefollow = true;
		global.shroomfollow = true;
	});
	PANIC = new DebugCommand("panic", "Toggles pizza time", "<fill>", function(fill)
	{
		if fill != undefined && fill != ""
			fill = get_number_string(fill);
		else
			fill = 4000;
		
		global.panic = !global.panic;
		global.fill = fill;
		if global.panic
			obj_camera.alarm[1] = 60;
		obj_tv.chunkmax = global.fill;
	});
	SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(toggle)
	{
		if toggle == undefined
			exit;
		toggle = get_bool(toggle);
		if toggle != undefined
		{
			showcollisions = toggle;
			event_perform(ev_other, ev_room_start);
		}
	});
	SHOW_HUD = new DebugCommand("showhud", "Shows the HUD", "<bool>", function(toggle)
	{
		if toggle == undefined
			exit;
		toggle = get_bool(toggle);
		show_debug_message(!toggle);
		if toggle != undefined
		{
			showhud = toggle;
			with obj_tv
			{
				visible = toggle;
				show_debug_message(visible);
			}
			with obj_camera
			{
				visible = toggle;
				show_debug_message(visible);
			}
			with obj_roomname
			{
				visible = toggle;
				show_debug_message(visible);
			}
			with obj_pigtotal
			{
				visible = toggle;
				show_debug_message(visible);
			}
		}
	});
	PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(_room, _door)
	{
		if _room == undefined
			exit;
		if _door == undefined
			exit;
		
		_room = asset_get_index(_room);
		if _room == -1
			exit;
		with obj_player
		{
			targetRoom = _room;
			targetDoor = _door;
		}
		instance_create(x, y, obj_fadeout);
	});
	CAMERA_ZOOM = new DebugCommand("camera_zoom", "Zoom", "<targetzoom> <spd>", function(zoom, spd)
	{
		if zoom == undefined
			exit;
		if spd != undefined
			spd = get_number_string(spd);
		
		with obj_camera
		{
			targetzoom = zoom;
			targetzoom = clamp(targetzoom, 0, max_zoom);
			if spd != undefined
				zoomspd = abs(spd);
		}
	});
	DESTROYICE = new DebugCommand("destroyice", "", "", function()
	{
		instance_destroy(obj_iceblock);
		instance_destroy(obj_iceblockslope);
	});
	HARDMODE = new DebugCommand("hardmode", "Toggles hardmode", "<bool>", function(toggle)
	{
		if toggle == undefined
			exit;
		toggle = get_bool(toggle);
		show_debug_message(!toggle);
		if toggle != undefined
		{
			global.hardmode = toggle;
			with obj_hardmode
				event_perform(ev_other, ev_room_start);
		}
	});
	
	active = false;
	showcollisions = false;
	showhud = true;
	
	
	command_list = ds_list_create();
	ds_list_add(command_list, DESTROYICE, SET_GAME_SPEED, SHOW_HUD, SHOW_COLLISIONS, PLAYER_ROOM, CAMERA_ZOOM, HARDMODE, PANIC, GIVEHEAT, SWITCH_CHAR, SET_BOSS_HP);
	ds_list_add(command_list, SETCOMBO, GIVEKEY, HIDETILES, SHOW_DEBUG_OVERLAY,ALLTOPPINS);
	
	input_text = "";
	text_list = ds_list_create();
	search_commands = ds_list_create();
	ds_list_clear(search_commands);
	search_w = 0;
	keyboard_string = "";
	
	function FindCommand(_id)
	{
		for (var i = 0; i < ds_list_size(command_list); i++)
		{
			var b = ds_list_find_value(command_list, i);
			if b.command_id == _id
				return b;
		}
		return undefined;
	}
	function DoCommand(text)
	{
		var commands = string_split(text, " ");
		trace(commands);
		if (array_length(commands) > 0)
		{
			var c = FindCommand(commands[0]);
			if c != undefined
			{
				TextList_Add(1, text);
				array_delete(commands, 0, 1);
				c.Invoke(commands);
				return true;
			}
			else
			{
				TextList_Add(0, text);
				TextList_Add(3, "Invalid command");
			}
		}
		else
		{
			TextList_Add(0, text);
			TextList_Add(3, "No text typed");
		}
		return false;
	}
	function GetDouble(str)
	{
		var n = string_digits(str);
		if n != undefined && n != ""
		{
			n = real(str);
			return n;
		}
		return undefined;
	}
	function get_bool(str)
	{
		if str == "true"
		{
			str = true;
			return str;
		}
		else if str == "false"
		{
			str = false;
			return str;
		}
		else if (is_real(real(string_digits(str))))
		{
			str = bool(real(string_digits(str)));
			return str;
		}
		return undefined;
	}
	function get_number_string(str)
	{
		var n = str;
		if (is_string(str))
		{
			n = real(string_digits(str));
			if (string_char_at(str, 1) == "-")
				n = -real(string_digits(str));
		}
		return n;
	}
}
