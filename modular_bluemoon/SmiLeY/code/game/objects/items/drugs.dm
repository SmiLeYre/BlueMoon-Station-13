/datum/reagent/drug/zvezdochka
	name = "Zvezdochka"
	description = "Реверс-инжениринг версия старого советского психотропного вещества. По крайней мере попытка."
	color = "#f00aef"

/datum/chemical_reaction/zvezdochka
	name = "Zvezdochka"
	id = /datum/reagent/drug/zvezdochka
	results = list(/datum/reagent/drug/zvezdochka = 5)
	required_reagents = list(/datum/reagent/medicine/sal_acid = 1, /datum/reagent/medicine/oxandrolone = 1, /datum/reagent/medicine/pen_acid = 1, /datum/reagent/toxin/mindbreaker = 2)
	mix_message = "Смесь бурно реагирует, оставляя после себя несколько красных кристаллических осколков."
	required_temp = 390

/datum/reagent/drug/zvezdochka/on_mob_metabolize(mob/living/M)
	. = ..()

	M.add_client_colour(/datum/client_colour/zvezdochka)
	var/sound/sound = sound(pick('modular_bluemoon/SmiLeY/sounds/LYENEN.ogg', 'modular_bluemoon/SmiLeY/sounds/LYENEN2.ogg'), TRUE)
	sound.environment = 23
	sound.volume = 20
	SEND_SOUND(M.client, sound)

	return

/datum/reagent/drug/zvezdochka/on_mob_life(mob/living/M)

	var/high_message = pick("ЗВЁЗДОЧКИ", "ЛЕНИН", "КОММУНИЗМ", "КАЙФ")

	if(prob(30))
		to_chat(M, span_notice("<i> ... [high_message] ... </i>"))
		M.adjustToxLoss(-4 * REM, 0)
		M.adjustBruteLoss(-4 * REM, 0)
		M.adjustFireLoss(-4 * REM, 0)
		M.adjustOxyLoss(-12 * REM, 0)

		M.Jitter(rand(0,2))
		M.Dizzy(rand(0,2))

	new /datum/hallucination/delusion(M, TRUE, "custom", rand(10, 50), custom_icon_file = 'modular_bluemoon/SmiLeY/icons/stars.dmi', custom_icon = pick("star1","star2"), custom_name = "ЗВЁЗДОЧКА")

	if(prob(65))
		var/image/trip_img = image('modular_bluemoon/SmiLeY/icons/stars.dmi', get_turf(pick(view(7, M))), pick("star1","star2"), CURSE_LAYER)
		if(M.client)
			M.client.images += trip_img
		spawn(rand(30,50))
			if(M.client)
				M.client.images -= trip_img
			QDEL_NULL(trip_img)
	..()

/datum/reagent/drug/zvezdochka/on_mob_end_metabolize(mob/living/M)
	M.remove_client_colour(/datum/client_colour/zvezdochka)
	DIRECT_OUTPUT(M.client, sound(null))
	..()

/datum/client_colour/zvezdochka
	colour = list(rgb(255,15,15), rgb(15,225,15), rgb(15,15,255), rgb(0,0,0))
	priority = 6

/obj/item/reagent_containers/pill/zvezdochka
	name = "Zvezdochka"
	desc = "Не похоже на мазь."
	icon_state = "pill7"
	list_reagents = list(/datum/reagent/drug/zvezdochka = 10)

/obj/item/storage/pill_bottle/zvezdochka
	name = "Mazz Zvezdochka"
	desc = "Может вызвать ожог глаз. По крайней мере в старой инструкции так было написано."

/obj/item/storage/pill_bottle/zvezdochka/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/zvezdochka(src)

/datum/reagent/drug/pendosovka
	name = "Pendosovka"
	description = "Реверс-инжениринг версия старого капиталистического психотропного вещества. По крайней мере попытка."
	color = "#4463a7"

/datum/chemical_reaction/pendosovka
	name = "Pendosovka"
	id = /datum/reagent/drug/pendosovka
	results = list(/datum/reagent/drug/pendosovka = 5)
	required_reagents = list(/datum/reagent/medicine/sal_acid = 1, /datum/reagent/medicine/oxandrolone = 1, /datum/reagent/medicine/pen_acid = 1, /datum/reagent/consumable/nutriment/liquid_burger = 2)
	mix_message = "Смесь бурно реагирует, оставляя после себя несколько синих кристаллических осколков."
	required_temp = 390

/datum/reagent/consumable/nutriment/liquid_burger
	name = "Liquid Burger"
	description = "All the vitamins, minerals, and carbohydrates the body needs in pure form."
	reagent_state = LIQUID
	nutriment_factor = 25 * REAGENTS_METABOLISM
	color = "#4463a7"

/datum/chemical_reaction/liquid_burger
	name = "Liquid Burger"
	id = /datum/reagent/consumable/nutriment/liquid_burger
	results = list(/datum/reagent/consumable/nutriment/liquid_burger = 5)
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/medicine/synthflesh = 1, /datum/reagent/blood = 1)
	mix_message = "Смесь бурно реагирует, оставляя после себя огромную кучу микро-мини-нано бургеров."

/datum/chemical_reaction/solid_burger
	name = "Solid Burger"
	id = "solid_burger"
	required_reagents = list(/datum/reagent/consumable/nutriment/liquid_burger = 10)
	required_temp = 450
	mix_message = "Смесь бурно реагирует, оставляя после себя огромный сочный бургер."

/datum/chemical_reaction/solid_burger/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to multiplier)
		switch(id)
			if("solid_burger")
				var/list/random_burger = list(typecacheof(/obj/item/reagent_containers/food/snacks/burger))
				new random_burger(location)

/datum/reagent/drug/pendosovka/on_mob_metabolize(mob/living/M)
	. = ..()

	M.add_client_colour(/datum/client_colour/pendosovka)
	var/sound/sound = sound(pick('modular_bluemoon/SmiLeY/sounds/CAPITAL1.ogg', 'modular_bluemoon/SmiLeY/sounds/CAPITAL2.ogg'), TRUE)
	sound.environment = 23
	sound.volume = 20
	SEND_SOUND(M.client, sound)

	return

/datum/reagent/drug/pendosovka/on_mob_life(mob/living/M)

	var/high_message = pick("ДЕНЬГИ", "ОРЁЛ", "КАПИТАЛИЗМ", "КАЙФ")

	if(prob(30))
		to_chat(M, span_notice("<i> ... [high_message] ... </i>"))
		M.adjustToxLoss(-4 * REM, 0)
		M.adjustBruteLoss(-4 * REM, 0)
		M.adjustFireLoss(-4 * REM, 0)
		M.adjustOxyLoss(-12 * REM, 0)

		M.Jitter(rand(0,2))
		M.Dizzy(rand(0,2))

	new /datum/hallucination/delusion(M, TRUE, "custom", rand(10, 50), custom_icon_file = 'modular_bluemoon/SmiLeY/icons/stars.dmi', custom_icon = pick("star1"), custom_name = "ПЕНДОСОВКА")

	if(prob(65))
		var/image/trip_img = image('modular_bluemoon/SmiLeY/icons/stars.dmi', get_turf(pick(view(7, M))), pick("star1"), CURSE_LAYER)
		if(M.client)
			M.client.images += trip_img
		spawn(rand(30,50))
			if(M.client)
				M.client.images -= trip_img
			QDEL_NULL(trip_img)
	..()

/datum/reagent/drug/pendosovka/on_mob_end_metabolize(mob/living/M)
	M.remove_client_colour(/datum/client_colour/pendosovka)
	DIRECT_OUTPUT(M.client, sound(null))
	..()

/datum/client_colour/pendosovka
	colour = list(rgb(255,15,15), rgb(15,225,15), rgb(15,15,255), rgb(0,0,0))
	priority = 6

/obj/item/reagent_containers/pill/pendosovka
	name = "Pendosovka"
	desc = "Не похоже на мазь."
	icon_state = "pill7"
	list_reagents = list(/datum/reagent/drug/pendosovka = 10)

/obj/item/storage/pill_bottle/pendosovka
	name = "Mazz Pendosovka"
	desc = "Может вызвать ожог глаз. По крайней мере в старой инструкции так было написано."

/obj/item/storage/pill_bottle/pendosovka/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/pendosovka(src)
