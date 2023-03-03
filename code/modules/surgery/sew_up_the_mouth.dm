/datum/surgery/sew_up_the_mouth
	name = "Зашить Рот"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/retract_skin, /datum/surgery_step/clamp_bleeders, /datum/surgery_step/incise, /datum/surgery_step/sew_up_the_mouth)
	possible_locs = list(BODY_ZONE_PRECISE_MOUTH)
	requires_bodypart_type = BODYPART_ORGANIC

/datum/surgery_step/sew_up_the_mouth/proc/sew_preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>Вы начинаете зашивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>...</span>",
		"<b>[user]</b> начинает зашивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>.",
		"<b>[user]</b> начинает зашивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>.")

/datum/surgery_step/sew_up_the_mouth/tool_check(mob/user, obj/item/tool)
	if(implement_type == TOOL_WELDER || implement_type == /obj/item)
		return tool.get_temperature()
	return TRUE

/datum/surgery_step/sew_up_the_mouth/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if (ishuman(target))
		var/mob/living/carbon/human/H = target
		var/obj/item/bodypart/BP = H.get_bodypart(target_zone)
		if(BP)
			BP.generic_bleedstacks -= 3
	return ..()

/datum/surgery_step/proc/sew_up_the_mouth(mob/living/carbon/human/owner)
	ADD_TRAIT(owner, TRAIT_MUTE, GENETIC_MUTATION)

/datum/surgery/unsew_up_the_mouth
	name = "Расшить Рот"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/retract_skin, /datum/surgery_step/clamp_bleeders, /datum/surgery_step/incise, /datum/surgery_step/close)
	possible_locs = list(BODY_ZONE_PRECISE_MOUTH)
	requires_bodypart_type = BODYPART_ORGANIC

/datum/surgery_step/unsew_up_the_mouth/proc/unsew_preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>Вы начинаете расшивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>...</span>",
		"<b>[user]</b> начинает расшивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>.",
		"<b>[user]</b> начинает расшивать <b>[parse_zone(target_zone)]</b> <b>[target]</b>.")

/datum/surgery_step/unsew_up_the_mouth/tool_check(mob/user, obj/item/tool)
	if(implement_type == TOOL_WELDER || implement_type == /obj/item)
		return tool.get_temperature()
	return TRUE

/datum/surgery_step/unsew_up_the_mouth/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if (ishuman(target))
		var/mob/living/carbon/human/H = target
		var/obj/item/bodypart/BP = H.get_bodypart(target_zone)
		if(BP)
			BP.generic_bleedstacks -= 3
	return ..()

/datum/surgery_step/proc/unsew_up_the_mouth(mob/living/carbon/human/owner)
	REMOVE_TRAIT(owner, TRAIT_MUTE, GENETIC_MUTATION)

/mob/living/carbon/attackby(knife, mob/living/user, zone_selected)
	if(user.a_intent == INTENT_HELP && HAS_TRAIT(src, TRAIT_MUTE))
		if(user.zone_selected == list(BODY_ZONE_PRECISE_MOUTH) && istype(knife, list(TOOL_SCALPEL, /obj/item/kitchen/knife, /obj/item/shard, TOOL_WIRECUTTER)))
			var/mob/living/carbon/human/target = src
			var/obj/item/bodypart/BP = user.get_bodypart(zone_selected)
			to_chat(user, "<span class='notice'>Вы начинаете разрезать свой рот подручным инструментом...</span>")
			to_chat(target, "<span class='notice'>Ваш <b>[parse_zone(BP)]</b> начинает разрезать <b>[target]</b>...</span>")
			to_chat(loc, "<b>[user]</b> начинает резать <b>[parse_zone(BP)]</b> <b>[target]</b>.")
			if(do_after(user, 60, target = target))
				target.adjustBruteLoss(rand(30,60))
				to_chat(user, "<span class='notice'>Вы начинаете разрезать свой рот подручным инструментом...</span>")
				to_chat(target, "[user] с успехом справляется с трудностью!")
				to_chat(loc, "[user] завершает свою работу.")
				new/obj/effect/decal/cleanable/blood(loc)
	else . = ..()
