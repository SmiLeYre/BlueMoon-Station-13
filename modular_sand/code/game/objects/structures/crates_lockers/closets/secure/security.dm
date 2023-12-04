/obj/structure/closet/secure_closet/captains/PopulateContents() //Excess clothing and such can be found in the Captain's Wardrobe. You can also find this file in code/modules/vending/wardrobes.
	..()
	new /obj/item/card/id/departmental_budget/civ(src)
	new /obj/item/tank/internals/emergency_oxygen/double(src)
	new /obj/item/bikehorn/rubberducky/captain(src)
	new /obj/item/lighter/cap(src)

/obj/structure/closet/secure_closet/hop/PopulateContents()
	..()
	new /obj/item/card/id/departmental_budget/srv(src)
	new /obj/item/lighter/hop(src)

/obj/structure/closet/secure_closet/hos/PopulateContents()
	..()
	new /obj/item/card/id/departmental_budget/sec(src)
	new /obj/item/lighter/hos(src)
