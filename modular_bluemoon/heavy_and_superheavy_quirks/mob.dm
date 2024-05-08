// ПЕРЕМЕННЫЕ ДЛЯ МОБОВ

/mob/living
	var/can_pull_superheavy_entities = FALSE // сокращаем количество проверок

/mob/living/carbon/alien // Чужие могут тянуть сверхтяжёлых персонажей
	can_pull_superheavy_entities = TRUE

/mob/living/silicon // Киборгам хватает сил тянуть сверхтяжей
	can_pull_superheavy_entities = TRUE

/mob/living/silicon/pai // Это наследник киборгов, ему нельзя тянуть сверхтяжей. ПИИ-мышка, нет-нет
	can_pull_superheavy_entities = FALSE

/mob/living/simple_animal/slaughter // Демон резни должен мочь тянуть, чтобы затаскивать их в кровь
	can_pull_superheavy_entities = TRUE

// ВОЗМОЖНОСТЬ ВЗЯТЬ В PULL СВЕРХТЯЖЁЛОГО ПЕРСОНАЖА

/mob/can_be_pulled(user)
	if(isliving(user))
		var/mob/living/user_mob = user
		if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY_SUPER)) // сверхтяжёлых персонажей нельзя тащить, не соблюдая определённые условия
			var/can_pull = FALSE
			if(user_mob.can_pull_superheavy_entities) // Моб простой и может тащить такого персонажа
				can_pull = TRUE
			if(HAS_TRAIT(user_mob, TRAIT_BLUEMOON_HEAVY_SUPER) || HAS_TRAIT(user_mob, TRAIT_BLUEMOON_HEAVY)) // другие сверхтяжёлые или тяжёлые персонажи могут тащить
				can_pull = TRUE
			if(ishuman(user_mob))
				var/mob/living/carbon/human/human_pulling = user
				if(user_mob.mind?.antag_datums)
					can_pull = TRUE
				if(user_mob.mind?.has_antag_datum(/datum/antagonist/ghost_role))
					can_pull = FALSE
				if(HAS_TRAIT(user_mob, TRAIT_PUGILIST))
					can_pull = TRUE
				if(human_pulling.dna.check_mutation(HULK)) // халки могут тащить
					can_pull = TRUE
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
				user_mob.visible_message("[user] пробует потянуть [src] за собой, но это безуспешно!", span_warning("[src] ощущается слишком грузно, переместить в таком виде будет невозможно!"))
				to_chat(user, span_warning(span_small("Вы можете перемещать сверхтяжёлый персонажей: будучи чужим-антагонистом, еретиком-антагонистом, абдуктором-антагонистом. \
				Также, будучи халком, сверхтяжёлым персонажем или киборгом. Ещё можно использовать толчок на мехе и МОД с гидравлической клешней."))) //красный текст + маленький размер
				playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				stop_pulling()
				return
	. = ..()
