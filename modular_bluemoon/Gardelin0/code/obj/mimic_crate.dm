/obj/structure/closet
	var/tentacle_corrupted =FALSE
	var/tentacle_pit = FALSE
	var/icon_tentacle_corrupted = "corrupted" //I will relocate this later
	var/icon_tentacle_pit = "pit" //And this too

/obj/structure/closet/examine(mob/user)
	. = ..()
	if(tentacle_corrupted)
		. += "<span class='notice'>It has a lot of tentacles inside! They seem very lively!</span>"
	if(tentacle_pit)
		. += "<span class='notice'>It has a lot of tentacles inside! They seem to form some kind of a structue!</span>"

/obj/structure/closet/closet_update_overlays(list/new_overlays)
	. = ..()
	. = new_overlays
	if(tentacle_corrupted)
		if(opened)
			. += "[icon_tentacle_corrupted]_open"
			return
		. += "[icon_tentacle_corrupted]"
	if(tentacle_pit)
		if(opened)
			. += "[icon_tentacle_pit]_open"
			return
		. += "[icon_tentacle_pit]"

/obj/structure/closet/crate/closet_update_overlays(list/new_overlays)
	. = ..()
	. = new_overlays
	if(tentacle_corrupted)
		if(opened)
			. += "[icon_tentacle_corrupted]_open"
			return
		. += "[icon_tentacle_corrupted]"
	if(tentacle_pit)
		if(opened)
			. += "[icon_tentacle_pit]_open"
			return
		. += "[icon_tentacle_pit]"

/obj/structure/closet/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/reagent_containers/food/snacks/cube/tentacles))
		src.tentacle_corrupted = TRUE
		qdel(I)
		update_icon()
		update_overlays()

/obj/structure/closet/proc/fuck(mob/living/carbon/human/M)
	if(!tentacle_corrupted)
		return

	if(M.has_penis())
		to_chat(M, span_userdanger(pick("Движения в уретре сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена!")))
	if(M.has_vagina())
		to_chat(M, span_userdanger(pick("Сильные фрикции внутри сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своих дырочек!")))
	M.handle_post_sex(NORMAL_LUST*2, null, M)

	M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, 60, PLUG13_DURATION_NORMAL)

/obj/structure/closet/crate/open(mob/living/user, force = FALSE)
	..()
	if(tentacle_corrupted)
		user.visible_message("<span class='warning'>Щупальца утаскивают [user] внутрь [src]!.</span>")
		user.forceMove(src.loc)
		user.set_resting(TRUE)
		close()

/obj/structure/closet/close()
	..()
	for(var/atom/movable/AM in src.contents)
		spawn()
			while(!opened)
				if(activate_after(src, rand(5,8)))
					if(AM in src.contents)
						fuck(AM)

/obj/structure/closet/Crossed(mob/living/carbon/human/M)
	..()
	if(opened && tentacle_corrupted)
		close()
