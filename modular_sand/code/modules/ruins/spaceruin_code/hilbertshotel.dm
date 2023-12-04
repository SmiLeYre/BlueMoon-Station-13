/obj/item/hilbertshotel/ghostdojo/attack_robot(mob/user)
	. = ..()
	interact(user)
	return attack_hand(user)
