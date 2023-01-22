//makes upload consoles indestructible
/obj/machinery/computer/upload/Initialize()
	flags_1 |= NODECONSTRUCT_1
	resistance_flags |= INDESTRUCTIBLE
	. = ..()

//disables upload circuits from loading before the game starts, basicly deletes the,
/obj/item/circuitboard/computer/aiupload/New()
	if(SSticker.current_state != GAME_STATE_PLAYING)
		visible_message("<span class='warning'>[src] disapeears in a bluespace wormhole. Looks like someone doesn't want it to be crated so soon.")
		qdel(src)
	return
	. = ..()

/obj/item/circuitboard/computer/borgupload/New()
	if(SSticker.current_state != GAME_STATE_PLAYING)
		visible_message("<span class='warning'>[src] disapeears in a bluespace wormhole. Looks like someone doesn't want it to be crated so soon.")
		qdel(src)
		return
	. = ..()

//disables upload circuits printing, only admin-spawn
/datum/design/board/aiupload
	departmental_flags = 0

/datum/design/board/borgupload
	departmental_flags = 0

//overrides lootdrop
/obj/effect/spawner/lootdrop/techstorage/AI
	loot = list(
				/obj/item/circuitboard/aicore
				)
