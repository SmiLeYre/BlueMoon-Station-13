/turf/open/floor/plating
	var/unfastened = FALSE

/turf/open/floor/plating/examine(mob/user)
	. = ..()
	if(!(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space)))
		. += "<span class='notice'>\The [src] cannot be removed from the floor.</span>"
	else if(unfastened)
		. += "<span class='notice'>\The [src] could be <b>welded</b> off the floor.</span>"
		. += "<span class='warning'>The screws on [src] appear loose.</span>"
	else
		. += "<span class='notice'>The screws on [src] could be loosened with <b>a screwdriver</b>.</span>"

/turf/open/floor/plating/screwdriver_act(mob/living/user, obj/item/I)
	if(type == /turf/open/floor/plating)
		if(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space))
			to_chat(user, "<span class='notice'>You start [unfastened ? "fastening" : "unfastening"] [src].</span>")
			balloon_alert(user, "[unfastened ? "fastening" : "unfastening"]")
			if(!I.use_tool(src, user, 20, volume = 80))
				return
			to_chat(user, "<span class='notice'>You [unfastened ? "fasten" : "unfasten"] [src].</span>")
			balloon_alert(user, "[unfastened ? "fastened" : "unfastened"]")
			unfastened = !unfastened
		else
			to_chat(user, "<span class='warning'>You cannot remove this plating.</span>")
			balloon_alert(user, "can't remove!")
			return

/turf/open/floor/plating/welder_act(mob/living/user, obj/item/I)
	. = ..()
	if(type == /turf/open/floor/plating && unfastened)
		if(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space))
			to_chat(user, "<span class='warning'>You start removing [src], exposing space after you're done!</span>")
			balloon_alert(user, "removing")
			if(!I.use_tool(src, user, 50, volume = 160)) //extra loud to let people know something's going down
				return
			new /obj/item/stack/tile/plasteel(get_turf(src))
			ReplaceWithLattice()
			to_chat(user, "<span class='notice'>You remove [src].</span>")
			balloon_alert(user, "removed")
			return
		else
			return
