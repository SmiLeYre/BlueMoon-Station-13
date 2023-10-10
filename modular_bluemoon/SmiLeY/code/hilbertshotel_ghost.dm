/obj/item/hilbertshotel/ghostdojo
	name = "infinite dormitories"
	anchored = TRUE

/obj/item/hilbertshotel/ghostdojo/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(user.mind?.antag_datums)
		if(user.mind?.has_antag_datum(/datum/antagonist/ghost_role))
			return promptAndCheckIn(user, user)
		if(user.mind?.has_antag_datum(/datum/antagonist/ashwalker))
			return promptAndCheckIn(user, user)
		else
			to_chat(user, "<span class='warning'>Your special role doesn't allow you to enter infinity dormitory.</span>")
			return //you can't enter infinity dormitories if you are a role
	return promptAndCheckIn(user, user)

/datum/map_template/ghost_cafe_rooms
	name = "Apartment"
	mappath = '_maps/templates/apartment.dmm'

/datum/map_template/ghost_cafe_rooms/one
	name = "Apartment_1"
	mappath = '_maps/templates/apartment_1.dmm'

/datum/map_template/ghost_cafe_rooms/two
	name = "Apartment_2"
	mappath = '_maps/templates/apartment_2.dmm'

/datum/map_template/ghost_cafe_rooms/three
	name = "Apartment_3"
	mappath = '_maps/templates/apartment_3.dmm'

/datum/map_template/ghost_cafe_rooms/bar
	name = "Apartment_bar"
	mappath = '_maps/templates/apartment_bar.dmm'

/datum/map_template/ghost_cafe_rooms/syndi
	name = "Apartment_syndi"
	mappath = '_maps/templates/apartment_syndi.dmm'

/datum/map_template/ghost_cafe_rooms/dojo
	name = "Apartment_dojo"
	mappath = '_maps/templates/apartment_dojo.dmm'

/datum/map_template/ghost_cafe_rooms/sauna
	name = "Apartment_sauna"
	mappath = '_maps/templates/apartment_sauna.dmm'
