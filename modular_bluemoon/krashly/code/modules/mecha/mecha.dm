///InteQ "Durand" Mecha
/obj/vehicle/sealed/mecha/combat/marauder/mauler/loaded/ares
	desc = "God of War among Mecha. SolFed developments in the field of exoskeletons have borne fruit. Armored Ares will mince your enemy."
	name = "\improper MIB-02 Ares"
	icon = 'modular_bluemoon/krashly/icons/obj/mecha/ares.dmi'
	icon_state = "ares"
	armor = list(MELEE = 60, BULLET = 65, LASER = 50, ENERGY = 40, BOMB = 50, BIO = 0, RAD = 100, FIRE = 100, ACID = 100)
	wreckage = /obj/structure/mecha_wreckage/ares

/obj/vehicle/sealed/mecha/combat/marauder/mauler/ares/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_smoke)

/obj/structure/mecha_wreckage/ares
	name = "\improper MIB-02 Ares wreckage"
	icon_state = "ares-broken"
	parts = list(
			/obj/item/mecha_parts/part/durand_torso,
			/obj/item/mecha_parts/part/durand_head,
			/obj/item/mecha_parts/part/durand_left_arm,
			/obj/item/mecha_parts/part/durand_right_arm,
			/obj/item/mecha_parts/part/durand_left_leg,
			/obj/item/mecha_parts/part/durand_right_leg)

///InteQ "Gygax" Mecha
/obj/vehicle/sealed/mecha/combat/gygax/dark/loaded/hermes
	desc = "God of Cunning among Mecha. SolFed developments in the field of exoskeletons have borne fruit. Fast and agile Hermes will mince your enemy."
	name = "\improper MIB-01 Hermes"
	icon = 'modular_bluemoon/krashly/icons/obj/mecha/hermes.dmi'
	icon_state = "hermes"
	armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 35, BOMB = 30, BIO = 0, RAD =40, FIRE = 100, ACID = 100)
	max_temperature = 60000
	wreckage = /obj/structure/mecha_wreckage/hermes

/obj/vehicle/sealed/mecha/combat/gygax/dark/hermes/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_smoke)
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/syndicate/mech_zoom)

/obj/structure/mecha_wreckage/hermes
	name = "\improper MIB-01 Hermes wreckage"
	icon_state = "hermes-broken"
	parts = list(
			/obj/item/mecha_parts/part/durand_torso,
			/obj/item/mecha_parts/part/durand_head,
			/obj/item/mecha_parts/part/durand_left_arm,
			/obj/item/mecha_parts/part/durand_right_arm,
			/obj/item/mecha_parts/part/durand_left_leg,
			/obj/item/mecha_parts/part/durand_right_leg)

/obj/vehicle/sealed/mecha/combat/gygax/dark/hermes/loaded/Initialize(mapload)
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/thrusters/ion(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/anticcw_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	ME.attach(src)
	max_ammo()
