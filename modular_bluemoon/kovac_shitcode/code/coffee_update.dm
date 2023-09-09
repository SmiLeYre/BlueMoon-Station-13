////////////////////////////////////////////

/// BlueMoon 30.08.2023 - новые кофейные напитки

/datum/reagent/consumable/icelatte
	name = "Iced Latte"
	description = "Latte and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "bitter cream with coldness"
	glass_icon_state = "iced_latte"
	glass_name = "glass of iced latte"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/icelatte/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-65)
	M.drowsyness = max(0,M.drowsyness-4)
	M.SetSleeping(-45, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

///

/datum/reagent/consumable/raf
	name = "Raf"
	description = "Sweet and milky coffee drink"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "milk and sugar"
	glass_icon_state = "raf"
	glass_name = "glass of raf"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/raf/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(40))
		M.adjustToxLoss(-1, 0, TRUE)
	M.dizziness = max(0,M.dizziness-6)
	M.drowsyness = max(0,M.drowsyness-4)
	M.jitteriness = max(0,M.jitteriness-4)
	M.SetSleeping(-45, FALSE)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/iceraf
	name = "Iced Raf"
	description = "Sweet and milky coffee drink with a bit of ice"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "milk, sweetness and coldness"
	glass_icon_state = "iced_raf"
	glass_name = "glass of iced raf"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/iceraf/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(40))
		M.adjustToxLoss(-1, 0, TRUE)
	M.dizziness = max(0,M.dizziness-7)
	M.drowsyness = max(0,M.drowsyness-5)
	M.jitteriness = max(0,M.jitteriness-5)
	M.SetSleeping(-50, FALSE)
	M.adjust_bodytemperature(-4 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

///

/datum/reagent/consumable/americano
	name = "Americano"
	description = "A drink prepared by diluting regular coffee with hot water"
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	taste_description = "hot coffee"
	glass_icon_state = "americano"
	glass_name = "glass of americano"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."
	hydration = 3

/datum/reagent/consumable/americano/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-10)
	M.drowsyness = max(0,M.drowsyness-8)
	M.AdjustSleeping(-60, FALSE)
	M.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent(/datum/reagent/consumable/frostoil))
		holder.remove_reagent(/datum/reagent/consumable/frostoil, 5)
	..()
	. = 1

/datum/reagent/consumable/iceamericano
	name = "Iced Americano"
	description = "A mix of americano and ice."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	taste_description = "bitterness and coldness"
	glass_icon_state = "iced_americano"
	glass_name = "glass of americano"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."
	hydration = 3

/datum/reagent/consumable/iceamericano/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-10)
	M.drowsyness = max(0,M.drowsyness-8)
	M.AdjustSleeping(-60, FALSE)
	//M.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1

//////////////////////////////////////////////////
////////////// Рецепты

/datum/chemical_reaction/icelatte
	name = "Iced Latte"
	id = /datum/reagent/consumable/icelatte
	results = list(/datum/reagent/consumable/icelatte = 3)
	required_reagents = list(/datum/reagent/consumable/ice = 1, /datum/reagent/consumable/cafe_latte = 2)

/datum/chemical_reaction/raf
	name = "Raf"
	id = /datum/reagent/consumable/raf
	results = list(/datum/reagent/consumable/raf = 4)
	required_reagents = list(/datum/reagent/consumable/cafe_latte = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/cream = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/iceraf
	name = "Iced Raf"
	id = /datum/reagent/consumable/iceraf
	results = list(/datum/reagent/consumable/iceraf = 3)
	required_reagents = list(/datum/reagent/consumable/ice = 1, /datum/reagent/consumable/raf = 2)

/datum/chemical_reaction/americano
	name = "Americano"
	id = /datum/reagent/consumable/americano
	results = list(/datum/reagent/consumable/americano = 3)
	required_reagents = list(/datum/reagent/consumable/coffee = 1, /datum/reagent/water = 2)

/datum/chemical_reaction/iceamericano
	name = "Iced Americano"
	id = /datum/reagent/consumable/iceamericano
	results = list(/datum/reagent/consumable/iceamericano = 3)
	required_reagents = list(/datum/reagent/consumable/ice = 1, /datum/reagent/consumable/americano = 2)
