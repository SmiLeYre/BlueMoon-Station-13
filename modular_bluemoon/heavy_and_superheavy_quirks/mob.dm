/mob/can_be_pulled(user)
	if(ismob(user))
		var/mob/user_mob = user
		if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY_SUPER)) // сверхтяжёлых персонажей нельзя тащить, не соблюдая определённые условия
			var/can_pull = FALSE
			if(isalien(user_mob)) // чужие (мобы) могут тащить
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
				/* на будущее, если понадобятся проверки на предмет в руке
				var/item_in_hand = human_pulling.get_active_held_item()
				if(istype(item_in_hand, /obj/item/gun/magic/contractor_hook)) // персонажи с некоторыми предметами в активной руке могут тащить
					can_pull = TRUE
				*/
			if(!can_pull)
				user_mob.visible_message("[user] tried to pull [src], but [p_they()] are too heavy for them!", span_warning("[src] is too heavy, you cannot move them around!"))
				to_chat(user, span_warning(span_small("Вы можете перемещать сверхтяжёлый персонажей: будучи чужим-антагонистом, еретиком-антагонистом, абдуктором-антагонистом. \
				Также, будучи халком, сверхтяжёлым персонажем или киборгом. Ещё можно использовать толчок на мехе и МОД с гидравлической клешней."))) //красный текст + маленький размер
				playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				stop_pulling()
				return
	. = ..()
