/obj/item/hand_mirror
	name = "hand mirror"
	desc = "Fancy mirror with a short handle. Designed to fix hair before unexpected sex." // О нет, шутки про ЕРП...
	icon = 'modular_bluemoon/krashly/icons/obj/hand_mirror.dmi'
	icon_state = "mirror"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/hand_mirror/attack_self(mob/user) // Функция зеркала
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		if(H.gender != FEMALE)
			var/new_style = input(user, "Select a facial hair style", "Grooming")  as null|anything in GLOB.facial_hair_styles_list
			if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
				return
			if(new_style)
				H.facial_hair_style = new_style
		else
			H.facial_hair_style = "Shaved"

		var/new_style = input(user, "Select a hair style", "Grooming")  as null|anything in GLOB.hair_styles_list
		if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
			return
		if(new_style)
			H.hair_style = new_style

		H.update_mutant_bodyparts()
		H.update_hair()

/obj/structure/sign/flag/skull
	name = "flag of PMC Skull"
	desc = "Black flag with a skull in the center. Has a red lining. The flag smells of blood."
	icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/skull

/obj/item/sign/flag
	var/flag_type = ""

/obj/item/sign/flag/skull
	name = "folded flag of the PMC Skull"
	desc = "The folded flag of the PMC Skull."
	flag_type = "skull"
	icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/skull

/obj/structure/closet/crate/coffin/attacked_by(obj/item/sign/flag/I, mob/living/user)
	if(I.flag_type == "skull")
		icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
		icon_state = "grob_full"
		locked = TRUE
		qdel(I)
	if(I.flag_type == "inteq")
		icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
		icon_state = "grob_full"
		locked = TRUE
		qdel(I)

/datum/gear/donator/bm/skull_flag
	name = "PMC Skull flag"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/sign/flag/skull
	ckeywhitelist = list("krashly", "stgs", "hazzi", "dolbajob")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

//InteQ

/obj/structure/sign/flag/inteq
	name = "flag of PMC InteQ"
	desc = "Orange-Brown flag with a shield in the center. Has a Yellow lining. The flag smells of blood."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/inteq

/obj/item/sign/flag/inteq
	name = "folded flag of the PMC InteQ"
	desc = "The folded flag of the PMC InteQ."
	flag_type = "inteq"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/inteq

/obj/item/poster/random_inteq
	name = "random InteQ poster"
	poster_type = /obj/structure/sign/poster/contraband/inteq/random
	icon_state = "rolled_contraband"

/obj/structure/sign/poster/contraband/inteq/random
	name = "random contraband poster"
	icon_state = "random_contraband"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/contraband/inteq

/obj/structure/sign/poster/contraband/inteq/inteq_recruitment
	name = "InteQ Recruitment"
	desc = "See the galaxy! Shatter megacorporations! Join today!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq"

/obj/structure/sign/poster/contraband/inteq/inteq_sign
	name = "InteQ poster"
	desc = "A shrouded organization that fights the pact between the NT and the Syndicate."
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_baza"

/obj/structure/sign/poster/contraband/inteq/inteq_better_dead
	name = "Better Dead!"
	desc = "Crush our enemies!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_better_dead"

/obj/structure/sign/poster/contraband/inteq/inteq_no_peace
	name = "No peace!"
	desc = "Make money, not friends, join PMC InteQ!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_love"

/obj/structure/sign/poster/contraband/inteq/inteq_no_sex
	name = "No SEX"
	desc = "Stop jerking off, join PMC InteQ!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_sex"

/obj/structure/sign/poster/contraband/inteq/inteq_vulp
	name = "InteQ Recruitment"
	desc = "A brown poster. The words says: 'Even if you jerking off to vulpes, join PMC InteQ. Shatter our enemies!'."
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_vulp"

/obj/item/storage/box/inteq_box
	name = "brown box"
	desc = "There are definitely no dangerous items inside."
	icon = 'modular_bluemoon/krashly/icons/obj/box.dmi'
	icon_state = "inteqbox"

/obj/item/storage/box/inteq_box/inteq_clothes
	name = "clothes kit"

/obj/item/storage/box/inteq_box/inteq_clothes/PopulateContents()
	new /obj/item/clothing/under/inteq(src)
	new /obj/item/clothing/suit/armor/inteq(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/storage/belt/military/inteq(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/inteq(src)
	new /obj/item/clothing/head/helmet/swat/inteq(src)
	new /obj/item/clothing/mask/balaclava/breath/inteq(src)
	new /obj/item/storage/backpack/security/inteq(src)

/obj/item/soap/inteq
	desc = "An untrustworthy bar of soap made of strong chemical agents that dissolve blood faster."
	icon_state = "soapinteq"
	cleanspeed = 10
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_soap.dmi'
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/obj/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/obj/righthand.dmi'

/obj/item/reagent_containers/food/snacks/intecookies
	name = "InteCookies"
	desc = "Shortbread cookies in the shape of a shield."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies"
	trash = /obj/item/trash/intecookies
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/cooking_oil = 2, /datum/reagent/consumable/sodiumchloride = 3)
	filling_color = "#cfa156"
	tastes = list("shortbread cookies" = 1)
	foodtype = JUNKFOOD | FRIED
	dunkable = TRUE

/obj/item/trash/intecookies
	name = "intecookies bag"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies_trash"
	grind_results = list(/datum/reagent/aluminium = 1)

/obj/item/storage/fancy/cigarettes/cigpack_inteq
	name = "cigarette packet"
	desc = "An obscure brand of cigarettes."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_cigarettes.dmi'
	icon_state = "inteq"
	spawn_type = /obj/item/clothing/mask/cigarette/inteq

/obj/item/clothing/mask/cigarette/inteq
	desc = "An unknown brand cigarette."
	list_reagents = list(/datum/reagent/drug/nicotine = 15, /datum/reagent/medicine/omnizine = 15)

/obj/item/toy/mecha/hermes
	name = "toy Hermes"
	icon = 'modular_bluemoon/krashly/icons/obj/toys.dmi'
	icon_state = "toy_hermes"
	max_combat_health = 6 //300 integrity

/obj/item/toy/mecha/ares
	name = "toy Ares"
	icon = 'modular_bluemoon/krashly/icons/obj/toys.dmi'
	icon_state = "toy_ares"
	max_combat_health = 7 //300 integrity


// Лодаут

/datum/gear/accessory/hand_mirror
	name = "A hand mirror"
	path = /obj/item/hand_mirror
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/neck/windy_scarf
	name = "A windy scarf"
	path = /obj/item/clothing/neck/windy_scarf
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/head/bow
	name = "A polychromic bow"
	path = /obj/item/toy/fluff/bant
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
