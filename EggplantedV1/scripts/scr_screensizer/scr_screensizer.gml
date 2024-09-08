#macro SCREEN_WIDTH obj_screensizer.actual_width
#macro SCREEN_HEIGHT obj_screensizer.actual_height
#macro SCREEN_X obj_screensizer.normal_size_fix_x
#macro SCREEN_Y obj_screensizer.normal_size_fix_y
#macro CAMERA_WIDTH obj_screensizer.ideal_width
#macro CAMERA_HEIGHT obj_screensizer.ideal_height

function get_resolution_width(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_width(1, aspect_ratio);
	return global.resolutions[aspect_ratio][resolution][0];
}
function get_resolution_height(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_height(1, aspect_ratio);
	return global.resolutions[aspect_ratio][resolution][1];
}
function get_resolution(resolution, aspect_ratio = aspectratio.normal)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return noone;
	return global.resolutions[aspect_ratio][resolution];
}