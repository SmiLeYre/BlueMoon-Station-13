/datum/quirk/onelife
	name = "Одна жизнь"
	desc = "С вас буквально сыпется песок. И... Кажется если вы погибнете - никто этот песок собрать воедино больше не сможет."
	mob_trait = TRAIT_ONELIFE
	value = -4
	gain_text = "<span class='danger'>Вы чувствуете что вам нельзя умирать.</span>"
	lose_text = "<span class='notice'>Жизнь для вас снова ничто.</span>" //if only it were that easy!
	medical_record_text = "Пациент не сможет восстановиться после смерти."
	processing_quirk = TRUE

/mob/living/carbon/BiologicalLife(delta_time, times_fired)
	. = ..()
	var/datum/quirk/onelife/quirk
	if(stat == DEAD)
		if(has_quirk(quirk))
			dust(TRUE, TRUE, TRUE)
	return

/obj/item/implant/onelife
	icon_state = ""
	actions_types = list()

/obj/item/implant/onelife/trigger(emote, mob/source)
	if(emote == "deathgasp")
		activate("death")

/obj/item/implant/onelife/activate(cause)
	. = ..()
	imp_in.dust(TRUE, TRUE, TRUE)

/datum/quirk/onelife/add()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return
	var/obj/item/implant/onelife/E = new
	E.implant(H)
	H.update_icons()
