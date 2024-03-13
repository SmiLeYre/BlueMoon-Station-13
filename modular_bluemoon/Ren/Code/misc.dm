/obj/item/storage/toolbox/inteq
	name = "Brown toolbox"
	icon_state = "toolbox_inteq"
	item_state = "toolbox_inteq"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	desc = "Элегантный ящик с инструментами. Ярко оранжевая полоса проходит вдоль стыка крышки, а в центре виднеется галографическая наклейка в виде жёлтого щита."
	force = 18
	throwforce = 20

/obj/item/screwdriver/nuke/inteq
	icon_state = "screwdriver_caravan"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/crowbar/brown
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	icon_state = "crowbar_brown"
	force = 8

/obj/item/wirecutters/brown
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	icon_state = "cutters"
	random_color = FALSE

///шуруповёрт
/obj/item/screwdriver/power/inteq
	name = "Brown hand Drill"
	desc = "Карманный электро инструмент. Теперь в элегантной обёртке. Установлена насадка крестовой отвётки."
	icon_state = "drill_inteq_screw"
	item_state = "drill"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	force = 20
	toolspeed = 0.30

/obj/item/wrench/power/inteq/attack_self(mob/user)
	playsound(get_turf(user),'sound/items/change_drill.ogg',50,1)
	var/obj/item/screwdriver/power/inteq/q_drill = new /obj/item/screwdriver/power/inteq(drop_location())
	to_chat(user, "<span class='notice'>You attach the screw driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(q_drill)
///гайковёрт
/obj/item/wrench/power/inteq
	name = "Brown hand drill"
	desc = "Карманный электро инструмент. Теперь в элегантной обёртке. Установлена насадка с шестигранником."
	icon_state = "drill_inteq_bolt"
	item_state = "drill"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'

/obj/item/screwdriver/power/inteq/attack_self(mob/user)
	playsound(get_turf(user),'sound/items/change_drill.ogg',50,1)
	var/obj/item/wrench/power/inteq/q_drill = new /obj/item/wrench/power/inteq(drop_location())
	to_chat(user, "<span class='notice'>You attach the bolt driver bit to [src].</span>")
	qdel(src)
	user.put_in_active_hand(q_drill)
///клещи
/obj/item/crowbar/power/inteq
	name = "Brown jaws of life"
	icon_state = "jaws_inteq_pry"
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	desc = "Карманный пневматический инструмент. Нет, мы не украли контейнер клешней с транспортника НТ и просто перекрасили его. Устанановлена насадка клешней."
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	force = 15
	toolspeed = 0.30

/obj/item/crowbar/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/wirecutters/power/inteq/cutjaws = new /obj/item/wirecutters/power/inteq(drop_location())
	cutjaws.name = name
	to_chat(user, "<span class='notice'>You attach the cutting jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(cutjaws)
///кусачки
/obj/item/wirecutters/power/inteq
	name = "jaws of life"
	desc = "Карманный пневматический инструмент. Нет, мы не украли контейнер клешней с транспортника НТ и просто перекрасили его. Устанановлена насадка кусачек."
	icon_state = "jaws_inteq_cutter"
	item_state = "jawsoflife"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	force = 15
	toolspeed = 0.30

/obj/item/wirecutters/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/crowbar/power/inteq/pryjaws = new /obj/item/crowbar/power/inteq(drop_location())
	pryjaws.name = name
	to_chat(user, "<span class='notice'>You attach the pry jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(pryjaws)

/obj/item/weldingtool/experimental/inteq
	name = "Brown Welder"
	icon_state = "exwelder"
	item_state = "brasswelder"
	desc = "Небольшой сварочный аппарат с самовостанавливающимся топливным блоком. Выглядит довольно нелегально."
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/wrench/combat/inteq
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	desc = "Перекраска твёрдого света повысила уровень военных преступлений на 20%"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/inducer/inteq
	icon_state = "inducer"
	item_state = "inducer"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	powertransfer = 2000
	cell_type = /obj/item/stock_parts/cell/super



/obj/item/storage/toolbox/syndicate/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.silent = TRUE

/obj/item/storage/toolbox/inteq/PopulateContents()
	new /obj/item/screwdriver/nuke/inteq(src)
	new /obj/item/wrench/combat/inteq(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/brown(src)
	new /obj/item/wirecutters/brown(src)
	new /obj/item/multitool(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)

/obj/item/storage/toolbox/inteq/cooler/PopulateContents()
	new /obj/item/screwdriver/power/inteq(src)
	new /obj/item/crowbar/power/inteq(src)
	new /obj/item/weldingtool/experimental/inteq(src)
	new /obj/item/multitool(src)
	new /obj/item/inducer/inteq(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)

/datum/uplink_item/device_tools/tools_inteq
	name = "Brown toolbox"
	desc = "Набор базовых инструментов."
	item = /obj/item/storage/toolbox/inteq
	cost = 1
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/device_tools/tools_inteq_coller
	name = "Deluxe Brown toolbox"
	desc = "Улучшеный набор инструментов. Для тех, кто знает себе цену"
	item = /obj/item/storage/toolbox/inteq/cooler
	cost = 3
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)
