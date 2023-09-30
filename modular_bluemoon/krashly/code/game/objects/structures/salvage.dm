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
	name = "item_for_salvage (check desc)"
	desc = "Если ты это видишь - пиши @Krashly"
	icon = 'modular_bluemoon/krashly/icons/obj/structures.dmi'
	icon_state = "protolathe"
	density = TRUE
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

/obj/structure/salvage/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(W.tool_behaviour == TOOL_WRENCH)
		to_chat(user, "<span class='notice'>Вы начинаете разбирать обломки...</span>")
		if(W.use_tool(src, user, 40, volume=50))
			to_chat(user, "<span class='notice'>Вы успешно разобрали обломки.</span>")
			deconstruct(TRUE)
	else
		return ..()

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
	desc = "Сломанный протолат. Определенно больше не работает."
	icon_state = "wreck_protolathe"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000)

/obj/structure/salvage/circuit_imprinter
	name = "broken circuit imprinter"
	desc = "Сломанный аппарат для печати плат. Даже если бы вы имели рабочий аппарат для печати плат - вы бы не смогли починить этот."
	icon_state = "wreck_circuit_imprinter"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000)

/obj/structure/salvage/destructive_analyzer
	name = "broken destructive analyzer"
	desc = "Прогнивший анализатор. Больше он не послужит на благо науке."
	icon_state = "wreck_d_analyzer"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000)

/obj/structure/salvage/autolathe
	name = "broken autolathe"
	desc = "Ржавый автолат. Можно забыть про элементарные детали."
	icon_state = "wreck_autolathe"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000)

/obj/structure/salvage/remains
	name = "broken machine"
	desc = "Останки техники былого. Кажется что-то поблёскивает внутри..."
	icon_state = "wreck_remains"
	custom_materials = list(/datum/material/uranium = 40000, /datum/material/gold = 40000)

/obj/structure/salvage/server
	name = "broken server"
	desc = "Сломанный сервер. Кажется что-то поблёскивает внутри..."
	icon_state = "wreck_server"
	custom_materials = list(/datum/material/uranium = 40000, /datum/material/gold = 40000, /datum/material/bluespace = 2000)

/obj/structure/salvage/wooden_frame
	name = "broken wooden frame"
	desc = "Деревянная конструкция. Вы не видите возможность её использовать, кроме как разобрать."
	icon_state = "makeshift_frame3_Wooden"
	custom_materials = list(/datum/material/wood = 40000, /datum/material/iron = 10000)

/obj/structure/salvage/metal_frame
	name = "broken metal frame"
	desc = "Металлическая конструкция. Она кажется крепкой, но стоит вам ткнуть в неё пальцем - она мягко ломается."
	icon_state = "makeshift_frame3_Metal"
	custom_materials = list(/datum/material/wood = 10000, /datum/material/iron = 40000, /datum/material/plasma = 10000)

/obj/structure/salvage/pda
	name = "broken pda imprinter"
	desc = "Бывший покрасчик ПДА. Сейчас только куча материалов."
	icon_state = "wreck_pda"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000, /datum/material/plasma = 10000, /datum/material/diamond = 10000)

/obj/structure/salvage/computer
	name = "broken computer"
	desc = "Интересно, на таком выйдет запустить 'Рок 1993'?"
	icon_state = "computer_broken"
	custom_materials = list(/datum/material/iron = 40000, /datum/material/glass = 40000, /datum/material/gold = 40000)
