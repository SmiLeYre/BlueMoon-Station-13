/* BLUEMOON CHANGE полное переписывание этого чудовища (modular_bluemoon\code\datums\dna.dm)
/datum/dna
	var/last_capped_size //For some reason this feels dirty... I suppose it should go somewhere else

/datum/dna/update_body_size(old_size)
	if(!holder || features["body_size"] == old_size)
		return ..()

	holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride) //Remove our own modifier

	. = ..()

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

	///Penalties start
	if(CONFIG_GET(flag/old_size_penalties))
		return

	//Undo the cit penalties
	var/penalty_threshold = CONFIG_GET(number/threshold_body_size_penalty)
	if(features["body_size"] < penalty_threshold && old_size >= penalty_threshold)
		C.maxHealth  += 10
		holder.remove_movespeed_modifier(/datum/movespeed_modifier/small_stride)
	else if(old_size < penalty_threshold && features["body_size"] >= penalty_threshold)
		C.maxHealth -= 10

	//Calculate new slowdown
	var/new_slowdown = (abs(HSize - 1) * CONFIG_GET(number/body_size_slowdown_multiplier)) //BLUEMOON CHANGE HSize
	holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/small_stride, TRUE, new_slowdown)

	//New health
	var/size_cap = CONFIG_GET(number/macro_health_cap)
	if((size_cap > 0) && (HSize > size_cap)) //BLUEMOON CHANGE HSize
		last_capped_size = (last_capped_size ? last_capped_size : old_size)
		return
	if(last_capped_size)
		old_size = last_capped_size
		last_capped_size = null

	var/HMaxHealth = C.maxHealth //BLUEMOON CHANGE переменная для взятого максимума хп
	var/healthmod_old = ((old_size * 120) - 120) //Get the old value to see what we must change. // BLUEMOON CHANGES
	var/healthmod_new = ((HSize * 120) - 120) //A size of one would be zero. Big boys get health, small ones lose health. // BLUEMOON CHANGES + HSize

	// BLUEMOON ADDITION AHEAD
	#define MINIMAL_SIZE_HEALTH 10
	if(HMaxHealth == MINIMAL_SIZE_HEALTH)
		healthmod_old = MINIMAL_SIZE_HEALTH - 100 // переписываем старое значение для возврата от состоянии минимального ХП к любому иному

	var/healthchange = healthmod_new - healthmod_old //Get ready to apply the new value, and subtract the old one. (Negative values become positive)
	var/NewHMaxHealth = HMaxHealth + healthchange

	// Увеличиваем или уменьшаем ХП у торса в зависимости от размера персонажа
	for(var/obj/item/bodypart/chest/chest in C.bodyparts)
		if(HSize >= 1)  chest.max_damage = initial(chest.max_damage) + (HSize - 1) * 100
		else			chest.max_damage = initial(chest.max_damage) - (1 - HSize) * 100

	// Увеличиваем или уменьшаем ХП у головы в зависимости от размера персонажа
	for(var/obj/item/bodypart/head/head in C.bodyparts)
		if(HSize >= 1)  head.max_damage = initial(head.max_damage) + (HSize - 1) * 100
		else			head.max_damage = initial(head.max_damage) - (1 - HSize) * 100

	// Если персонаж так мал, что его ХП должно быть ниже MINIMAL_SIZE_HEALTH после всех формул, то оно выставляется таким
	if(NewHMaxHealth < MINIMAL_SIZE_HEALTH)
		holder.maxHealth = MINIMAL_SIZE_HEALTH
		C.updatehealth()
		return

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

*/
#define TRANSFER_RANDOMIZED(destination, source1, source2) \
	if(prob(50)) { \
		destination = source1; \
	} else { \
		destination = source2; \
	}

/proc/transfer_randomized_list(list/destination, list/list1, list/list2)
	if(list1.len >= list2.len)
		for(var/key1 as anything in list1)
			var/val1 = list1[key1]
			var/val2 = list2[key1]
			if(prob(50) && val1)
				destination[key1] = val1
			else if(val2)
				destination[key1] = val2
	else
		for(var/key2 as anything in list2)
			var/val1 = list1[key2]
			var/val2 = list2[key2]
			if(prob(50) && val1)
				destination[key2] = val1
			else if(val2)
				destination[key2] = val2

/datum/dna/proc/transfer_identity_random(datum/dna/second_set, mob/living/carbon/destination)
	if(!istype(destination))
		return
	var/old_size = destination.dna.features["body_size"]

	TRANSFER_RANDOMIZED(destination.dna.blood_type, blood_type, second_set.blood_type)
	TRANSFER_RANDOMIZED(destination.dna.skin_tone_override, skin_tone_override, second_set.skin_tone_override)
	transfer_randomized_list(destination.dna.features, features, second_set.features)
	transfer_randomized_list(destination.dna.temporary_mutations, temporary_mutations, second_set.temporary_mutations)

	if(prob(50))
		destination.set_species(species.type, FALSE)
		destination.dna.species.say_mod = species.say_mod
		destination.dna.custom_species = custom_species
		destination.dna.custom_species_lore = custom_species_lore
	else
		destination.set_species(second_set.species.type, FALSE)
		destination.dna.species.say_mod = second_set.species.say_mod
		destination.dna.custom_species = second_set.custom_species
		destination.dna.custom_species_lore = second_set.custom_species_lore

	destination.update_size(get_size(destination), old_size)

	destination.dna.update_dna_identity()
	destination.dna.generate_dna_blocks()

	if(ishuman(destination))
		var/mob/living/carbon/human/H = destination
		H.give_genitals(TRUE)//This gives the body the genitals of this DNA. Used for any transformations based on DNA
		H.update_genitals()

	destination.updateappearance(icon_update=TRUE, mutcolor_update=TRUE, mutations_overlay_update=TRUE)

#undef TRANSFER_RANDOMIZED
