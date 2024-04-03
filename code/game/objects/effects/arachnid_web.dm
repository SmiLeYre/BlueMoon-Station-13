/obj/structure/spider/stickyweb/arachnid
    name = "large web"
    icon = 'icons/effects/effects.dmi'
    desc = "It's stringy and sticky, but the threads are larger than what spiderlings could produce."
    anchored = TRUE
    density = FALSE
    max_integrity = 20

/obj/structure/spider/stickyweb/arachnid/New()
	..()
	icon_state = pick(list("stickyweb1", "stickyweb2"))

/obj/structure/spider/stickyweb/arachnid/cocoon
	name = "cocoon"
	desc = "Something wrapped in silky spider web."
	icon_state = "cocoon1"
	anchored = FALSE
	density = FALSE
	max_integrity = 60

/obj/structure/spider/stickyweb/arachnid/cocoon/Initialize(mapload)
	icon_state = pick("cocoon1","cocoon2","cocoon3")
	. = ..()

/obj/structure/spider/stickyweb/arachnid/cocoon/container_resist(mob/living/user)
	var/breakout_time = 150 // DECI not DECA ffs
	to_chat(user, "<span class='notice'>You struggle against the tight bonds... (This will take about [DisplayTimeText(breakout_time)].)</span>")
	visible_message("<span class='notice'>You see something struggling and writhing in \the [src]!</span>")
	if(do_after(user,(breakout_time), target = src))
		if(!user || user.stat != CONSCIOUS || user.loc != src)
			return
		qdel(src)

/obj/structure/spider/stickyweb/arachnid/cocoon/Destroy()
	var/turf/T = get_turf(src)
	src.visible_message("<span class='warning'>\The [src] splits open.</span>")
	for(var/atom/movable/A in contents)
		A.forceMove(T)
	return ..()
