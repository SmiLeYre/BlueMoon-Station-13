/obj/vehicle/sealed/mecha/combat/phazon
	desc = "This is a Phazon exosuit. The pinnacle of scientific research and pride of Nanotrasen, it uses cutting edge bluespace technology and expensive materials."
	name = "\improper Phazon"
	icon_state = "phazon"
	movedelay = 2
	dir_in = 2 //Facing South.
	normal_step_energy_drain = 3
	max_integrity = 100
	deflect_chance = 30
	armor = list(MELEE = 10, BULLET = 25, LASER = 25, ENERGY = 25, BOMB = 20, BIO = 0, RAD = 50, FIRE = 100, ACID = 100)
	max_temperature = 25000
	wreckage = /obj/structure/mecha_wreckage/phazon
	internal_damage_threshold = 25
	force = 15
	max_equip = 3
	phase_state = "phazon-phase"

/obj/vehicle/sealed/mecha/combat/phazon/generate_actions()
	. = ..()
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_toggle_phasing)
	initialize_passenger_action_type(/datum/action/vehicle/sealed/mecha/mech_switch_damtype)
