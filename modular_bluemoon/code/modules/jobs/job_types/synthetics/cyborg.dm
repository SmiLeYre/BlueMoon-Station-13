/datum/job/cyborg/after_spawn(mob/living/silicon/robot/R, client/player_client)
	. = ..()
	if(!istype(R))
		return

	if(player_client.prefs.silicon_lawset)
		var/list/laws = CONFIG_GET(keyed_list/choosable_laws)
		var/law_path = text2path(laws[player_client.prefs.silicon_lawset])
		var/obj/item/aiModule/chosenboard = new law_path
		chosenboard.install(R.laws, usr)
		qdel(chosenboard)
