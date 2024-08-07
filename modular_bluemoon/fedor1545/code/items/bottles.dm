/obj/item/reagent_containers/glass/beaker/elf_bottle
	name = "potion bottle"
	desc = "Фиолетовая бутылка, что выглядет очень старой. \
		Она выглядет так буд-то её используют для хранения зелий.  \
		На этикетке написано 'Зелье снятия одежды'."
	icon = 'modular_bluemoon/fedor1545/icons/items/elf_bottle.dmi'
	icon_state = "elf_bottle"
	volume = 150
	possible_transfer_amounts = list(1,2,3,5,10,25,50,100,150)
	container_flags = APTFT_ALTCLICK|APTFT_VERB
	list_reagents = list(/datum/reagent/consumable/ethanol/panty_dropper = 50)
	container_HP = 10
