function scr_is_p_rank()
{
	if global.leveltosave != "exit" && global.leveltosave != "secretworld"
		return global.lap && global.secretfound >= 3 && global.treasure && !global.combodropped && global.prank_enemykilled;
	else if global.leveltosave == "exit"
		return !global.combodropped;
	else
		return !global.combodropped && global.prank_enemykilled;
}