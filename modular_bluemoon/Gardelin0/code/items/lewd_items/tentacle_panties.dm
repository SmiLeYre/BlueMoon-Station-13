/obj/item/clothing/underwear/briefs/tentacle
	name = "panties?"
	icon_state = "panties_slim"
	var/tired = FALSE
	var/lust = 0

/obj/item/clothing/underwear/briefs/tentacle/random
	name = "undies"
/obj/item/clothing/underwear/briefs/tentacle/random/Initialize()
	. = ..()
	icon_state = pick("briefs", "boxer_briefs", "boxers", "bee_shorts", "boxers_commie", "boxers_heart", "boxers_long", "boxers_striped", "boxers_uk", "boxers_assblastusa", "jockstrap", "mankini", "panties", "panties_alt", "panties_bee-kini", "panties_commie", "panties_fishnet", "panties_kinky", "panties_neko", "panties_slim", "panties_striped", "panties_swimming", "panties_slim", "thong", "thong_babydoll", "panties_uk", "panties_assblastusa")

/obj/item/clothing/underwear/briefs/tentacle/equipped(mob/living/carbon/M)
	. = ..()
	tentacle_panties(M)

/obj/item/clothing/underwear/briefs/tentacle/chameleon
	name = "panties?"

/obj/item/clothing/underwear/briefs/tentacle/chameleon/Initialize(mapload)
	. = ..()
	var/datum/action/item_action/chameleon/change/chameleon_action = new(src)
	chameleon_action.chameleon_type = /obj/item/clothing/underwear/briefs
	chameleon_action.chameleon_name = "Panties"
	chameleon_action.initialize_disguises()

/obj/item/clothing/underwear/briefs/tentacle/attack_hand(mob/living/carbon/user)
	if(loc == user && ITEM_SLOT_UNDERWEAR)
		user.visible_message("<span class='warning'>[user] пытается отодрать [src]!.</span>")
		if(do_after(user, rand(5,35)))
			if(prob(25))
				..()
			else
				to_chat(user, "<span class='warning'>Не отдирается!</span>")
				return
	else
		..()

/obj/item/clothing/underwear/briefs/tentacle/male
	name = "briefs"
	icon_state = "briefs"

/obj/item/clothing/underwear/briefs/tentacle/female
	name = "panties"
	icon_state = "panties_slim"

/obj/item/clothing/underwear/briefs/tentacle/portal
	name = "portal panties"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "portalpanties"

/obj/item/storage/box/tentacle_panties
	name =  "Naughty Underwear"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	desc = "A small silver box with Silver Love Co embossed."
	icon_state = "box"
	custom_price = 500

// portal fleshlight box
/obj/item/storage/box/tentacle_panties/PopulateContents()
	new /obj/item/clothing/underwear/briefs/tentacle/male(src)
	new /obj/item/clothing/underwear/briefs/tentacle/female(src)
	new /obj/item/clothing/underwear/briefs/tentacle/portal(src)
	new /obj/item/clothing/underwear/briefs/tentacle/chameleon(src)
