/obj/item/hilbertshotel/ghostdojo
	name = "infinite dormitories"
	anchored = TRUE

/obj/item/hilbertshotel/ghostdojo/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(((GLOB.master_mode != "Extended"))&&(user.mind?.antag_datums))
		if(user.mind?.has_antag_datum(/datum/antagonist/ghost_role))
			return promptAndCheckIn(user, user)
		if(user.mind?.has_antag_datum(/datum/antagonist/ashwalker))
			return promptAndCheckIn(user, user)
		else
			to_chat(user, "<span class='warning'>Your special role doesn't allow you to enter infinity dormitory.</span>")
			return //you can't enter infinity dormitories if you are a role
	return promptAndCheckIn(user, user)

/datum/map_template/hilbertshotel/apartment
	name = "Apartment"
	mappath = '_maps/templates/apartment.dmm'

/datum/map_template/hilbertshotel/apartment/one
	name = "Apartment_1"
	mappath = '_maps/templates/apartment_1.dmm'

/datum/map_template/hilbertshotel/apartment/two
	name = "Apartment_2"
	mappath = '_maps/templates/apartment_2.dmm'

/datum/map_template/hilbertshotel/apartment/three
	name = "Apartment_3"
	mappath = '_maps/templates/apartment_3.dmm'

/datum/map_template/hilbertshotel/apartment/bar
	name = "Apartment_bar"
	mappath = '_maps/templates/apartment_bar.dmm'

/datum/map_template/hilbertshotel/apartment/syndi
	name = "Apartment_syndi"
	mappath = '_maps/templates/apartment_syndi.dmm'

/datum/map_template/hilbertshotel/apartment/dojo
	name = "Apartment_dojo"
	mappath = '_maps/templates/apartment_dojo.dmm'

/datum/map_template/hilbertshotel/apartment/sauna
	name = "Apartment_sauna"
	mappath = '_maps/templates/apartment_sauna.dmm'

/datum/map_template/hilbertshotel/apartment/beach
	name = "Apartment_beach"
	mappath = '_maps/templates/apartment_beach.dmm'

/datum/map_template/hilbertshotel/apartment/forest
	name = "Apartment_forest"
	mappath = '_maps/templates/apartment_forest.dmm'

/datum/map_template/hilbertshotel/apartment/jungle
	name = "Apartment_jungle"
	mappath = '_maps/templates/apartment_jungle.dmm'

/datum/map_template/hilbertshotel/apartment/prison
	name = "Apartment_prison"
	mappath = '_maps/templates/apartment_prison.dmm'

/datum/map_template/hilbertshotel/apartment/winter
	name = "Apartment_winter"
	mappath = '_maps/templates/apartment_winter.dmm'

/datum/map_template/hilbertshotel/apartment/sport
	name = "Apartment_GYM"
	mappath = '_maps/templates/apartment_sportzone.dmm'

/datum/map_template/hilbertshotel/apartment/capsule
	name = "Apartment_winter"
	mappath = '_maps/templates/apartment_capsule.dmm'
  