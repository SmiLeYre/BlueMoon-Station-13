/obj/effect/proc_holder/spell/self/explosion
	name = "Explosion"
	desc = "This spell explodes an area."

	var/ex_severe = 0
	var/ex_heavy = 0
	var/ex_light = 0
	var/ex_flash = 0
	var/ex_flame = 0

/obj/effect/proc_holder/spell/self/explosion/cast(list/targets,mob/user = usr)
	explosion(user.loc,ex_severe,ex_heavy,ex_light,ex_flash, flame_range=ex_flame)
	return
