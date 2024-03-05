/datum/surgery/advanced/pacify
	name = "Pacification"
	desc = "A surgical procedure which permanently inhibits the aggression center of the brain, making the patient unwilling to cause direct harm."
	steps = list(/datum/surgery_step/incise,
				/datum/surgery_step/retract_skin,
				/datum/surgery_step/saw,
				/datum/surgery_step/clamp_bleeders,
				/datum/surgery_step/pacify,
				/datum/surgery_step/close)

	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_HEAD)
	requires_bodypart_type = 0

//	special_surgery_traits = list(OPERATION_MUST_BE_PERFORMED_AWAKE) // BLUEMOON ADD - операции на мозги проводятся, когда пациент находится в сознаии

/datum/surgery/advanced/pacify/can_start(mob/user, mob/living/carbon/target, obj/item/tool)
	. = ..()
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!B || isrobotic(target)) // BLUEMOON EDIT - изменение неподходящих для синтетиков операций
		return FALSE
	return TRUE

/datum/surgery_step/pacify
	name = "Провести Пацификацию"
	implements = list(TOOL_HEMOSTAT = 100, TOOL_SCREWDRIVER = 35, /obj/item/pen = 15)
	time = 40
	preop_sound = 'sound/surgery/hemostat1.ogg'
	success_sound = 'sound/surgery/hemostat1.ogg'
	failure_sound = 'sound/surgery/organ2.ogg'

/datum/surgery_step/pacify/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to pacify [target]...</span>",
		"[user] begins to fix [target]'s brain.",
		"[user] begins to perform surgery on [target]'s brain.")

/datum/surgery_step/pacify/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You succeed in neurologically pacifying [target].</span>",
		"[user] successfully fixes [target]'s brain!",
		"[user] completes the surgery on [target]'s brain.")
	target.gain_trauma(/datum/brain_trauma/severe/pacifism, TRAUMA_RESILIENCE_LOBOTOMY)
	return TRUE

/datum/surgery_step/pacify/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You screw up, rewiring [target]'s brain the wrong way around...</span>",
			"<span class='warning'>[user] screws up, causing brain damage!</span>",
			"[user] completes the surgery on [target]'s brain.")
	target.gain_trauma_type(BRAIN_TRAUMA_SEVERE, TRAUMA_RESILIENCE_LOBOTOMY)
	return FALSE

// BLUEMOON ADD START - пацификация для синтетиков
/datum/surgery/advanced/pacify/robotic
	name = "Pacification Protocols Enforcement"
	desc = "The operation that installs a filter on the I/O of the positronic brain, which automatically suppresses any attempts to harm others."
	steps = list(
				/datum/surgery_step/mechanic_open,
				/datum/surgery_step/mechanic_unwrench,
				/datum/surgery_step/pry_off_plating,
				/datum/surgery_step/prepare_electronics,
				/datum/surgery_step/pacify/robotic,
				/datum/surgery_step/mechanic_close)

/datum/surgery_step/pacify/robotic
	name = "Установить Протоколы Пацификации (Мультитул)"
	implements = list(TOOL_MULTITOOL = 100, /obj/item/disk = 30, /obj/item/modular_computer = 100, /obj/item/pda = 80)
	time = 40
	preop_sound = null
	success_sound = null
	failure_sound = null

/datum/surgery/advanced/pacify/can_start(mob/user, mob/living/carbon/target, obj/item/tool)
	. = ..()
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!B || !isrobotic(target))
		return FALSE
	return TRUE
// BLUEMOON ADD END
