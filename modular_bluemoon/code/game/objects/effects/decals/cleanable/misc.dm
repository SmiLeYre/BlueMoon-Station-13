//контраргументы всем бс юзерам, теперь нужно чистить место преступления после себя
/obj/effect/decal/cleanable/bluespace_remains
	name = "bluespace dust"
	desc = "Остатки блюспейс пыли. Похоже можно проанализировать."
	icon = 'icons/effects/atmospherics.dmi'
	icon_state = "freon_old"
	var/source_x
	var/inaccuracy_x
	var/source_y
	var/inaccuracy_y
	var/source_z
	var/atom/source_owner

/obj/effect/decal/cleanable/bluespace_remains/attackby(obj/item/I, mob/user, params)
	..()
	var/inaccuracy //в процентах
	var/scanner = FALSE
	if(istype(I, /obj/item/t_scanner))
		inaccuracy = 1
		scanner = TRUE
	else if(istype(I, /obj/item/analyzer/ranged))
		inaccuracy = 0.25
		scanner = TRUE
	else if(istype(I, /obj/item/detective_scanner))
		inaccuracy = 0.5
		scanner = TRUE
	else if(istype(I, /obj/item/analyzer))
		inaccuracy = 0.75
		scanner = TRUE
	if(scanner)
		to_chat(user, "<span class='warning'>Источник сигнала находится приблизительно по координатам [source_x + round(inaccuracy_x*inaccuracy)], [source_y + round(inaccuracy_y*inaccuracy)], [source_z]!</span>")

/obj/effect/decal/cleanable/bluespace_remains/Initialize(mapload, sour_x, sour_y, sour_z, sour_owner)
	. = ..()
	if(sour_x)
		source_x = sour_x
		inaccuracy_x = rand(-30,30)
	if(sour_y)
		source_y = sour_y
		inaccuracy_y = rand(-30,30)
	if(sour_z)
		source_z = sour_z
	if(sour_owner)
		source_owner = sour_owner
