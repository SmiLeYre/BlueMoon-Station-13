#define TRAIT_CUMJARRED "trait_cumjarred"

/obj/item/cum_jar
	name = "Подозрительная Банка"
	desc = "Внутри что-то плескается. На ощупь тёплая."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "cum"
	resistance_flags = INDESTRUCTIBLE | ACID_PROOF | LAVA_PROOF
	var/mob/living/prisoner

/obj/item/cum_jar/Initialize(mapload)
	. = ..()
	if(!isliving(loc))
		qdel(src)
		return
	prisoner = loc
	visible_message("Под [prisoner.name] появляется банка и засасывает его внутрь!")
	src.forceMove(get_turf(prisoner))
	prisoner.forceMove(src)
	ADD_TRAIT(prisoner, TRAIT_EMOTEMUTE, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_MUTE, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_NEARSIGHT, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_CLUMSY, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_HANDS_BLOCKED, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_IMMOBILIZED, TRAIT_CUMJARRED)
	ADD_TRAIT(prisoner, TRAIT_NODEATH, TRAIT_CUMJARRED)

/obj/item/cum_jar/Destroy()
	if(isnull(prisoner))
		return ..()
	prisoner.forceMove(drop_location())
	REMOVE_TRAIT(prisoner, TRAIT_EMOTEMUTE, TRAIT_CUMJARRED)
	REMOVE_TRAIT(prisoner, TRAIT_MUTE, TRAIT_CUMJARRED)
	REMOVE_TRAIT(prisoner, TRAIT_NEARSIGHT, TRAIT_CUMJARRED)
	REMOVE_TRAIT(prisoner, TRAIT_HANDS_BLOCKED, TRAIT_CUMJARRED)
	REMOVE_TRAIT(prisoner, TRAIT_IMMOBILIZED, TRAIT_CUMJARRED)
	REMOVE_TRAIT(prisoner, TRAIT_NODEATH, TRAIT_CUMJARRED)
	prisoner.Paralyze(15 SECONDS)
	prisoner.Knockdown(45 SECONDS)
	visible_message("[name] пропадает, оставляя за собой [prisoner.name], обмазанного чем-то белым и вонючим!")
	. = ..()

#undef TRAIT_CUMJARRED
