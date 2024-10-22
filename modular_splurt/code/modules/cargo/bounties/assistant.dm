/datum/bounty/item/assistant/condom
	name = "Filled Condom"
	description = "Something wack is happening at Central Command, and now they requested some filled condoms?"
	reward = 6666
	required_count = 5
	wanted_types = list(/obj/item/genital_equipment/condom)

/datum/bounty/item/assistant/condom/applies_to(obj/O)
	if(!..())
		return FALSE
	var/obj/item/genital_equipment/condom/T = O
	return T.reagents.total_volume > 0

