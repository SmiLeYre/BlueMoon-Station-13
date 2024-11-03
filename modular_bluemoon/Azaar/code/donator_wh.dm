/// доспех

/obj/item/clothing/suit/armor/riot/chaplain/wh_armor
	name = "The Armor of the Dark Apostle"
	desc = "Beautifully crafted armor for the apostles. Inscribed with unholy runes and containing writings for hideous rituals. From the armor itself, an aura of blood and the influence of demons emanates"
	icon = 'modular_bluemoon/azaar/icons/mob/icons/wh_chaplain.dmi'
	mob_overlay_icon = 'modular_bluemoon/azaar/icons/mob/clothing/wh_chaplain.dmi'
	icon_state = "wh_armor"
	item_state = "wh_armor"
	lefthand_file = 'modular_bluemoon/azaar/icons/mob/inhands/lhandsuit_wh_chaplain.dmi'
	righthand_file	= 'modular_bluemoon/azaar/icons/mob/inhands/rhandsuit_wh_chaplain.dmi'
	mutantrace_variation = NOT_DIGITIGRADE

/// шлем

/obj/item/clothing/head/helmet/chaplain/wh_helmet
	name = "The Helmet of the Dark Apostle"
	desc = "This is the helmet of one of the dark apostles serving the Dark Gods. The face mask is made in the shape of a screaming demon"
	icon = 'modular_bluemoon/azaar/icons/mob/icons/wh_chaplain.dmi'
	mob_overlay_icon = 'modular_bluemoon/azaar/icons/mob/clothing/wh_chaplain.dmi'
	icon_state = "helmet_wh_chaplain"
	item_state = "helmet_wh_chaplain"

/// модкиты

/obj/item/modkit/whhelmet_kit
	name = "The Helmet of the Dark Apostle modkit"
	desc = "A modkit for making an chaplain helmet into The Helmet of the Dark Apostle"
	product = /obj/item/clothing/head/helmet/chaplain/wh_helmet
	fromitem = list(/obj/item/clothing/head/helmet/chaplain, /obj/item/clothing/head/helmet/chaplain/bland/horned, /obj/item/clothing/head/helmet/chaplain/bland/winged, /obj/item/clothing/head/helmet/chaplain/bland)

/obj/item/modkit/wharmor_kit
	name = "The Armor of the Dark Apostle modkit"
	desc = "A modkit for making an chaplain armor into The Armor of the Dark Apostle"
	product = /obj/item/clothing/suit/armor/riot/chaplain/wh_armor
	fromitem = list(/obj/item/clothing/suit/armor/riot/chaplain, /obj/item/clothing/suit/armor/riot/chaplain/teutonic, /obj/item/clothing/suit/armor/riot/chaplain/teutonic/alt, /obj/item/clothing/suit/armor/riot/chaplain/hospitaller)

/// коробка

/obj/item/storage/box/wh_kit
	name = "A box of Unholy Armor"
	desc = "This is a box imbued with the demonic influence of the Dark Gods, containing armor modkit inside"
	icon_state = "box"

/obj/item/storage/box/wh_kit/PopulateContents()
	new /obj/item/modkit/whhelmet_kit(src)
	new /obj/item/modkit/wharmor_kit(src)

/// лодаут

/datum/gear/donator/bm/wh_kit
	name = "A box of Unholy Armor"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/storage/box/wh_kit
	ckeywhitelist = list("DarkSunGwyndolin")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
