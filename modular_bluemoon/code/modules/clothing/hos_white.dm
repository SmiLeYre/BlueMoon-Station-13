// личная херня для панофобии. мы живём в обществе

// Сами предметы
/obj/item/clothing/suit/armor/hos/trenchcoat/white
	name = "white armored trenchcoat"
	desc = "White armored coat. Armored coat in white colors for good boys and girls of NanoTrasen."
	icon_state = "hos_trench_white"
	item_state = "hos_trench_white"
	icon = 'modular_bluemoon/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/uniforms.dmi'
	unique_reskin = list()
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/shoes/jackboots/sec/white
	name = "white jackboots"
	desc = "Security jackboots in white colors."
	icon_state = "jackboots_sec_white"
	item_state = "jackboots_sec_white"
	icon = 'modular_bluemoon/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/uniforms.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/head/HoS/beret/white
	name = "white beret"
	desc = "Armored beret in white colors for good boys and girls of NanoTrasen."
	icon_state = "hos_beret_white"
	item_state = "hos_beret_white"
	icon = 'modular_bluemoon/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/uniforms.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

// Лодаутные датумы

/datum/gear/donator/bm/panophobia_hos_beret
	name = "White beret"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/HoS/beret/white
	ckeywhitelist = list("earthphobia")
	restricted_roles = list("Head of Security")
	subcategory = LOADOUT_SUBCATEGORIES_DON02

/datum/gear/donator/bm/panophobia_hos_trench
	name = "White armored trenchcoat"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/armor/hos/trenchcoat/white
	ckeywhitelist = list("earthphobia")
	restricted_roles = list("Head of Security")
	subcategory = LOADOUT_SUBCATEGORIES_DON02

/datum/gear/donator/bm/panophobia_hos_jackboots
	name = "White jackboots"
	slot = ITEM_SLOT_FEET
	path = /obj/item/clothing/shoes/jackboots/sec/white
	ckeywhitelist = list("earthphobia")
	restricted_roles = list("Head of Security")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
