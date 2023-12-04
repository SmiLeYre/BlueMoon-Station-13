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

/obj/structure/desk_bell
	name = "desk bell"
	desc = "Динь-дон!"
	icon = 'modular_bluemoon/krashly/icons/obj/structures.dmi'
	icon_state = "table-bell"
	layer = OBJ_LAYER
	anchored = FALSE
	pass_flags = PASSTABLE
	max_integrity = 5000
	var/times_rang = 0
	var/broken_ringer = FALSE
	COOLDOWN_DECLARE(ring_cooldown)
	var/ring_cooldown_length = 0.3 SECONDS
	var/ring_sound = 'sound/machines/microwave/microwave-end.ogg'

/obj/structure/desk_bell/Initialize(mapload)
	. = ..()
	register_context()

/obj/structure/desk_bell/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	if(held_item?.tool_behaviour == TOOL_WRENCH)
		context[SCREENTIP_CONTEXT_RMB] = "Откручено"
		return CONTEXTUAL_SCREENTIP_SET

	if(broken_ringer)
		if(held_item?.tool_behaviour == TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_LMB] = "Починено"
	else
		var/click_context = "Дзынь"
		if(prob(1))
			click_context = "Бзык"
		context[SCREENTIP_CONTEXT_LMB] = click_context
	return CONTEXTUAL_SCREENTIP_SET

/obj/structure/desk_bell/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!COOLDOWN_FINISHED(src, ring_cooldown) && ring_cooldown_length)
		return TRUE
	if(!ring_bell(user))
		to_chat(user, span_notice("[src] молчит. Кажется какой-то идиот его сломал."))
	if(ring_cooldown_length)
		COOLDOWN_START(src, ring_cooldown, ring_cooldown_length)
	return TRUE

/obj/structure/desk_bell/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/obj/structure/desk_bell/attackby(obj/item/weapon, mob/living/user, params)
	. = ..()
	times_rang += weapon.force
	ring_bell(user)

// Fix the clapper
/obj/structure/desk_bell/screwdriver_act(mob/living/user, obj/item/tool)
	if(broken_ringer)
		balloon_alert(user, "восстанавливаю...")
		tool.play_tool_sound(src)
		if(tool.use_tool(src, user, 5 SECONDS))
			balloon_alert_to_viewers("починено")
			playsound(user, 'sound/items/change_drill.ogg', 50, vary = TRUE)
			broken_ringer = FALSE
			times_rang = 0
			return TOOL_ACT_TOOLTYPE_SUCCESS
		return FALSE
	return ..()

// Deconstruct
/obj/structure/desk_bell/wrench_act(mob/living/user, obj/item/tool)
	balloon_alert(user, "разбираю...")
	tool.play_tool_sound(src)
	if(tool.use_tool(src, user, 5 SECONDS))
		balloon_alert(user, "разобрано")
		playsound(user, 'sound/items/deconstruct.ogg', 50, vary = TRUE)
		if(!broken_ringer)
			new/obj/item/stack/sheet/metal(drop_location())
		new/obj/item/stack/sheet/metal(drop_location())
		qdel(src)
		return TOOL_ACT_TOOLTYPE_SUCCESS
	return ..()

/// Check if the clapper breaks, and if it does, break it
/obj/structure/desk_bell/proc/check_clapper(mob/living/user)
	if(((times_rang >= 10000) || prob(times_rang/100)) && ring_cooldown_length)
		to_chat(user, span_notice("Вы слышите как [src]'s молоточек срывается с пружины. Отличная работа, ты его сломал."))
		broken_ringer = TRUE

/// Ring the bell
/obj/structure/desk_bell/proc/ring_bell(mob/living/user)
	if(broken_ringer)
		return FALSE
	check_clapper(user)
	playsound(src, ring_sound, 70, vary = broken_ringer, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)
	flick("table-bell_ding", src)
	times_rang++
	return TRUE
