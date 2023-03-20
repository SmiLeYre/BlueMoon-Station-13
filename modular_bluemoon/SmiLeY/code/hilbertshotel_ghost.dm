/obj/item/hilbertshotel/ghostdojo
	name = "infinite dormitories"
	anchored = TRUE

/obj/item/hilbertshotel/ghostdojo/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(user.mind?.antag_datums)
		to_chat(user, "<span class='warning'>Your special role doesn't allow you to enter infinity dormitory.</span>")
		return //you can't enter infinity dormitories if you are a role
	return promptAndCheckIn(user, user)

/datum/map_template/ghost_cafe_rooms
	name = "Apartment"
	mappath = '_maps/templates/apartment.dmm'
