/datum/job/lawyer
	title = "Lawyer"
	flag = LAWYER
	department_head = list("NanoTrasen Representative")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the NanoTrasen Representative"
	selection_color = "#7e3d48"
	considered_combat_role = FALSE
	exp_requirements = 100
	exp_type = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/lawyer
	plasma_outfit = /datum/outfit/plasmaman/bar //yes, this is correct, there's no 'lawyer' plasmeme outfit

	access = list(ACCESS_LAWYER, ACCESS_BRIG, ACCESS_COURT, ACCESS_SEC_DOORS, ACCESS_SECURITY)
	minimal_access = list(ACCESS_LAWYER, ACCESS_BRIG, ACCESS_COURT, ACCESS_SEC_DOORS, ACCESS_SECURITY)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/blindness, /datum/quirk/monophobia)

	display_order = JOB_DISPLAY_ORDER_LAWYER
	threat = 0.3

	family_heirlooms = list(
		/obj/item/gavelhammer,
		/obj/item/storage/briefcase/lawyer/family,
		/obj/item/book/manual/wiki/security_space_law
	)

/datum/outfit/job/lawyer
	name = "Lawyer"
	jobtype = /datum/job/lawyer

	belt = /obj/item/pda/lawyer
	ears = /obj/item/radio/headset/headset_sec
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/really_black
	//suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/storage/briefcase/lawyer
	l_pocket = /obj/item/laser_pointer
	r_pocket = /obj/item/clothing/accessory/lawyers_badge

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec

	chameleon_extras = /obj/item/stamp/law

	backpack_contents = list(/obj/item/stamp/law=1)

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/lawyer/syndicate
	name = "Syndicate Lawyer"
	jobtype = /datum/job/lawyer

	//belt = /obj/item/pda/syndicate/no_deto

	belt = /obj/item/pda/lawyer
	ears = /obj/item/radio/headset/headset_sec
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/really_black
	//suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	l_hand = /obj/item/storage/briefcase/lawyer
	l_pocket = /obj/item/laser_pointer
	r_pocket = /obj/item/clothing/accessory/lawyers_badge

	backpack = /obj/item/storage/backpack/duffelbag/syndie
	satchel = /obj/item/storage/backpack/duffelbag/syndie
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	box = /obj/item/storage/box/survival/syndie
	pda_slot = ITEM_SLOT_BELT
	backpack_contents = list(/obj/item/gun/energy/e_gun=1, /obj/item/stamp/law=1, /obj/item/syndicate_uplink=1)

/datum/outfit/job/lawyer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	H.typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/law
