///Собственно шаттл

/area/shuttle/lambda
	name = "Lambda Code Shuttle"

/datum/map_template/shuttle/lambda
	prefix = "_maps/shuttles/"
	port_id = "lambda"
	name = "Lambda Code Shuttle"

/datum/map_template/shuttle/lambda/code
	suffix = "code"


// Различное

/obj/vehicle/sealed/mecha/combat/durand/loaded/Initialize(mapload)
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/thrusters/ion(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
	ME.attach(src)
	max_ammo()
