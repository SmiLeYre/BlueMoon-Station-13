/datum/interaction/proc/special_check(mob/living/user, mob/living/target)
	if(description == "Шлёпнуть по заднице.") // Почему это всё не в дефайнах?
		if((target.client?.prefs.cit_toggles & NO_ASS_SLAP) && target != user)
			to_chat(user, span_warning("По какой-то причине, вы не можете сделать это с [target]."))
			to_chat(user, span_warning(span_small("Игрок отключил механическую возможность шлепать себя. Попробуйте отыгрывать это через действия.")))
			return FALSE
	return TRUE
