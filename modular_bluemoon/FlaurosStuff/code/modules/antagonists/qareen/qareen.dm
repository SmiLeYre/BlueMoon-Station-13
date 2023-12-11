// Awkward observer code copypasta, with a little twist - Flauros
/mob/living/simple_animal/qareen/proc/ManualFollow(atom/movable/target)
	if (!istype(target))
		return
	var/icon/I = icon(target.icon,target.icon_state,target.dir)
	var/orbitsize = (I.Width()+I.Height())*0.5
	orbitsize -= (orbitsize/world.icon_size)*(world.icon_size*0.25)
	orbit(target,orbitsize, FALSE, 20, 36)
	// Not entirely sure if we'd like to have this but I think it's neat.
	if(!revealed)
		to_chat(target, "<span class='warning'>You sense you are being observed by something unseen.</span>")

/mob/living/simple_animal/qareen/orbit()
	setDir(2)
	return ..()

/mob/living/simple_animal/qareen/stop_orbit(datum/component/orbiter/orbits)
	. = ..()
	pixel_z = 0
	animate(src, pixel_z = 2, time = 10, loop = -1, flags = ANIMATION_RELATIVE)
	animate(pixel_z = -4, time = 10, loop = -1, flags = ANIMATION_RELATIVE)
	if(!revealed)
		to_chat(orbits.parent, "<span class='warning'>You no longer detect an unseen presence.</span>")
