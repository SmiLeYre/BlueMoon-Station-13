/obj/item/storage/toolbox/inteq
name = "Special toolbox"
	icon_state = "toolbox_inteq"
	item_state = "toolbox_inteq"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	desc = "Элегантный ящик с инструментами. Ярко оранжевая полоса проходит вдоль стыка крышки, а в центре виднеется галографическая наклейка в виде жёлтого щита."
	force = 18
	throwforce = 20

/obj/item/screwdriver/nuke/inteq
	icon_state = "toolbox_inteq"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/crowbar/brown
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	icon_state = "crowbar_brown"
	force = 8


/obj/item/screwdriver/power/inteq
	name = "Brown Hand Drill"
	desc = "Карманный электро' инструмент. Теперь в элегантной обёртке"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	force = 20
	toolspeed = 0.30

/obj/item/crowbar/power/Inteq
	name = "Brown jaws of life"
	icon_state = "jaws_inteq_pry"
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	desc = "Карманный пневматический инструмент. Теперь в элегантной обёртке"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	force = 20
	toolspeed = 0.30

/obj/item/weldingtool/experimental/inteq
	name = "Brown jaws of life"
	icon_state = "exwelder"
	item_state = "brasswelder"
	desc = "Карманный пневматический инструмент. Теперь в элегантной обёртке"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/wrench/combat/inteq
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	desc = "Карманный пневматический инструмент. Теперь в элегантной обёртке"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'


/obj/item/storage/toolbox/syndicate/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.silent = TRUE

/obj/item/storage/toolbox/inteq/PopulateContents()
	new /obj/item/screwdriver/nuke/inteq(src)
	new /obj/item/wrench/combat/inteq(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/brown(src)
	new /obj/item/wirecutters(src, "brown")
	new /obj/item/multitool(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)

/obj/item/storage/toolbox/inteq/cooler/PopulateContents()
	new /obj/item/screwdriver/power/inteQ(src)
	new /obj/item/crowbar/power/InteQ(src)
	new /obj/item/weldingtool/experimental/inteq(src)
	new /obj/item/multitool(src)
	new /obj/item/inducer(src)
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
