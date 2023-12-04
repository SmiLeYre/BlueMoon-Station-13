
/*
	Uplink Items:
	Unlike categories, uplink item entries are automatically sorted alphabetically on server init in a global list,
	When adding new entries to the file, please keep them sorted by category.
*/

//Support and Mechs

/datum/uplink_item/support/clown_reinforcement
	name = "Clown Reinforcements"
	desc = "Call in an additional clown to share the fun, equipped with full starting gear, but no credits."
	item = /obj/item/antag_spawner/nuke_ops/clown
	cost = 20
	purchasable_from = UPLINK_CLOWN_OPS
	restricted = TRUE

/datum/uplink_item/support/reinforcement
	name = "Reinforcements"
	desc = "Call in an additional team member. They won't come with any gear, so you'll have to save some credits \
			to arm them as well."
	item = /obj/item/antag_spawner/nuke_ops
	cost = 25
	refundable = TRUE
	purchasable_from = UPLINK_NUKE_OPS
	restricted = TRUE

/datum/uplink_item/support/reinforcement/assault_borg
	name = "InteQ Assault Cyborg"
	desc = "A cyborg designed and programmed for systematic extermination of innocent personnel. \
			Comes equipped with a self-resupplying LMG, a grenade launcher, energy sword, emag, pinpointer, flash and crowbar."
	item = /obj/item/antag_spawner/nuke_ops/borg_tele/assault
	refundable = TRUE
	cost = 65
	restricted = TRUE

/datum/uplink_item/support/reinforcement/assault_borg/syndicate
	name = "Syndicate Assault Cyborg"
	item = /obj/item/antag_spawner/synd_borg/assault
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/support/reinforcement/medical_borg
	name = "InteQ Medical Cyborg"
	desc = "A combat medical cyborg. Has limited offensive potential, but makes more than up for it with its support capabilities. \
			It comes equipped with a nanite hypospray, a medical beamgun, combat defibrillator, full surgical kit including an energy saw, an emag, pinpointer and flash. \
			Thanks to its organ storage bag, it can perform surgery as well as any humanoid."
	item = /obj/item/antag_spawner/nuke_ops/borg_tele/medical
	refundable = TRUE
	cost = 35
	restricted = TRUE

/datum/uplink_item/support/reinforcement/medical_borg/syndicate
	name = "Syndicate Medical Cyborg"
	item = /obj/item/antag_spawner/synd_borg/medical
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/support/reinforcement/saboteur_borg
	name = "InteQ Saboteur Cyborg"
	desc = "A streamlined engineering cyborg, equipped with covert modules. Also incapable of leaving the welder in the shuttle. \
			Aside from regular Engineering equipment, it comes with a special destination tagger that lets it traverse disposals networks. \
			Its chameleon projector lets it disguise itself as a Nanotrasen cyborg, on top it has thermal vision and a pinpointer."
	item = /obj/item/antag_spawner/nuke_ops/borg_tele/saboteur
	refundable = TRUE
	cost = 35
	restricted = TRUE

/datum/uplink_item/support/reinforcement/saboteur_borg/syndicate
	name = "Syndicate Saboteur Cyborg"
	item = /obj/item/antag_spawner/synd_borg/saboteur
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/support/hermes
	name = "MIB-01 Hermes Exosuit"
	desc = "A lightweight exosuit, painted in a dark scheme. Its speed and equipment selection make it excellent \
			for hit-and-run style attacks. Features an incendiary carbine, flash bang launcher, teleporter, ion thrusters and a Tesla energy array. \
			Looks like a SolFed Mecha, repainted in brown. Sol supply InteQ clandestinely and almost for next to nothing."
	item = /obj/vehicle/sealed/mecha/combat/gygax/dark/loaded/hermes
	cost = 80

/datum/uplink_item/support/honker
	name = "Dark H.O.N.K."
	desc = "A clown combat mech equipped with bombanana peel and tearstache grenade launchers, as well as the ubiquitous HoNkER BlAsT 5000."
	item = /obj/vehicle/sealed/mecha/combat/honker/dark/loaded
	cost = 80
	purchasable_from = UPLINK_CLOWN_OPS

/datum/uplink_item/support/ares
	name = "MIB-02 Ares Exosuit"
	desc = "A massive and incredibly deadly military-grade exosuit. Features long-range targeting, thrust vectoring \
			and deployable smoke. Comes equipped with an LMG, Scattershot rifle, missile rack, an antiprojectile armor booster and a Tesla energy array. \
			Looks like a SolFed Mecha, repainted in brown. Sol supply InteQ clandestinely and almost for next to nothing."
	item = /obj/vehicle/sealed/mecha/combat/marauder/mauler/loaded/ares
	cost = 140
