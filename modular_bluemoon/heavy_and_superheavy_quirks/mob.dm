/mob/can_be_pulled(user)
	if(ismob(user))
		var/mob/user_mob = user
		if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY_SUPER))
			var/can_pull = FALSE
			if(isalien(user_mob)) // чужие (с абилками) могут тащить
				can_pull = TRUE
			if(issilicon(user_mob)) // киборги могут тащить
				can_pull = TRUE
			if(HAS_TRAIT(user_mob, TRAIT_BLUEMOON_HEAVY_SUPER)) // другие сверхтяжёлые персонажи могут тащить
				can_pull = TRUE
			if(ishuman(user_mob))
				var/mob/living/carbon/human/human_pulling = user
				if(human_pulling.dna.check_mutation(HULK)) // халки могут тащить
					can_pull = TRUE
				for(var/datum/antagonist/antagonist_role in human_pulling.mind?.antag_datums) // некоторые антагонисты могут тащить
					if(antagonist_role.type in list(/datum/antagonist/heretic, /datum/antagonist/abductor/agent, /datum/antagonist/abductor/scientist))
						can_pull = TRUE
						break
				if(istype(human_pulling.back, /obj/item/mod/control)) // обычные персонажи с активированными клешнями из МОДа на спине могут тащить
					var/obj/item/mod/control/MOD = human_pulling.back
					if(MOD.active && istype(MOD.selected_module, /obj/item/mod/module/clamp))
						can_pull = TRUE
				var/item_in_hand = human_pulling.get_active_held_item()
				if(istype(item_in_hand, /obj/item/gun/magic/contractor_hook)) // персонажи с некоторыми предметами в активной руке могут тащить
					can_pull = TRUE
			if(!can_pull)
				to_chat(user, span_warning("[src] is too heavy, you cannot move them around!"))
				stop_pulling()
				return
	. = ..()
