function get_dark(blend, use_dark, use_position = false, posX = 0, posY = 0)
{
	if use_dark
	{
		if room == boss_vigilante
			blend = make_color_rgb(247, 109, 22);
		var d = room_width * room_height;
		var b = d;
		var bb = b;
		with obj_lightsource
		{
			if (object_index != obj_lightsource_attach || instance_exists(objectID))
			{
				if !use_position
					var dis = distance_to_object(other);
				else
					dis = distance_between_points(x, y, posX, posY);
				if dis < d
				{
					bb = dis / distance;
					if bb < b
					{
						b = bb;
						d = dis;
					}
				}
			}
		}
		var t = (b + 0.4) * 255;
		var a = (1 - obj_drawcontroller.dark_alpha) * 255;
		a -= 102;
		t = clamp(t, 0, 255);
		a = clamp(a, 0, 255);
		var r = (color_get_red(blend) - t) + a;
		var g = (color_get_green(blend) - t) + a;
		b = (color_get_blue(blend) - t) + a;
		if r < 0
			r = 0;
		if g < 0
			g = 0;
		if b < 0
			b = 0;
		return make_color_rgb(r, g, b);
	}
	else
		return image_blend;
}
function draw_superslam_enemy()
{
	if (state == states.superslam && floor(image_index) >= 5 && floor(image_index) <= 7 && instance_exists(baddiegrabbedID))
	{
		with baddiegrabbedID
			draw_enemy(global.kungfu, true);
	}
}