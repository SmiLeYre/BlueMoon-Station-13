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
