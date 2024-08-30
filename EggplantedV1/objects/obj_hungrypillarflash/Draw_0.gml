var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_set_alpha(fade);
draw_rectangle_color(cx, cy, cx + 960, cy + 960, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);


