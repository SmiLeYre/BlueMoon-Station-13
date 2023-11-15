/mob/living
	var/datum/description_profile/profile

/client/verb/regenerate_cached_character_appearance()
	set name = "Regenerate Cached Profile Appearance"
	set category = "OOC"
	set desc = "Regenerates the cached appearance of your character in their profile."

	if (usr.name in GLOB.cached_previews)
		GLOB.cached_previews[usr.name] = getFlatIcon(usr)
		to_chat(usr, span_notice("Your cached appearance has been regenerated."))
	else
		to_chat(usr, span_boldwarning("Your current mob was not found in the appearance cache."))

GLOBAL_LIST_EMPTY(cached_previews)

/datum/description_profile
	var/datum/weakref/host
	var/atom/movable/screen/map_view/examine_panel_screen/examine_panel_screen
	var/mutable_appearance/current_mob_appearance
	var/mutable_appearance/current_background
	var/static/list/preview_backgrounds = list("000", "midgrey", "FFF", "white", "steel", "techmaint", "dark", "plating", "reinforced")

/datum/description_profile/New(var/host_mob)
	. = ..()
	host = WEAKREF(host_mob)


/datum/description_profile/Destroy(force, ...)
	. = ..()
	host = null

/datum/description_profile/ui_state()
	return GLOB.always_state

/atom/movable/screen/map_view/examine_panel_screen
	name = "description profile screen"

/datum/description_profile/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	var/data[0]
	var/mob/living/M = host.resolve()

	data["character_ref"] = examine_panel_screen.assigned_map
	data["directory_visible"] = M?.client?.prefs?.show_in_directory
	data["headshot_link"] = M?.client?.prefs?.features["headshot_link"]

	if (istype(M, /mob/living/silicon))
		data["flavortext"] = M?.client?.prefs.features["silicon_flavor_text"] || ""

	data["oocnotes"] = M?.client?.prefs?.features["ooc_notes"] || ""
	data["species_name"] = M?.client?.prefs?.custom_species || "Космонавтик"
	data["custom_species_lore"] = M?.client?.prefs.features["custom_species_lore"] || "Не имеющий описания своей расы космонавтик. Просто космонавтик!"
	data["vore_tag"] = M?.client?.prefs?.vorepref || "No"
	data["erp_tag"] = M?.client?.prefs?.erppref || "No"
	data["mob_tag"] = M?.client?.prefs?.mobsexpref || "No"
	data["nc_tag"] = M?.client?.prefs?.nonconpref || "No"
	data["unholy_tag"] = M?.client?.prefs?.unholypref || "No"
	data["extreme_tag"] = M?.client?.prefs?.extremepref || "No"
	data["very_extreme_tag"] = M?.client?.prefs?.extremeharm || "No"

	return data

/datum/description_profile/ui_data(mob/user)
	. = ..()
	var/data[0]
	var/mob/living/M = host.resolve()
	var/unknown = FALSE
	if (iscarbon(M))
		var/mob/living/carbon/C = M
		unknown = (C.wear_mask && (C.wear_mask.flags_inv & HIDEEYES) && !isobserver(user)) || (C.head && (C.head.flags_inv & HIDEEYES) && !isobserver(user))
		data["flavortext"] = (!unknown) ? (M?.client?.prefs?.features["flavor_text"] || "") : "Скрыто"
		if (istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = C
			var/can_see_naked = !(unknown || (H.w_uniform || H.wear_suit))
			data["flavortext_naked"] = (can_see_naked && M?.client?.prefs?.features["naked_flavor_text"]) || ""

	data["is_unknown"] = unknown

	return data

/datum/description_profile/proc/update_preview()

	if(!examine_panel_screen || !current_background)
		return

	var/mob/living/M = host.resolve()
	current_mob_appearance = new(M)
	current_mob_appearance.setDir(SOUTH)
	current_mob_appearance.transform = matrix() // We reset their rotation, in case they're lying down.

	// In case they're pixel-shifted, we bring 'em back!
	current_mob_appearance.pixel_x = 0
	current_mob_appearance.pixel_y = 0

	current_mob_appearance.add_overlay(current_background)

	examine_panel_screen.cut_overlays()
	examine_panel_screen.add_overlay(current_mob_appearance)

/datum/description_profile/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	var/mob/living/M = host.resolve()

	if(!examine_panel_screen)
		examine_panel_screen = new
		examine_panel_screen.name = "character icon"
		examine_panel_screen.assigned_map = "examine_panel_[REF(M)]_map"
		examine_panel_screen.del_on_map_removal = FALSE
		examine_panel_screen.screen_loc = "[examine_panel_screen.assigned_map]:1,1"

	if (!current_background)
		current_background = mutable_appearance('modular_citadel/icons/ui/backgrounds.dmi', "reinforced", layer = SPACE_LAYER)

	update_preview()

	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		user.client.register_map_obj(examine_panel_screen)
		examine_panel_screen.setDir(SOUTH)
		ui = new(user, src, "CharacterProfile", "Профиль персонажа [M]")
		ui.open()

/datum/description_profile/ui_act(action, list/params)
	. = ..()
	if (.)
		return

	switch (action)
		if("character_directory")
			var/static/datum/character_directory/character_directory = new
			character_directory.ui_interact(usr)
		if("char_right")
			examine_panel_screen.setDir(turn(examine_panel_screen.dir, -90))
		if("char_left")
			examine_panel_screen.setDir(turn(examine_panel_screen.dir, 90))
		if("change_background")
			current_background.icon_state = next_list_item(current_background.icon_state, preview_backgrounds)
			return TRUE

