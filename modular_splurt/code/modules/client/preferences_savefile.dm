/datum/preferences/update_preferences(current_version, savefile/S)
	. = ..()
	if(current_version < 57.01) //a
		new_character_creator = TRUE

/datum/preferences/update_character(current_version, savefile/S)
	. = ..()
	if(current_version < 53.01)
		if(!features["balls_fluid"] || !(find_reagent_object_from_type(features["balls_fluid"]) in GLOB.genital_fluids_list))
			features["balls_fluid"] = /datum/reagent/consumable/semen
		if(!features["breasts_fluid"] || !(find_reagent_object_from_type(features["breasts_fluid"]) in GLOB.genital_fluids_list))
			features["breasts_fluid"] = /datum/reagent/consumable/milk
		if(!features["womb_fluid"] || !(find_reagent_object_from_type(features["womb_fluid"]) in GLOB.genital_fluids_list))
			features["womb_fluid"] = /datum/reagent/consumable/semen/femcum
