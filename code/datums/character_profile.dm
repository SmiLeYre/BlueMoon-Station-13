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

/datum/description_profile/New(var/host_mob)
	. = ..()
	host = WEAKREF(host_mob)


/datum/description_profile/Destroy(force, ...)
	. = ..()
	host = null

/datum/description_profile/ui_state()
	return GLOB.always_state

/datum/description_profile/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	var/data[0]
	var/mob/living/carbon/human/H = host.resolve()

	data["directory_visible"] = H?.client?.prefs?.show_in_directory
	data["headshot_link"] = H?.client?.prefs?.features["headshot_link"]
	data["flavortext_general"] = H?.client?.prefs?.features["flavor_text"] || ""
	data["flavortext_naked"] = H?.client?.prefs?.features["naked_flavor_text"] || ""
	data["silicon_flavor_text"] = H?.client?.prefs.features["silicon_flavor_text"] || ""
	data["oocnotes"] = H?.client?.prefs?.features["ooc_notes"] || ""
	data["species_name"] = H?.client?.prefs?.custom_species || "Космонавтик"
	data["species_text"] = H?.client?.prefs?.custom_species_lore || "Не имеющий описания своей расы космонавтик. Просто космонавтик!"
	data["vore_tag"] = H?.client?.prefs?.vorepref || "No"
	data["erp_tag"] = H?.client?.prefs?.erppref || "No"
	data["mob_tag"] = H?.client?.prefs?.mobsexpref || "No"
	data["nc_tag"] = H?.client?.prefs?.nonconpref || "No"
	data["unholy_tag"] = H?.client?.prefs?.extremepref || "No"
	data["very_unholy_tag"] = H?.client?.prefs?.extremeharm || "No"

	return data

/datum/description_profile/ui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	var/mob/living/carbon/human/H = host.resolve()
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "CharacterProfile", "Профиль Персонажа [H]")
		ui.open()

/datum/description_profile/ui_act(action, list/params)
	. = ..()
	if (.)
		return

	switch (action)
		if("character_directory")
			var/static/datum/character_directory/character_directory = new
			character_directory.ui_interact(usr)
