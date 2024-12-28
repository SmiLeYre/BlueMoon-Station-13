/datum/interaction/proc/special_check(mob/living/user, mob/living/target)
	if(description == "Шлёпнуть по заднице.") // Почему это всё не в дефайнах?
		if((target.client?.prefs.cit_toggles & NO_ASS_SLAP) && target != user)
			to_chat(user, span_warning("По какой-то причине, вы не можете сделать это с [target]."))
			to_chat(user, span_warning(span_small("Игрок отключил механическую возможность шлепать себя. Попробуйте отыгрывать это через действия.")))
			return FALSE
		if(ishuman(user) && ishuman(target) && HAS_TRAIT(target, TRAIT_STEEL_ASS))
			var/mob/living/carbon/human/human_user = user
			if(prob(10))
				var/obj/item/bodypart/bodypart = human_user.get_active_hand()
				if(istype(bodypart))
					var/datum/wound/blunt/moderate/moderate_wound = new
					moderate_wound.apply_wound(bodypart)
			human_user.adjustStaminaLoss(75)
			human_user.Stun(3 SECONDS)
			human_user.visible_message(\
				span_danger("\The [user] slaps \the [target]'s ass, but their hand bounces off like they hit metal!"),\
				span_danger("You slap [user == target ? "your" : "\the [target]'s"] ass, but feel an intense amount of pain as you realise their buns are harder than steel!"),\
				"You hear a slap."
			)
			var/list/ouchies = list(
				'modular_splurt/sound/effects/pan0.ogg',
				'modular_splurt/sound/effects/pan1.ogg'
			)
			playsound(target.loc, pick(ouchies), 15, 1, -1)
			if(!isrobotic(user))
				user.emote("scream")
			return FALSE
	return TRUE
