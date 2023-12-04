//This file contains everything to spawn ERT for cleaning up a nuclear reactor meltdown, if those things could actually explode

//ERT
/datum/ert/hsc
	rename_team = "Trauma Team Squad"
	code = "Blue"	//CC probably wouldn't know if it was sabotage or not, but nuclear waste is a hazard to personnel
	mission = "Спаси и вылечи как можно больше сотрудников."
	enforce_human = FALSE
	opendoors = FALSE
	polldesc = "Trauma Team Squad"
	teamsize = 3	//2 is not enough for such a big area, 4 is too much
	leader_role = /datum/antagonist/ert/hsc/medic
	roles = list(/datum/antagonist/ert/hsc/sec, /datum/antagonist/ert/hsc/assistant)

/datum/ert/hsc/New()
	mission = "Спасти как можно больше сотрудников и жизней на [station_name()]."

//Antag mind & team (for objectives on what to do)
/datum/antagonist/ert/hsc/medic
	name = "Trauma Team Squad"
	role = "Медик-Специалист"
	ert_team = /datum/team/ert/hsc
	outfit = /datum/outfit/hsc/medic

/datum/antagonist/ert/hsc/sec
	name = "Trauma Team Squad"
	role = "Защитник"
	ert_team = /datum/team/ert/hsc
	outfit = /datum/outfit/hsc

/datum/antagonist/ert/hsc/assistant
	name = "Trauma Team Squad"
	role = "Специалист"
	ert_team = /datum/team/ert/hsc
	outfit = /datum/outfit/hsc/assistant

/datum/antagonist/ert/hsc/greet()
	//\an [name] because modularization is nice
	to_chat(owner, "Ты \an [name].\n\
		Ты должен спасти как можно больше жизней с [station_name()], \
		ведь по мнению Nanotrasen сотрудники этой Космической Станции очень важны.")

/datum/team/ert/hsc
	mission = "Спаси как можно больше сотрудников."
	objectives = list("Спаси как можно больше сотрудников.")

/datum/outfit/hsc
	name = "HSC Security"
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat/swat
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	belt = /obj/item/storage/belt/military/hsc
	id = /obj/item/card/id/hsc
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/hsc
	glasses = /obj/item/clothing/glasses/hud/hsc
	mask = /obj/item/clothing/mask/gas/sechailer/hsc
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
	/obj/item/melee/baton/loaded=1,
	/obj/item/gun/energy/e_gun=1,
	/obj/item/storage/firstaid/regular=1,
	/obj/item/gun/energy/plasma/MP40k=1)
	l_pocket = /obj/item/melee/transforming/energy/sword/saber
	suit_store = /obj/item/tank/internals/doubleoxygen

	give_space_cooler_if_synth = TRUE // BLUEMOON ADD

/datum/outfit/hsc/medic
	name = "HSC Medic"
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat/swat
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/hsc
	belt = /obj/item/storage/belt/military/hsc
	id = /obj/item/card/id/hsc/medic
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/hsc/medical
	glasses = /obj/item/clothing/glasses/hud/hsc
	mask = /obj/item/clothing/mask/gas/sechailer/hsc
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
	/obj/item/storage/firstaid/tactical=1,
	/obj/item/storage/hypospraykit/cmo=1,
	/obj/item/gun/energy/e_gun/cx=1)
	l_pocket = null
	l_hand = /obj/item/storage/backpack/duffelbag/syndie/surgery_adv

/datum/outfit/hsc/assistant
	name = "HSC Assistant"
	uniform = /obj/item/clothing/under/syndicate/combat
	shoes = /obj/item/clothing/shoes/combat/swat
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	belt = /obj/item/storage/belt/military/hsc
	id = /obj/item/card/id/hsc/assistant
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/hsc/assistant
	glasses = /obj/item/clothing/glasses/hud/hsc
	mask = /obj/item/clothing/mask/gas/sechailer/hsc
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,
	/obj/item/storage/firstaid/tactical=1,
	/obj/item/gun/medbeam=1,
	/obj/item/gun/energy/e_gun/cx=1,
	/obj/item/bodybag/bluespace=1)
	l_pocket = null

/datum/outfit/hsc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	ADD_TRAIT(H, TRAIT_SURGEON, TRAIT_GENERIC)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new
	L.implant(H, null, 1)

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	if(W)
		W.registered_name = H.real_name
		W.update_label(W.registered_name, W.assignment)

/obj/item/card/id/hsc
	name = "\improper HSC ID"
	desc = "Health Safety Control ID card."
	icon = 'modular_bluemoon/phenyamomota/icon/obj/card.dmi'
	icon_state = "hsc"
	registered_name = "Health Safety Control Security"
	assignment = "Health Safety Control Security"

/obj/item/card/id/hsc/Initialize(mapload)
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/hsc/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "idsec")

/obj/item/card/id/hsc
	name = "\improper HSC Security ID"
	desc = "Health Safety Control ID card."
	icon_state = "hsc"
	registered_name = "Health Safety Control Security"
	assignment = "Health Safety Control Security"

/obj/item/card/id/hsc/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "idsec")

/obj/item/card/id/hsc/medic
	name = "\improper HSC Medical ID"
	desc = "Health Safety Control ID card."
	icon_state = "hsc"
	registered_name = "Health Safety Control Medic"
	assignment = "Health Safety Control Medic"

/obj/item/card/id/hsc/medic/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "idmed")

/obj/item/card/id/hsc/assistant
	name = "\improper HSC Assistant ID"
	desc = "Health Safety Control ID card."
	icon_state = "hsc"
	registered_name = "Health Safety Control Assistant"
	assignment = "Health Safety Control Assistant"

/obj/item/card/id/hsc/assistant/update_overlays()
	. = ..()
	. += mutable_appearance(icon, "idas")
