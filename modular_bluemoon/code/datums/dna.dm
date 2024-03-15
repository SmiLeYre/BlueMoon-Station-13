/datum/dna/proc/update_body_size(old_size)
	if(!holder || features["body_size"] == old_size)
		return ..()

	//new size detected
	holder.resize = features["body_size"] / old_size
	holder.maptext_height = 32 * features["body_size"] // Adjust runechat height
	holder.update_transform()

	//Handle the small icon
	if(!holder.small_sprite)
		holder.small_sprite = new(holder)

	var/HSize = get_size(holder) //BLUEMOON CHANGE переменная для взятого размера holder
	if(HSize >= (RESIZE_A_BIGNORMAL + RESIZE_NORMAL) / 2) //BLUEMOON CHANGE HSize
		holder.small_sprite.Grant(holder)
	else
		holder.small_sprite.Remove(holder)

	if(!iscarbon(holder))
		return

	//Bigger bits
	var/mob/living/carbon/C = holder
	for(var/obj/item/organ/genital/cocc in C.internal_organs)
		if(istype(cocc))
			cocc.update()

	///Старые пенальти
	var/HMaxHealth = C.maxHealth //переменная для взятого максимума хп
	if(CONFIG_GET(flag/old_size_penalties)) //пусть будет коль есть (не проверялось, было как есть)
		var/penalty_threshold = CONFIG_GET(number/threshold_body_size_penalty)
		var/Fbody_size = features["body_size"]
		if(Fbody_size < penalty_threshold && old_size >= penalty_threshold)
			HMaxHealth -= 10 //reduce the maxhealth
			var/slowdown = (1 - round(Fbody_size / penalty_threshold, 0.1)) * CONFIG_GET(number/body_size_slowdown_multiplier)
			holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/small_stride, TRUE, slowdown)
		else if(old_size < penalty_threshold && Fbody_size >= penalty_threshold)
			HMaxHealth  += 10 //give the maxhealth back
			holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride) //remove the slowdown
		return

	var/trait_light = FALSE
	if(HAS_TRAIT(holder, TRAIT_BLUEMOON_LIGHT) && HSize > 1)
		trait_light = TRUE
	//Считаем модификаторы хп
	var/healthmod_old = (old_size * 100) - 100 //Get the old value to see what we must change. // BLUEMOON CHANGES
	var/healthmod_new = (HSize * 100) - 100 //A size of one would be zero. Big boys get health, small ones lose health. // BLUEMOON CHANGES + HSize

	//Новое замедление с учётом максимального учитываемого размера
	var/size_cap = CONFIG_GET(number/macro_health_cap) //3.5 (350%) в базовой настройке
	if(size_cap > 0 && (HSize > size_cap))
		HSize = size_cap

	var/new_slowdown = (abs(HSize - 1) * CONFIG_GET(number/body_size_slowdown_multiplier)) //0 в базовой настройке (и замедление 0.75 для 25% и 1 для 200%)
	if(trait_light) //Лёгкие, но большие персонажи не получают замедление от размера (как и доп хп)
		holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride)
		healthmod_new = 0
	else holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/small_stride, TRUE, new_slowdown)
	// BLUEMOON ADDITION AHEAD
	#define MINIMAL_SIZE_HEALTH 10 //при учёте минимального размера 10%
	if(HMaxHealth == MINIMAL_SIZE_HEALTH)
		healthmod_old = MINIMAL_SIZE_HEALTH - 100 //переписываем старое значение для возврата от состоянии минимального ХП к любому иному

	//Get ready to apply the new value, and subtract the old one. (Negative values become positive)
	var/NewHMaxHealth = HMaxHealth + healthmod_new - healthmod_old

	// Увеличиваем или уменьшаем ХП у торса в зависимости от размера персонажа
	for(var/obj/item/bodypart/chest/chest in C.bodyparts)
		if(HSize >= 1)
			if(trait_light) chest.max_damage = initial(chest.max_damage)
			else 			chest.max_damage = initial(chest.max_damage) + (HSize - 1) * 100
		else				chest.max_damage = initial(chest.max_damage) - (1 - HSize) * 100

	// Увеличиваем или уменьшаем ХП у головы в зависимости от размера персонажа
	for(var/obj/item/bodypart/head/head in C.bodyparts)
		if(HSize >= 1)
			if(trait_light)	head.max_damage = initial(head.max_damage)
			else			head.max_damage = initial(head.max_damage) + (HSize - 1) * 100
		else				head.max_damage = initial(head.max_damage) - (1 - HSize) * 100

	// Если персонаж так мал, что его ХП должно быть ниже MINIMAL_SIZE_HEALTH после всех формул, то оно выставляется таким
	if(NewHMaxHealth < MINIMAL_SIZE_HEALTH)
		holder.maxHealth = MINIMAL_SIZE_HEALTH
		C.updatehealth()
		return

	//Обновление урона у больших персонажей
	var/damage_formula = (NewHMaxHealth / HMaxHealth) //Разница между новым и старым хп
	if(C.health < HMaxHealth * 0.9 && damage_formula > 1) //если хп меньше 90% и персонажа увеличивается хп
		holder.visible_message(span_danger("[holder] body damage is getting worse from sudden expansion!"), span_danger("Your body damage is getting worse from sudden expansion!"))

		//BRUTE & BURN
		for(var/X in C.bodyparts)
			var/obj/item/bodypart/BP = X
			BP.brute_dam *= damage_formula
			BP.burn_dam *= damage_formula

		//TOX
		if(C.getToxLoss())
			C.setToxLoss(C.getToxLoss()* damage_formula, FALSE)

		//CLONE
		if(C.getCloneLoss())
			C.setCloneLoss(C.getCloneLoss() * damage_formula, FALSE)

	holder.maxHealth = NewHMaxHealth
	C.updatehealth()

	#undef MINIMAL_SIZE_HEALTH
	// BLUEMOON ADDITION END
