/obj/structure/closet/crate/coffin
	var/atom/movable/disguise = null
	var/last_disguise_switch = 0

/obj/structure/closet/crate/coffin/Destroy()
	remove_disguise()
	. = ..()

/obj/structure/closet/crate/coffin/examine(mob/user)
	if(disguise)
		. += disguise.examine(user)
		if(isobserver(user) || AmBloodsucker(user))
			. += span_cult("<hr>Это замаскированный тёмными силами [initial(name)].<hr>")
		return
	else
		. = ..()
		if(isobserver(user) || AmBloodsucker(user))
			. += span_cult("<hr>Вампир может замаскировать этот объект, если нажать по нему через Ctrl-Shift.<hr>")

/obj/structure/closet/crate/coffin/CtrlShiftClick(mob/user)
	if(AmBloodsucker(user))
		if(world.time < last_disguise_switch + 1 SECONDS)
			return
		if(!disguise)
			var/list/list_of_disguises = list(/obj/structure/closet, /obj/structure/closet/crate, /obj/structure/rack, /obj/structure/bed, /obj/structure/girder, /obj/structure/grille, /obj/structure/loot_pile/maint)
			var/disguise_selection = input("Select which structure should be seen") as null|anything in list_of_disguises
			if(disguise_selection)
				var/atom/disg = new disguise_selection(src)
				disguise = disg
				name = disg.name
				appearance = disg.appearance
				copy_overlays(disg)
				last_disguise_switch = world.time
				playsound(src, 'sound/effects/bamf.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE) // Слышно только в упор
				qdel(disguise)
		else
			remove_disguise()
	else
		return . = ..()

/obj/structure/closet/crate/coffin/proc/remove_disguise()
	if(disguise)
		disguise = null
		maptext = null

		name = initial(name)
		icon = initial(icon)
		icon_state = initial(icon_state)
		cut_overlays()
		playsound(src, 'sound/effects/bamf.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE) // Слышно только в упор

/obj/structure/bloodsucker
	var/atom/movable/disguise = null
	var/last_disguise_switch = 0

/obj/structure/bloodsucker/Destroy()
	owner = null // в оригинале owner не обнуляется
	remove_disguise()
	. = ..()

/obj/structure/bloodsucker/examine(mob/user)
	if(disguise)
		. += disguise.examine(user)
		if(isobserver(user) || owner == user)
			. += span_cult("<hr>Это замаскированный тёмными силами [initial(name)].<hr>")
		return
	else
		. = ..()
		if(isobserver(user) || owner == user)
			. += span_cult("<hr>Вампир-владелец может замаскировать этот объект, если нажать по нему через Ctrl-Shift.<hr>")

/obj/structure/bloodsucker/CtrlShiftClick(mob/user)
	if(user == owner)
		if(world.time < last_disguise_switch + 1 SECONDS)
			return
		if(!disguise)
			var/list/list_of_disguises = list(/obj/structure/closet/crate, /obj/structure/rack, /obj/structure/bed, /obj/structure/girder, /obj/structure/grille, /obj/structure/loot_pile/maint)
			var/disguise_selection = input("Select which structure should be seen") as null|anything in list_of_disguises
			if(disguise_selection)
				disguise = new disguise_selection(src)
				name = disguise.name
				appearance = disguise.appearance
				copy_overlays(disguise)
				last_disguise_switch = world.time
				playsound(src, 'sound/effects/bamf.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE) // Слышно только в упор
				qdel(disguise)
		else
			remove_disguise()
	else
		return . = ..()

/obj/structure/bloodsucker/vassalrack/CtrlShiftClick(mob/user) // отдельное уточнение для вассализатора. Если на нём жертва - нельзя сделать маскировку.
	if(user == owner && buckled_mobs)
		to_chat(user, span_cult("Сначала нужно снять жертву."))
		return
	. = ..()

/obj/structure/bloodsucker/candelabrum/CtrlShiftClick(mob/user) // отдельное уточнение для кандилябра. Если горит - нельзя сделать маскировку
	if(!owner) // хозяин не присваивается нигде у предмета, потому присваиваем его сами
		if(AmBloodsucker(user))
			owner = user
	if(user == owner && lit)
		to_chat(user, span_cult("Сначала нужно погасить огонь."))
		return
	. = ..()

/obj/structure/bloodsucker/proc/remove_disguise()
	if(disguise)
		disguise = null
		maptext = null

		name = initial(name)
		icon = initial(icon)
		icon_state = initial(icon_state)
		cut_overlays()
		playsound(src, 'sound/effects/bamf.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE) // Слышно только в упор
