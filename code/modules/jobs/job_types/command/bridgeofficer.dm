/datum/job/bridgeofficer
	title = "Bridge Officer" // A courpse shared the same name as was causing issiues
	flag = BRDIGEOFF //Wanted to use BO but.. that broke the blob. Woops
	department_head = list("Captain")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The captain and the head of personnel"
	selection_color = "#7e3d48"
	req_admin_notify = 0
	minimal_player_age = 20
	exp_requirements = 100
	exp_type = EXP_TYPE_COMMAND
	exp_type_department = EXP_TYPE_COMMAND
	considered_combat_role = FALSE
	outfit = /datum/outfit/job/bridgeofficer
	plasma_outfit = /datum/outfit/plasmaman/bridgeofficer
	//SPLURT CHANGES (Changes the custom spawn text for the Bridge Officer)
	custom_spawn_text = "<font color='red'>You are an Captain deputy.</font>"
	access = list(ACCESS_SECURITY, ACCESS_BRIG, ACCESS_RESEARCH, ACCESS_MAINT_TUNNELS, ACCESS_MEDICAL, ACCESS_WEAPONS , ACCESS_CARGO, ACCESS_HEADS, ACCESS_MAILSORTING, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_ENGINE, ACCESS_HOP, ACCESS_BAR, ACCESS_JANITOR, ACCESS_KITCHEN, ACCESS_HYDROPONICS)
	minimal_access = list(ACCESS_SECURITY, ACCESS_BRIG, ACCESS_RESEARCH, ACCESS_MAINT_TUNNELS, ACCESS_MEDICAL, ACCESS_WEAPONS, ACCESS_CARGO, ACCESS_HEADS, ACCESS_MAILSORTING, ACCESS_ENTER_GENPOP, ACCESS_LEAVE_GENPOP, ACCESS_ENGINE, ACCESS_HOP, ACCESS_BAR, ACCESS_JANITOR, ACCESS_KITCHEN, ACCESS_HYDROPONICS)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC
	alt_titles = list("Command Secretary", "Command Officer", "Bridge Secretary", "Ensign", "Bridge Bitch", "Bridge Canine", "Captain Pet", "Command Pet", "Dick Attachment", "Pussy Attachment", "Bridge Advisor", "Bridge Intern", "Bridge Pet")
	display_order = JOB_DISPLAY_ORDER_BO
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/insanity, /datum/quirk/bluemoon_criminal)
	threat = 1

/datum/outfit/job/bridgeofficer
	name = "Bridge Officer"
	jobtype = /datum/job/bridgeofficer
	id = /obj/item/card/id/silver
	belt = /obj/item/clipboard
	ears = /obj/item/radio/headset/headset_bo/bowman
	uniform = /obj/item/clothing/under/rank/bridgeofficer
	head = /obj/item/clothing/head/bridgeofficer
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/sneakers/brown
	l_pocket = /obj/item/pda
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1, /obj/item/stamp/command=1, /obj/item/gun/energy/civilian=1, /obj/item/assembly/flash/handheld=1)

	accessory = /obj/item/clothing/accessory/permit/head
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/bridgeofficer/syndicate
	name = "Syndicate Bridge Officer"
	jobtype = /datum/job/bridgeofficer

	//belt = /obj/item/pda/syndicate/no_deto

	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset/headset_bo/bowman
	uniform = /obj/item/clothing/under/rank/bridgeofficer
	head = /obj/item/clothing/head/bridgeofficer
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/jackboots/tall_default

	backpack = /obj/item/storage/backpack/duffelbag/syndie
	satchel = /obj/item/storage/backpack/duffelbag/syndie
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	box = /obj/item/storage/box/survival/syndie
	pda_slot = ITEM_SLOT_BELT
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1, /obj/item/gun/energy/e_gun=1, /obj/item/stamp/law=1, /obj/item/syndicate_uplink=1)


/datum/outfit/plasmaman/bridgeofficer
	name = "Bridge Officer Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman
	uniform = /obj/item/clothing/under/plasmaman
	ears = /obj/item/radio/headset/headset_bo

/obj/item/radio/headset/headset_bo
	name = "bridge officer headset"
	desc = "This is used by bridge officers."
	icon_state = "com_headset"
	item_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_bo
	command = TRUE

/obj/item/radio/headset/headset_bo/bowman
	name = "bridge officer bowman headset"
	desc = "This is used by bridge officers. It protects from flashbangs"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	bowman = TRUE

/obj/item/encryptionkey/headset_bo
	name = "bridge officer radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/effect/landmark/start/bridgeofficer
	name = "Bridge Officer"
	icon_state = "Head of Personnel"
