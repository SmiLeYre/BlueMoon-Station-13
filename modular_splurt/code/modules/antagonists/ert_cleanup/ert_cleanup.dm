//This file contains everything to spawn ERT for cleaning up a nuclear reactor meltdown, if those things could actually explode

//ERT
/datum/ert/cleanup
	rename_team = "Janitor Team Squad"
	code = "Blue"	//CC probably wouldn't know if it was sabotage or not, but nuclear waste is a hazard to personnel
	mission = "Remove all nuclear residue from X station"
	enforce_human = FALSE
	opendoors = FALSE
	polldesc = "a Universal Cleaners"
	teamsize = 3	//2 is not enough for such a big area, 4 is too much
	leader_role = /datum/antagonist/ert/cleanup
	roles = list(/datum/antagonist/ert/cleanup)

/datum/ert/cleanup/New()
	mission = "Уберитесь на [station_name()]."

//Antag mind & team (for objectives on what to do)
/datum/antagonist/ert/cleanup
	name = "Janitor Team Squad"
	role = "Janitor Team Squad"
	ert_team = /datum/team/ert/cleanup
	outfit = /datum/outfit/ert/cleanup

/datum/antagonist/ert/cleanup/greet()
	//\an [name] because modularization is nice
	to_chat(owner, "Ты \an [name].\n\
		Ты должен очистить [station_name()] от всевозможной грязи, \
		ведь по мнению Nanotrasen чистота структур этой Космической Станции очень важна.")

/datum/team/ert/cleanup
	mission = "Спаси как можно больше сотрудников."
	objectives = list("Спаси как можно больше сотрудников.")

//Outfit
/datum/outfit/ert/cleanup
	name = "Emergency Cleanup Technician"
	id = /obj/item/card/id/ert/Engineer/cleanup
	uniform = /obj/item/clothing/under/rank/engineering/chief_engineer
	suit = /obj/item/clothing/suit/space/hardsuit/rd/hev/no_sound/nuclear_sanitation
	glasses = /obj/item/clothing/glasses/meson/engine
	back = /obj/item/storage/backpack/industrial
	gloves = /obj/item/clothing/gloves/color/yellow/nuclear_sanitation
	shoes = /obj/item/clothing/shoes/jackboots/nuclear_sanitation
	suit_store = /obj/item/tank/internals/emergency_oxygen/double
	belt = /obj/item/storage/belt/military/abductor/full/debug
	backpack_contents = list(/obj/item/storage/firstaid/tactical/slaver=1,
		/obj/item/crowbar/power=1,
		/obj/item/mop/advanced=1,
		/obj/item/gun/energy/e_gun/advtaser=1,
		/obj/item/construction/rcd/combat/admin=1)

/datum/outfit/ert/cleanup/New()
	if(prob(30))
		l_hand = /obj/item/inducer/sci/combat	//A whole engine gets destroyed, so add a nice inducer to help charge areas back up
	. = ..()

//Clothes
/obj/item/radio/headset/headset_cent/cleanup
	icon_state = "rob_headset"	//cause it looks fancy
	keyslot = new /obj/item/encryptionkey/headset_eng

/obj/item/card/id/ert/Engineer/cleanup
	registered_name = "Waste Expert"
	assignment = "Emergency Cleanup Technician"

/obj/item/card/id/ert/Engineer/cleanup/Initialize()
	. = ..()
	access = get_ert_access("eng")+get_region_accesses(1)+get_region_accesses(5)+get_region_accesses(7)	//CC eng, general, engineering, and command

/obj/item/clothing/gloves/color/yellow/nuclear_sanitation
	name = "thick gloves"
	desc = "A pair of yellow gloves. They help protect from radiation."
	siemens_coefficient = 0.85
	permeability_coefficient = 0.7
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 20, "rad" = 100, "fire" = 0, "acid" = 50)

/obj/item/clothing/shoes/jackboots/nuclear_sanitation
	desc = "A pair of jackboots, sewn with special material to help protect from radiation."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 5, "bomb" = 5, "bio" = 0, "rad" = 100, "fire" = 10, "acid" = 70)

/obj/item/clothing/suit/space/hardsuit/rd/hev/no_sound/nuclear_sanitation
	name = "improved radiation suit"
	desc = "A radiation suit that's been manufactured for being a hardsuit. It provides complete protection from radiation and bio contaminants."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/rd/hev/no_scanner/nuclear_sanitation
	slowdown = 0.25		//removes 30% of the slowness. This is actually a considerable amount

/obj/item/clothing/head/helmet/space/hardsuit/rd/hev/no_scanner/nuclear_sanitation
	name = "improved radiation hood"
	desc = "It protects from radiation and bio contaminants."
