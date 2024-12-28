GLOBAL_LIST_EMPTY(roundstart_prisoners)

/datum/job/prisoner
	custom_spawn_text = "если вы НАЧАЛИ смену за заключённого, вы ОБЯЗАНЫ пройти к бригу для проведения процедуры заключения. Вам ЗАПРЕЩЕНО совершать побег без уведомления администрации, только если вашей жизни не угрожает опасность."

/datum/job/prisoner/after_spawn(mob/living/carbon/human/H, mob/M, latejoin)
	. = ..()
	if(!latejoin)
		GLOB.roundstart_prisoners += H
