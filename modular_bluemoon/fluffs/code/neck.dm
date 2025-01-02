/obj/item/clothing/neck/plashik_zaeb
	name = "SMART-fabric boatcloak"
	desc = "The tissue is capable of changing its structure by reading small nerve impulses from the body."
	icon_state = "basa"
	item_state = "basa"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/neck.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/neck.dmi'
	actions_types = list(/datum/action/item_action/adjust)
	var/list/plashik_zaeb_designs = list()


/obj/item/clothing/neck/plashik_zaeb/Initialize(mapload)
	. = ..()
	plashik_zaeb_designs = list(
		"roboeb" = image(icon = src.icon, icon_state = "roboeb"),
		"sci" = image(icon = src.icon, icon_state = "scienist"),
		"atmos" = image(icon = src.icon, icon_state = "atmos"),
		"engi" = image(icon = src.icon, icon_state = "engi"),
		"basa" = image(icon = src.icon, icon_state = "basa"),
		)

/obj/item/clothing/neck/plashik_zaeb/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/static/list/options = list("roboeb" = "roboeb", "sci" = "scienist", "atmos" = "atmos",
							"engi" = "engi", "basa" = "basa")

	var/choice = show_radial_menu(user, src, plashik_zaeb_designs, custom_check = FALSE, radius = 36, require_near = TRUE)

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtons()
		to_chat(user, "<span class='notice'>Your SMART-fabric boatcloak now has a [choice] design!</span>")
		return TRUE
