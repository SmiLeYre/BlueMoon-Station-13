/datum/design/blast_control
	name = "Blast Door Controller"
	id = "blast_control"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50, /datum/material/glass = 50)
	build_path = /obj/item/assembly/control
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/sticky_tape
	name = "Tape Roll"
	id = "tape"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = 500)
	build_path = /obj/item/stack/sticky_tape
	category = list("initial","Misc")

