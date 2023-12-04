//lavaland_surface_syndicate_base1.dmm

/obj/machinery/vending/syndichem
	name = "\improper SyndiChem"
	desc = "A vending machine full of grenades and grenade accessories. Sponsored by DonkCo(tm)."
	req_access = list(ACCESS_SYNDICATE)
	products = list(/obj/item/stack/cable_coil/random = 5,
					/obj/item/assembly/igniter = 20,
					/obj/item/assembly/prox_sensor = 5,
					/obj/item/assembly/signaler = 5,
					/obj/item/assembly/timer = 5,
					/obj/item/assembly/voice = 5,
					/obj/item/assembly/health = 5,
					/obj/item/assembly/infra = 5,
					/obj/item/grenade/chem_grenade = 5,
					/obj/item/grenade/chem_grenade/large = 5,
					/obj/item/grenade/chem_grenade/pyro = 5,
					/obj/item/grenade/chem_grenade/cryo = 5,
					/obj/item/grenade/chem_grenade/adv_release = 5,
					/obj/item/reagent_containers/food/drinks/bottle/holywater = 2)
	product_slogans = "Это не пиромания, если тебе платят!;Чувствуешь запах? Плазма, сынок. Ничто другое в мире так не пахнет.;Я люблю запах плазмы по утрам."
	resistance_flags = FIRE_PROOF
