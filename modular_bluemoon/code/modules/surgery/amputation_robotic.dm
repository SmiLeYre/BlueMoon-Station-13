/datum/surgery/amputation/robotic
	name = "Robotic Amputation"
	steps = list(
	/datum/surgery_step/mechanic_open,
	/datum/surgery_step/mechanic_unwrench,
	/datum/surgery_step/pry_off_plating,
	/datum/surgery_step/prepare_electronics,
	/datum/surgery_step/cut_wires,
	/datum/surgery_step/deatech_limb)
	requires_bodypart_type = BODYPART_HYBRID
	special_surgery_traits = list() // Не требуется анестезия

/datum/surgery_step/deatech_limb
	name = "Отцепить конечность рукой"
	accept_hand = 1
	time = 64
	preop_sound = 'sound/items/ratchet.ogg'
	preop_sound = 'sound/machines/doorclick.ogg'

/datum/surgery_step/deatech_limb/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to deattach [target]'s [parse_zone(target_zone)]...</span>",
		"[user] begins to deattach [target]'s [parse_zone(target_zone)].",
		"[user] begins to deattach [target]'s [parse_zone(target_zone)].")

/datum/surgery_step/deatech_limb/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/L = target
	display_results(user, target, "<span class='notice'>You deattach [L]'s [parse_zone(target_zone)].</span>",
		"[user] deattaches [L]'s [parse_zone(target_zone)]!",
		"[user] deattaches [L]'s [parse_zone(target_zone)]!")
	if(surgery.operated_bodypart)
		var/obj/item/bodypart/target_limb = surgery.operated_bodypart
		target_limb.drop_limb()
	return 1
