/datum/outfit/slaver
	name = "Slave Trader"

	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/pirate
	id = /obj/item/card/id/syndicate/slaver
	backpack_contents = list(/obj/item/storage/box/survival,\
		/obj/item/kitchen/knife/combat/survival)
	var/command_radio = FALSE

/datum/outfit/slaver/leader
	name = "Slave Master"

	id = /obj/item/card/id/syndicate/slaver/leader
	gloves = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	command_radio = TRUE

/datum/outfit/slaver/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.faction |= ROLE_SLAVER
	H.update_icons()
	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_PIRATE)
	R.freqlock = TRUE
	if(command_radio)
		R.command = TRUE
