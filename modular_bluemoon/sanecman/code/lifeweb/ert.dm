/datum/ert/lfwb_ordinator
	roles = list(/datum/antagonist/ert/lfwb_ordinator)
	leader_role = /datum/antagonist/ert/lfwb_ordinator/leader
	opendoors = TRUE
	rename_team = "Tribunal Ordinator"
	code = "Red"
	mission = "Уничтожить все угрозы Активам Пакта."
	polldesc = "an Nanotrasen Tribunal Ordinator"
	ertphrase = "modular_bluemoon/sanecman/sound/ert/ert_tribunal.ogg"

/datum/antagonist/ert/lfwb_ordinator/leader
	name = "Officer Tribunal Ordinator"
	outfit = /datum/outfit/lfwb_ordinator/officer
	role = "Офицер"

/datum/antagonist/ert/lfwb_ordinator
	name = "Tribunal Ordinator"
	outfit = /datum/outfit/lfwb_ordinator
	role = "Солдат"

/datum/outfit/lfwb_ordinator
	name = "Ординатор Трибунала"

	uniform = /obj/item/clothing/under/syndicate/ordinator
	suit = /obj/item/clothing/suit/armor/hos/ordinator
	head = /obj/item/clothing/head/helmet/knight/ordinator
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	mask = /obj/item/clothing/mask/gas/atmos/lfwb
	glasses = /obj/item/clothing/glasses/hud/security/lfwb
	back = /obj/item/storage/backpack/rucksack
	l_pocket = /obj/item/ammo_box/magazine/fal
	r_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/gun/ballistic/automatic/fal
	belt = /obj/item/storage/belt/grenade/full
	r_hand = /obj/item/claymore/baron
	l_hand = /obj/item/gun/energy/taser/bolestrel
	id = /obj/item/card/id/ert
	ears = /obj/item/radio/headset/headset_cent/alt

	backpack_contents = list(/obj/item/storage/box/survival/security=1,\
		/obj/item/storage/firstaid/tactical/slaver=1,\
		/obj/item/sign/flag/ravenheart/alt=1,\
		/obj/item/storage/box/raven_box/posters=1,\
		/obj/item/ammo_box/c308=1,\
		/obj/item/grenade/plastic/x4=1)

	give_space_cooler_if_synth = TRUE // BLUEMOON ADD

/datum/outfit/lfwb_ordinator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/implant/mindshield/L = new //Here you go Deuryn
	L.implant(H, null, 1)

	var/obj/item/card/id/ert/W = H.wear_id
	W.access = get_all_accesses()//They get full station access.
	W.access += get_centcom_access("Death Commando")//Let's add their alloted CentCom access.
	W.registered_name = H.real_name
	W.assignment = "Tribunal Ordinator"
	W.update_label(W.registered_name)

/datum/outfit/lfwb_ordinator/officer
	name = "Офицер-ординатор трибунала"
	uniform = /obj/item/clothing/under/syndicate/ordinator/leader
	suit = /obj/item/clothing/suit/armor/hos/ordinator/leader
	l_hand = /obj/item/gun/energy/taser/legax

/datum/outfit/lfwb_ordinator/officer/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	var/list/extra_backpack_items = list(
		/obj/item/storage/box/pinpointer_squad
	)
	LAZYADD(backpack_contents, extra_backpack_items)
