/obj/item/clothing/head/helmet/hecu
	name = "Powered Combat Helmet"
	desc = "A deprecated combat helmet developed during the early 21th century in Sol-3, with protections rated level III-A. Contains attachment points for AN/PVS night vision goggles."
	icon = 'modular_bluemoon/SmiLeY/hecu/icons/hecucloth.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/hecu/icons/hecumob.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/SmiLeY/hecu/icons/hecumob_muzzled.dmi'
	icon_state = "hecu_helm"
	item_state = "hecu_helm"
	mutantrace_variation = STYLE_MUZZLE
	flags_cover = null // Doesn't cover eyes.
	unique_reskin = list(
		"Basic" = list(
			RESKIN_ICON_STATE = "hecu_helm",
			RESKIN_ITEM_STATE = "hecu_helm"
		),
		"Corpsman" = list(
			RESKIN_ICON_STATE = "hecu_helm_medic",
			RESKIN_ITEM_STATE = "hecu_helm_medic"
		),
		"Basic Black" = list(
			RESKIN_ICON_STATE = "hecu_helm_black",
			RESKIN_ITEM_STATE = "hecu_helm_black"
		),
		"Corpsman Black" = list(
			RESKIN_ICON_STATE = "hecu_helm_medic_black",
			RESKIN_ITEM_STATE = "hecu_helm_medic_black"
		),
	)

