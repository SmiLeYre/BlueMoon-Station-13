//Огненные ЕРТшники. Костюмы.
/datum/outfit/ert/firesquad_commander
	name = "Firesquad Commander"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec/fire
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/grenade/fire_grenade
	r_hand = /obj/item/gun/energy/laser/hellgun
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer/swat=1,\
		/obj/item/flamethrower/full/tank=1,\
		/obj/machinery/igniter=1,\
		/obj/item/tank/internals/plasma=3)
	l_pocket = /obj/item/melee/transforming/energy/sword/saber

/datum/outfit/ert/firesquad_commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/firesquad_trooper
	name = "Firesquad Trooper"

	id = /obj/item/card/id/ert/Security
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec/fire
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/grenade/fire_grenade
	r_hand = /obj/item/flamethrower/full/tank
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer=1,\
		/obj/machinery/igniter=1,\
		/obj/item/tank/internals/plasma=3)

/datum/outfit/ert/firesquad_trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

//Тяжелые ЕРТшники. Костюмы.
/datum/outfit/ert/heavysquad_commander
	name = "Heavy Weapons Commander"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/captain
	belt = /obj/item/storage/belt/grenade/full
	r_hand = /obj/item/gun/ballistic/automatic/shotgun/bulldog/unrestricted
	//l_hand = /obj/item/melee/powerfist
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer/swat=1,\
		/obj/item/choice_beacon/ert_mech=1,\
		/obj/item/storage/box/syndie_kit/revolver=1,\
		/obj/item/grenade/plastic/x4=1,
		/obj/item/ammo_box/magazine/m12g/slug=3)
	l_pocket = /obj/item/melee/transforming/energy/sword/saber

/datum/outfit/ert/heavysquad_commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/heavysquad_trooper
	name = "Heavy Weapons Trooper"

	id = /obj/item/card/id/ert/Security
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/grenade/full
	r_hand = /obj/item/gun/ballistic/automatic/ar
	l_hand = /obj/item/melee/powerfist
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer=1,\
		/obj/item/ammo_box/magazine/m556=3)

/datum/outfit/ert/heavysquad_trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

/datum/outfit/ert/heavysquad_machinegun
	name = "Heavy Squad Machinegunner"

	id = /obj/item/card/id/ert/Security
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/security/full
	r_hand = /obj/item/gun/ballistic/automatic/l6_saw/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer=1,\
		/obj/item/ammo_box/magazine/mm712x82=2)

/datum/outfit/ert/heavysquad_machinegun/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

//Русская ОБР. Костюмы.
/datum/outfit/ert/ert_russian_soldier
	name = "NRI Spetsnaz Soldier"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/armor/vest/russian
	head = /obj/item/clothing/head/helmet/alt
	uniform = /obj/item/clothing/under/syndicate/rus_army
	mask = /obj/item/clothing/mask/gas/syndicate/ds
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/hecu/black
	belt = /obj/item/storage/belt/grenade/full
	r_hand = /obj/item/gun/ballistic/automatic/vss
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer=1,\
		/obj/item/gun/ballistic/revolver/mateba=1,
		/obj/item/ammo_box/magazine/vss_mag=2)

/datum/outfit/ert/ert_russian_soldier/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new
	L.implant(H, null, 0)

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

/datum/outfit/ert/ert_russian_leader
	name = "NRI Spetsnaz Leader"

	id = /obj/item/card/id/ert/Security
	suit = /obj/item/clothing/suit/armor/vest/russian_coat
	head = /obj/item/clothing/head/beret/sec
	uniform = /obj/item/clothing/under/syndicate/rus_army
	mask = /obj/item/clothing/mask/gas/syndicate/ds
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	back = /obj/item/storage/backpack/hecu/black
	belt = /obj/item/storage/belt/grenade/full
	l_pocket = /obj/item/melee/transforming/energy/sword/saber
	r_hand = /obj/item/gun/ballistic/automatic/l6_saw/pkmp
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/clothing/mask/gas/sechailer=1,\
		/obj/item/storage/box/syndie_kit/revolver=1,\
		/obj/item/ammo_box/magazine/mm712x82=1)

/datum/outfit/ert/ert_russian_leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new
	L.implant(H, null, 0)

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()
