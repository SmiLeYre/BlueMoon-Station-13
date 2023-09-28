GLOBAL_LIST_INIT(salvage_list, list(
	/obj/structure/salvage/protolathe = 1,
	/obj/structure/salvage/circuit_imprinter = 1,
	/obj/structure/salvage/destructive_analyzer = 1,
	/obj/structure/salvage/autolathe = 1,
	/obj/structure/salvage/remains = 1,
	/obj/structure/salvage/server = 1,
	/obj/structure/salvage/wooden_frame = 1,
	/obj/structure/salvage/metal_frame = 1,
	/obj/structure/salvage/pda = 1,
	/obj/structure/salvage/computer = 1
	))

/obj/structure/salvage
	name = "item_for_salvege"
	desc = "Если ты это видишь - пиши @Krashly"
	icon = 'modular_bluemoon/krashly/icons/obj/structures.dmi'
	icon_state = "protolathe"
	climbable = TRUE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | LAVA_PROOF | ACID_PROOF | UNACIDABLE
	max_integrity = 300
	integrity_failure = 0.1
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000, /datum/material/uranium = 10000, /datum/material/gold = 10000)

/obj/structure/salvage/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Кажется это давно заброшенная техника. Она скреплена <b>болтами</b>.</span>"
	. += "<span class='notice'>Используйте гаечный ключ, чтобы забрать оставшиеся ресурсы.</span>"

/obj/structure/salvage/deconstruct(disassembled)
	if(!(flags_1 & NODECONSTRUCT_1))
		for(var/i in custom_materials)
			var/datum/material/M = i
			new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

/obj/effect/spawner/lootdrop/salvage
	name = "salvage spawner"

/obj/effect/spawner/lootdrop/salvage/Initialize(mapload)
	loot = GLOB.salvage_list
	. = ..()

/////////////////////////////////////////////////////SALVAGE_TYPES////////////////////////////////////////////////////////////////

/obj/structure/salvage/protolathe
	name = "broken protolathe"
	icon_state = "wreck_protolathe"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000)

/obj/structure/salvage/circuit_imprinter
	name = "broken circuit imprinter"
	icon_state = "wreck_circuit_imprinter"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000)

/obj/structure/salvage/destructive_analyzer
	name = "broken destructive analyzer"
	icon_state = "wreck_d_analyzer"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000)

/obj/structure/salvage/autolathe
	name = "broken autolathe"
	icon_state = "wreck_autolathe"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000)

/obj/structure/salvage/remains
	name = "broken machine"
	icon_state = "wreck_remains"
	custom_materials = list(/datum/material/uranium = 20000, /datum/material/gold = 20000)

/obj/structure/salvage/server
	name = "broken server"
	icon_state = "wreck_server"
	custom_materials = list(/datum/material/uranium = 20000, /datum/material/gold = 20000, /datum/material/bluespace = 1000)

	/obj/structure/salvage/wooden_frame
	name = "broken wooden frame"
	icon_state = "makeshift_frame3_Wooden"
	custom_materials = list(/datum/material/wood = 20000, /datum/material/iron = 5000)

/obj/structure/salvage/metal_frame
	name = "broken metal frame"
	icon_state = "makeshift_frame3_Metal"
	custom_materials = list(/datum/material/wood = 5000, /datum/material/iron = 20000, /datum/material/plasma = 5000)

/obj/structure/salvage/pda
	name = "broken pda imprinter"
	icon_state = "wreck_pda"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000, /datum/material/plasma = 5000, /datum/material/diamond = 2000)

/obj/structure/salvage/computer
	name = "broken computer"
	icon_state = "computer_broken"
	custom_materials = list(/datum/material/iron = 20000, /datum/material/glass = 20000, /datum/material/gold = 20000)
