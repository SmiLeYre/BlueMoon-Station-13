/datum/element/mob_holder/micro

/datum/element/mob_holder/micro/Attach(datum/target, worn_state, alt_worn, right_hand, left_hand, inv_slots = NONE, proctype, escape_on_find)
	. = ..()

	RegisterSignal(target, COMSIG_CLICK_ALT, PROC_REF(mob_try_alt_action), TRUE) // BLUEMOON EDIT, WAS mob_try_pickup_micro - для распределения на alt действий по давке, подбирании
	RegisterSignal(target, COMSIG_MICRO_PICKUP_FEET, PROC_REF(mob_pickup_micro_feet))
	RegisterSignal(target, COMSIG_MOB_RESIZED, PROC_REF(on_resize))

/datum/element/mob_holder/micro/Detach(datum/source, force)
	. = ..()
	UnregisterSignal(source, COMSIG_MICRO_PICKUP_FEET)

/datum/element/mob_holder/micro/proc/on_resize(mob/living/micro, new_size, old_size)
	var/obj/item/clothing/head/mob_holder/holder = micro.loc
	if(istype(holder))
		var/mob/living/living = get_atom_on_turf(micro.loc, /mob/living)
		var/compare_size = 1
		if(HAS_TRAIT(micro, TRAIT_BLUEMOON_LIGHT))
			compare_size = 0.8
		if(living && (COMPARE_SIZES(living, micro)) < (compare_size / CONFIG_GET(number/max_pick_ratio)))
			living.visible_message(span_warning("\The [living] drops [micro] as [micro.p_they()] grow\s too big to carry."),
								span_warning("You drop \The [living] as [living.p_they()] grow\s too big to carry."),
								target=micro,
								target_message=span_notice("\The [living] drops you as you grow too big to carry."))
			holder.release()
		else if(!istype(living)) // Somehow a inside a mob_holder and the mob_holder isn't inside any livings? release.
			holder.release()

/datum/element/mob_holder/micro/on_examine(mob/living/source, mob/user, list/examine_list)
	var/compare_size = 1
	if(HAS_TRAIT(source, TRAIT_BLUEMOON_LIGHT))
		compare_size = 0.8
	if(ishuman(user) && !istype(source.loc, /obj/item/clothing/head/mob_holder) && (COMPARE_SIZES(user, source)) >= (compare_size / CONFIG_GET(number/max_pick_ratio)))
		examine_list += span_notice("Похоже [source.ru_ego(FALSE)] можно взять в руки через <b>Alt+Click</b> (grab) или раздавить (disarm/harm).")

/// Do not inherit from /mob_holder, interactions are different.
/datum/element/mob_holder/micro/on_requesting_context_from_item(
	obj/source,
	list/context,
	obj/item/held_item,
	mob/living/user,
)

	LAZYSET(context[SCREENTIP_CONTEXT_ALT_LMB], INTENT_GRAB, "Pick up")
	return CONTEXTUAL_SCREENTIP_SET

/datum/element/mob_holder/micro/proc/mob_pickup_micro(mob/living/source, mob/user)
	var/obj/item/clothing/head/mob_holder/micro/holder = new(get_turf(source), source, worn_state, alt_worn, right_hand, left_hand, inv_slots)
	if(!holder)
		return

	user.put_in_hands(holder)
	return

//shoehorned (get it?) and lazy way to do instant foot pickups cause haha funny.
/datum/element/mob_holder/micro/proc/mob_pickup_micro_feet(mob/living/source, mob/user)
	var/obj/item/clothing/head/mob_holder/micro/holder = new(get_turf(source), source, worn_state, alt_worn, right_hand, left_hand, inv_slots)
	if(!holder)
		return
	user.equip_to_slot(holder, ITEM_SLOT_FEET)
	return

/datum/element/mob_holder/micro/proc/mob_try_pickup_micro(mob/living/carbon/source, mob/living/carbon/user)
	if(!(user.a_intent == INTENT_GRAB))
		return FALSE
	if(!ishuman(user) || !user.Adjacent(source) || user.incapacitated())
		return FALSE
	if(source == user)
		to_chat(user, "<span class='warning'>You can't pick yourself up.</span>")
		source.balloon_alert(user, "cannot pick yourself!")
		return FALSE
	//BLUEMOON ADD лёгких персонажей легче взять
	var/compare_size = 1
	if(HAS_TRAIT(source, TRAIT_BLUEMOON_LIGHT))
		compare_size = 0.8
	if(COMPARE_SIZES(user, source) < (compare_size / CONFIG_GET(number/max_pick_ratio)))
	//BLUEMOON ADD END
		to_chat(user, span_warning("They're too big to pick up!"))
		source.balloon_alert(user, "too big to pick up!")
		return FALSE
	if(user.get_active_held_item())
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		source.balloon_alert(user, "hands are full!")
		return FALSE
	if(source.buckled)
		to_chat(user, "<span class='warning'>[source] is buckled to something!</span>")
		source.balloon_alert(user, "buckled to something!")
		return FALSE
	source.visible_message("<span class='warning'>[user] starts picking up [source].</span>", \
					"<span class='userdanger'>[user] starts picking you up!</span>")
	source.balloon_alert(user, "picking up")
	var/time_required = COMPARE_SIZES(source, user) * 4 SECONDS //Scale how fast the pickup will be depending on size difference
	if(get_size(source) > 0.5 && HAS_TRAIT(user, TRAIT_BLUEMOON_LIGHT)) //BLUEMOON ADD лёгкие большие персонажи дольше поднимают тех, кто имеет размер больше 50%
		time_required += 8 SECONDS //BLUEMOON ADD END
	if(!do_after(user, time_required, source))
		return FALSE

	if(user.get_active_held_item())
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		source.balloon_alert(user, "hands full!")
		return FALSE
	if(source.buckled)
		to_chat(user, "<span class='warning'>[source] is buckled to something!</span>")
		source.balloon_alert(user, "buckled!")
		return FALSE

	source.visible_message("<span class='warning'>[user] picks up [source]!</span>",
					"<span class='userdanger'>[user] picks you up!</span>",
					target = user,
					target_message = "<span class='notice'>You pick [source] up.</span>")
	source.drop_all_held_items()
	mob_pickup_micro(source, user)
	return TRUE

/obj/item/clothing/head/mob_holder/micro
	name = "micro"
	desc = "Another person, small enough to fit in your hand."
	icon = null
	icon_state = ""
	slot_flags = ITEM_SLOT_FEET | ITEM_SLOT_HEAD | ITEM_SLOT_ID | ITEM_SLOT_BACK | ITEM_SLOT_NECK
	w_class = null //handled by their size
	body_parts_covered = FEET // BLUEMOON ADD - чтобы нельзя было брать более 1 персонажа в ноги, TODO - сделать возможность брать несколько маленьких

/obj/item/clothing/head/mob_holder/micro/container_resist(mob/living/user)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You can't escape while you're restrained like this!</span>")
		return
	var/mob/living/L = get_atom_on_turf(src, /mob/living)
	visible_message(span_warning("[src] begins to squirm in [L]'s grasp!"))
	var/time_required = COMPARE_SIZES(L, user) / 4 SECONDS //Scale how fast the resisting will be depending on size difference
	if(get_size(user) > 0.5 && HAS_TRAIT(L, TRAIT_BLUEMOON_LIGHT)) //BLUEMOON ADD персонажу размером больше 50% выбраться из хватки лёгкого большого персонажа достаточно просто
		time_required = abs((1 / get_size(user))) / 4 SECONDS //BLUEMOON ADD END
	if(!do_after(user, time_required, L, IGNORE_TARGET_LOC_CHANGE|IGNORE_HELD_ITEM))
		if(!user || user.stat != CONSCIOUS || user.loc != src)
			return
		to_chat(loc, "<span class='warning'>[src] stops resisting.</span>")
		return
	visible_message("<span class='warning'>[src] escapes [L]!")
	release()

/obj/item/clothing/head/mob_holder/micro/MouseDrop(mob/M as mob)
	..()
	if(M != usr)
		return
	if(usr == src)
		return
	if(!Adjacent(usr))
		return
	if(istype(M,/mob/living/silicon/ai))
		return
	var/mob/living/carbon/human/O = held_mob
	if(istype(O))
		O.MouseDrop(usr)

/obj/item/clothing/head/mob_holder/micro/attack_self(mob/living/user)
	if(!user.CheckActionCooldown())
		return
	user.DelayNextAction(CLICK_CD_MELEE, flush = TRUE)
	var/mob/living/carbon/human/M = held_mob
	if(istype(M))
		if(user.a_intent == "harm") //TO:DO, rework all of these interactions to be a lot more in depth
			visible_message("<span class='danger'>[user] slams their fist down on [M]!</span>", runechat_popup = TRUE, rune_msg = " slams their fist down on [M]!")
			playsound(loc, 'sound/weapons/punch1.ogg', 50, 1)
			M.adjustBruteLoss(5)
			return
		if(user.a_intent == "disarm")
			visible_message("<span class='danger'>[user] pins [M] down with a finger!</span>", runechat_popup = TRUE, rune_msg = " pins [M] down with a finger!")
			playsound(loc, 'sound/effects/bodyfall1.ogg', 50, 1)
			M.adjustStaminaLoss(10)
			return
		if(user.a_intent == "grab")
			visible_message("<span class='danger'>[user] squeezes their fist around [M]!</span>", runechat_popup = TRUE, rune_msg = " squeezes their fist around [M]!")
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1)
			M.adjustOxyLoss(5)
			return
		M.help_shake_act(user)

/obj/item/clothing/head/mob_holder/micro/attacked_by(obj/item/I, mob/living/user)
	return held_mob?.attacked_by(I, user) || ..()

/mob/living/Adjacent(atom/neighbor)
	. = ..()
	var/obj/item/clothing/head/mob_holder/micro/micro_holder = loc
	if(istype(micro_holder))
		return micro_holder.Adjacent(neighbor)

/obj/item/clothing/head/mob_holder/micro/attack(mob/living/pred, mob/living/user)
	user.vore_attack(user, held_mob, pred)
	return STOP_ATTACK_PROC_CHAIN

/obj/item/clothing/head/mob_holder/micro/verb/interact_with()
	set name = "Interact With"
	set desc = "Perform an interaction with someone."
	set category = "IC"
	set src in view(usr.client)

	var/datum/component/interaction_menu_granter/menu = usr.GetComponent(/datum/component/interaction_menu_granter)
	if(!menu)
		to_chat(usr, span_warning("You must have done something really bad to not have an interaction component."))
		return

	if(!src)
		to_chat(usr, span_warning("Your interaction target is gone!"))
		return
	menu.open_menu(usr, held_mob)

/obj/item/clothing/head/mob_holder/micro/GetAccess()
	. = ..()
	var/obj/item/held = held_mob.get_active_held_item()
	if(held)
		. += held.GetAccess()
	var/mob/living/carbon/human/human_micro = held_mob
	if(istype(human_micro))
		. += human_micro.wear_id?.GetAccess()
		. += human_micro.wear_neck?.GetAccess()

/obj/item/clothing/head/mob_holder/micro/GetID()
	. = ..()
	if(.)
		return
	var/obj/item/held = held_mob.get_active_held_item()
	if(isidcard(held))
		return held
	var/mob/living/carbon/human/human_micro = held_mob
	if(istype(human_micro) && isidcard(human_micro.wear_id))
		return human_micro.wear_id
