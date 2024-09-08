enum aspectratio
{
	normal,
	undertale
}
global.resolutions[aspectratio.normal] = [
	[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]
];
global.resolutions[aspectratio.undertale] = [
	[640, 480], [800, 600], [1024, 768], [1152, 864], [1440, 1080]
];

window_set_size(960, 540)
surface_resize(application_surface, 960, 540)
camera_set_view_size(view_camera[0], 960, 540)
aspect_ratio = aspectratio.normal; // enumerator
ideal_width = get_resolution_width(1, aspect_ratio);
ideal_height = get_resolution_height(1, aspect_ratio);
actual_width = ideal_width;
actual_height = ideal_height;
normal_size_fix_x = 0;
normal_size_fix_y = 0;