/obj/structure/dead_syndie
	name = "syndicate synthetic"
	desc = "Повешеный на своих же проводах прототип Боевых Машин Синдиката. Кажется с него стекает кровь."
	icon = 'modular_bluemoon/krashly/icons/obj/32x64.dmi'
	icon_state = "syndproto"
	density = TRUE
	climbable = FALSE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF | ACID_PROOF | UNACIDABLE
	max_integrity = 300
	integrity_failure = 0.1
	layer = 5

/obj/structure/dead_syndie/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(W.tool_behaviour == TOOL_WIRECUTTER)
		to_chat(user, "<span class='notice'>Вы начинаете срезать провода с потолка...</span>")
		if(W.use_tool(src, user, 40, volume=50))
			to_chat(user, "<span class='notice'>Вы успешно срезали проводку.</span>")
			qdel(src)
			new /obj/effect/decal/cleanable/blood/gibs/old(src)
	else
		return ..()
