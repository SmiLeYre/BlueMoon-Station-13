/datum/quirk/body_morpher
	name = "Изменятель Тела"
	desc = "Каким-то образом вы развили способность, позволяющую вашему телу морфировать и изменять свои части тела, подобно тому, как это может делать слаймик."
	value = 0
	mob_trait = TRAIT_BODY_MORPHER
	gain_text = span_notice("Ваше тело становится более податливым...")
	lose_text = span_notice("Ваше тело более упругое, чем раньше.")
	medical_record_text = "Тело пациента кажется необычайно податливым."
	var/datum/action/innate/ability/humanoid_customization/alter_form_action

/datum/quirk/body_morpher/add()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Add quirk ability action datum
	alter_form_action = new
	alter_form_action.Grant(quirk_mob)

/datum/quirk/body_morpher/remove()
	// Define quirk mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// Remove quirk ability action datum
	// BLUEMOON EDIT START - sanity check
	if(!quirk_mob)
		return
	// BLUEMOON EDIT END
	alter_form_action.Remove(quirk_mob)
	QDEL_NULL(alter_form_action)
