// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_is_p_rank()
{
	if global.leveltosave != "exit" && global.leveltosave != "secretworld"
		return global.lap && global.secretfound >= 3 && global.treasure && !global.combodropped && global.prank_enemykilled;
	else if global.leveltosave == "exit"
		return !global.combodropped;
	else
		return !global.combodropped && global.prank_enemykilled;
}