/datum/crafting_recipe/garrote
	name = "Makeshift Garrote"
	result = /obj/item/garrote/improvised
	time = 15
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2,
				/obj/item/restraints/handcuffs/cable = 1,
				/obj/item/shard = 1)
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE


/datum/crafting_recipe/emmitergun
	name = "Handicraft Emitter Rifle"
	result = /obj/item/gun/energy/emittergun
	time = 30
	reqs = list(/obj/item/stack/sticky_tape = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stock_parts/cell = 2,
				/obj/item/stock_parts/capacitor = 1,
				/obj/item/pipe = 1,
				/obj/item/circuitboard/machine/emitter = 1,
				/obj/item/stack/sheet/plasteel = 10,
				)
	time = 40
	tools = list(TOOL_WELDER, TOOL_WIRECUTTER)
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
