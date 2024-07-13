// This outfit preserves varedits made on the items
// Created from admin helpers.
/datum/outfit/varedit
	var/list/vv_values
	var/list/stored_access

/datum/outfit/varedit/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.delete_equipment() //Applying VV to wrong objects is not reccomended.
	. = ..()

/datum/outfit/varedit/proc/set_equipement_by_slot(slot,item_path)
	switch(slot)
		if(ITEM_SLOT_ICLOTHING)
			uniform = item_path
		if(ITEM_SLOT_BACK)
			back = item_path
		if(ITEM_SLOT_OCLOTHING)
			suit = item_path
		if(ITEM_SLOT_BELT)
			belt = item_path
		if(ITEM_SLOT_GLOVES)
			gloves = item_path
		if(ITEM_SLOT_FEET)
			shoes = item_path
		if(ITEM_SLOT_HEAD)
			head = item_path
		if(ITEM_SLOT_MASK)
			mask = item_path
		if(ITEM_SLOT_NECK)
			neck = item_path
		//BLUEMOON EDIT ADDITION BEGIN
		if(ITEM_SLOT_SHOULDERS)
			shoulders = item_path
		//BLUEMOON EDIT ADDITION END
		// Sandstorm edit
		if(ITEM_SLOT_EARS_LEFT)
			ears = item_path
		if(ITEM_SLOT_EARS_RIGHT)
			ears_extra = item_path
		if(ITEM_SLOT_WRISTS)
			wrists = item_path
		if(ITEM_SLOT_SHIRT)
			shirt = item_path
		if(ITEM_SLOT_UNDERWEAR)
			underwear = item_path
		if(ITEM_SLOT_SOCKS)
			socks = item_path
		//
		if(ITEM_SLOT_EYES)
			glasses = item_path
		if(ITEM_SLOT_ID)
			id = item_path
		if(ITEM_SLOT_SUITSTORE)
			suit_store = item_path
		if(ITEM_SLOT_LPOCKET)
			l_pocket = item_path
		if(ITEM_SLOT_RPOCKET)
			r_pocket = item_path


/proc/collect_vv(obj/item/I)
	//Temporary/Internal stuff, do not copy these.
	var/static/list/ignored_vars = list("vars","x","y","z","plane","layer","override","animate_movement","pixel_step_size","screen_loc","fingerprintslast","tip_timer")

	if(istype(I) && I.datum_flags & DF_VAR_EDITED)
		var/list/vedits = list()
		for(var/varname in I.vars)
			if(!I.can_vv_get(varname))
				continue
			if(varname in ignored_vars)
				continue
			var/vval = I.vars[varname]
			//Does it even work ?
			if(vval == initial(I.vars[varname]))
				continue
			//Only text/numbers and icons variables to make it less weirdness prone.
			if(!istext(vval) && !isnum(vval) && !isicon(vval))
				continue
			vedits[varname] = I.vars[varname]
		return vedits

/mob/living/carbon/human/proc/copy_outfit()
	var/datum/outfit/varedit/O = new

	//Copy equipment
	var/list/result = list()
	//BLUEMOON EDIT CHANGE BEGIN
	//var/list/slots_to_check = list(ITEM_SLOT_ICLOTHING,ITEM_SLOT_UNDERWEAR,ITEM_SLOT_SHIRT,ITEM_SLOT_SOCKS,ITEM_SLOT_BACK,ITEM_SLOT_OCLOTHING,ITEM_SLOT_BELT,ITEM_SLOT_GLOVES,ITEM_SLOT_WRISTS,ITEM_SLOT_FEET,ITEM_SLOT_HEAD,ITEM_SLOT_MASK,ITEM_SLOT_NECK,ITEM_SLOT_EARS_LEFT,ITEM_SLOT_EARS_RIGHT,ITEM_SLOT_EYES,ITEM_SLOT_ID,ITEM_SLOT_SUITSTORE,ITEM_SLOT_LPOCKET,ITEM_SLOT_RPOCKET) // Sandstorm edit - BLUEMOON EDIT - ORIGINAL
	var/list/slots_to_check = list(ITEM_SLOT_ICLOTHING,ITEM_SLOT_UNDERWEAR,ITEM_SLOT_SHIRT,ITEM_SLOT_SOCKS,ITEM_SLOT_BACK,ITEM_SLOT_OCLOTHING,ITEM_SLOT_BELT,ITEM_SLOT_GLOVES,ITEM_SLOT_WRISTS,ITEM_SLOT_FEET,ITEM_SLOT_HEAD,ITEM_SLOT_MASK,ITEM_SLOT_NECK,ITEM_SLOT_EARS_LEFT,ITEM_SLOT_EARS_RIGHT,ITEM_SLOT_EYES,ITEM_SLOT_ID,ITEM_SLOT_SUITSTORE,ITEM_SLOT_LPOCKET,ITEM_SLOT_RPOCKET,ITEM_SLOT_SHOULDERS)
	//BLUEMOON EDIT CHANGE END
	for(var/s in slots_to_check)
		var/obj/item/I = get_item_by_slot(s)
		var/vedits = collect_vv(I)
		if(vedits)
			result["[s]"] = vedits
		if(istype(I))
			O.set_equipement_by_slot(s,I.type)

	//Copy access
	O.stored_access = list()
	var/obj/item/id_slot = get_item_by_slot(ITEM_SLOT_ID)
	if(id_slot)
		O.stored_access |= id_slot.GetAccess()
	//Copy hands
	if(held_items.len >= 2) //Not in the mood to let outfits transfer amputees
		var/obj/item/left_hand = held_items[1]
		var/obj/item/right_hand = held_items[2]
		if(istype(left_hand))
			O.l_hand = left_hand.type
			var/vedits = collect_vv(left_hand)
			if(vedits)
				result["LHAND"] = vedits
		if(istype(right_hand))
			O.r_hand = right_hand.type
			var/vedits = collect_vv(left_hand)
			if(vedits)
				result["RHAND"] = vedits
	O.vv_values = result
	//Copy backpack contents if exist.
	var/obj/item/backpack = get_item_by_slot(ITEM_SLOT_BACK)
	if(istype(backpack) && SEND_SIGNAL(backpack, COMSIG_CONTAINS_STORAGE))
		var/list/bp_stuff = list()
		var/list/typecounts = list()
		SEND_SIGNAL(backpack, COMSIG_TRY_STORAGE_RETURN_INVENTORY, bp_stuff, FALSE)
		for(var/obj/item/I in bp_stuff)
			if(typecounts[I.type])
				typecounts[I.type] += 1
			else
				typecounts[I.type] = 1
		O.backpack_contents = typecounts
		//TODO : Copy varedits from backpack stuff too.
	//Copy implants
	O.implants = list()
	for(var/obj/item/implant/I in implants)
		O.implants |= I.type
	//Copy to outfit cache
	var/outfit_name = stripped_input(usr,"Enter the outfit name")
	O.name = outfit_name
	GLOB.custom_outfits += O
	to_chat(usr,"Outfit registered, use select equipment to equip it.")

/datum/outfit/varedit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	. = ..()
	//Apply VV
	for(var/slot in vv_values)
		var/list/edits = vv_values[slot]
		var/obj/item/I
		switch(slot)
			if("LHAND")
				I = H.held_items[1]
			if("RHAND")
				I = H.held_items[2]
			else
				I = H.get_item_by_slot(text2num(slot))
		for(var/vname in edits)
			I.vv_edit_var(vname,edits[vname])
	//Apply access
	var/obj/item/id_slot = H.get_item_by_slot(ITEM_SLOT_ID)
	if(id_slot)
		var/obj/item/card/id/card = id_slot.GetID()
		if(istype(card))
			card.access |= stored_access
