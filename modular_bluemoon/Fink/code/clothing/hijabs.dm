/obj/item/clothing/mask/balaclava/breath/hijab
	name = "Polychromic Hijab"
	desc = "Inshallah"
	icon_state = "hijab_he"
	item_state = "hijab"
	icon = 'modular_bluemoon/Fink/icons/clothing/hijabs_obj.dmi'
	mob_overlay_icon = 'modular_bluemoon/Fink/icons/clothing/hijabs.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Fink/icons/clothing/hijabs_muzzled.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEEARS|HIDEHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	mutantrace_variation = STYLE_MUZZLE|STYLE_NO_ANTHRO_ICON
	clothing_flags = ALLOWINTERNALS
	actions_types = list(/datum/action/item_action/adjust)
	var/list/poly_colors = list("#ffffff")

/obj/item/clothing/mask/balaclava/breath/hijab/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/head/turban
	name = "Polychromic Turban"
	desc = "Идёт караван из Ирана.."
	icon = 'modular_bluemoon/Fink/icons/clothing/hijabs.dmi'
	mob_overlay_icon = 'modular_bluemoon/Fink/icons/clothing/hijabs.dmi'
	icon_state = "turban_he"
	item_state = "turban"
	var/list/poly_colors = list("#ffffff")

/obj/item/clothing/head/turban/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)
