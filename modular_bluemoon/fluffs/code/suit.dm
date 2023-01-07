/obj/item/clothing/suit/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	desc = "When equipped, a strange hologram is activated, and the fabric of the cloak itself disappears, and lightning starts projecting all over the body."
	icon_state = "lightning_holo"
	item_state = "lightning_holo_blue"
	actions_types = list(/datum/action/item_action/adjust)
	var/static/list/lightning_holocloak_designs
	var/choice = null

/obj/item/clothing/suit/donator/bm/lightning_holocloak/Initialize(mapload)
	.=..()
	if(!lightning_holocloak_designs)
		lightning_holocloak_designs = list(
			"Blue lightnings" = image(icon = src.icon, icon_state = "lightning_holo_blue"),
			"Pink lightnings" = image(icon = src.icon, icon_state = "lightning_holo_pink"),
			"Red lightnings" = image(icon = src.icon, icon_state = "lightning_holo_red"),
			"Yellow lightnings" = image(icon = src.icon, icon_state = "lightning_holo_yellow")
			)

/obj/item/clothing/suit/donator/bm/lightning_holocloak/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/static/list/options = list(
	"Blue lightnings" = "lightning_holo_blue",
	"Pink lightnings" = "lightning_holo_pink",
	"Red lightnings" = "lightning_holo_red",
	"Yellow lightnings" = "lightning_holo_yellow"
	)

	var/choice = show_radial_menu(user,src, lightning_holocloak_designs, custom_check = FALSE, radius = 36, require_near = TRUE)

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, "<span class='notice'>Your lightning holo-cloak has now morphed into [choice].</span>")
		return TRUE
