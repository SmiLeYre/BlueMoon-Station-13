/obj/item/hilbertshotel
	w_class = WEIGHT_CLASS_GIGANTIC
	var/list/list/mob_dorms = list()

/obj/item/hilbertshotel/sendToNewRoom(roomNumber, mob/user)
	. = ..()
	if(!mob_dorms[user]?.Find(roomNumber))
		LAZYADD(mob_dorms[user], roomNumber)

// Better SPLURT version of hilbert's
/datum/map_template/hilbertshotel
	mappath = '_maps/splurt_maps/templates/hilbertshotel.dmm'

// Empty room - different due to the dimensions of the updated map
/datum/map_template/hilbertshotel/empty
	mappath = '_maps/splurt_maps/templates/hilbertshotelempty.dmm'

// Fluff - Misc
/obj/item/paper/fluff/hilbertshotel/welcomeletter
	name = "Welcome Letter"
	default_raw_text = "Welcome to Hilbert's Hotel!<BR>\
	<BR>\
	Each room in the hotel is an unique pocket dimension: You can choose up to 5 rooms per shift, each room you select will remember your actions and belongings, allowing you to create your own personal space.<BR>\
	Inside the complementary guest box you'll find some sweets, each one as unique and delightful as our rooms. Savour them as you relax∼<BR>\
	Remember, your rooms are always available for you to return to.<BR>\
	<BR>\
	Enjoy your stay∼!<BR>\
	<BR>\
	With love,<BR>\
	Aniya ♥"
