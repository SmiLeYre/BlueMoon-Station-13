/datum/design/luger_pistol
	name = "Luger P08"
	desc = "A non-easily concealable handgun modified to use 10mm bullets. Agents with this are trying to show off, and will probably die."
	id = "luger"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/storage/lockbox/weapon/luger_pistol
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/storage/lockbox/weapon/luger_pistol
	name = "Lockbox with Luger P08"

/obj/item/storage/lockbox/weapon/luger_pistol/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/luger(src)
