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

/obj/item/crowbar/power/inteq/attack_self(mob/user)
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

/obj/item/wirecutters/power/inteq/attack_self(mob/user)
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
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'

/obj/item/inducer/inteq
	icon_state = "inducer"
	item_state = "inducer"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	powertransfer = 2000
	cell_type = /obj/item/stock_parts/cell/super

/obj/item/toy/inteqballoon
	name = "InteQ balloon"
	desc = "Сзади видна странная бирка \"НАХУЙ ПАКТ!!1111\"."
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	icon_state = "inteqballoon"
	item_state = "inteqballoon"
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	w_class = WEIGHT_CLASS_BULKY

/obj/item/autosurgeon/syndicate/inteq
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/storage/book/bible/syndicate/inteq
	name = "InteQ Tome"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'

///inteq наборы
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
	new /obj/item/multitool/tricorder(src)
	new /obj/item/inducer/inteq(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)

/obj/item/storage/backpack/duffelbag/syndie/inteq/surgery/PopulateContents()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/bonesetter(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/mask/muzzle(src)
	new /obj/item/mmi/syndie(src)
	new /obj/item/implantcase(src)
	new /obj/item/implanter(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
	new /obj/item/tank/internals/anesthetic(src)

/obj/item/storage/backpack/duffelbag/syndie/inteq/surgery_adv/PopulateContents()
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/surgicaldrill/advanced(src)
	new /obj/item/bonesetter(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/mask/muzzle(src)
	new /obj/item/mmi/syndie(src)
	new /obj/item/implantcase(src)
	new /obj/item/implanter(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
	new /obj/item/tank/internals/anesthetic(src)

///FTU наборы
/obj/item/storage/backpack/satchel/inteq/ftu/shootgun
	name = "Набор №473. Спецификация: Инженер. Основное оружие: AA12"

/obj/item/storage/backpack/satchel/inteq/ftu/shootgun/PopulateContents()
	new /obj/item/storage/box/survival/security/radio(src)
	new /obj/item/gun/ballistic/automatic/shotgun/aa12(src)
	for(var/i in 1 to 3)
		new /obj/item/ammo_box/magazine/aa12/small(src)
	new /obj/item/storage/belt/utility/syndicate(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)

/obj/item/storage/backpack/satchel/inteq/ftu/fire
	name = "Набор №343. Спецификация: Чистильщик. Основное оружие: M2a100"

/obj/item/storage/backpack/satchel/inteq/ftu/fire/PopulateContents()
	new /obj/item/storage/box/survival/security/radio(src)
	new /obj/item/gun/energy/m2a100(src)
	for(var/i in 1 to 10)
		new /obj/item/stack/sheet/mineral/plasma(src)
	new /obj/item/extinguisher (src)
	new /obj/item/grenade/stingbang/shred(src)
	new /obj/item/grenade/stingbang/shred(src)

/obj/item/storage/backpack/satchel/inteq/ftu/sniper
	name = "Набор №476. Спецификация: Снайпер. Основное оружие: M1 Garand"

/obj/item/storage/backpack/satchel/inteq/ftu/sniper/PopulateContents()
	new /obj/item/storage/box/survival/security/radio(src)
	new /obj/item/gun/ballistic/automatic/m1garand/scope(src)
	for(var/i in 1 to 5)
		new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/chameleon(src)

/obj/item/storage/backpack/satchel/inteq/ftu/med
	name = "Набор №678. Спецификация: Медик. Основное оружие: SMG .22"

/obj/item/storage/backpack/satchel/inteq/ftu/med/PopulateContents()
	new /obj/item/storage/box/survival/security/radio(src)
	new /obj/item/gun/ballistic/automatic/smg22(src)
	for(var/i in 1 to 5)
		new/obj/item/ammo_box/magazine/smg22(src)
	new /obj/item/storage/belt/medical/surgery_belt_adv(src)
	new /obj/item/storage/firstaid/tactical(src)

/obj/item/choice_beacon/ftu
name = "FTU sec kit"
desc = "Маяк для выбора снаряжения охраниками торговых кораблей"

/obj/item/choice_beacon/ftu/generate_display_names()
	var/static/list/ftu_item_list
	if(!ftu_item_list)
		ftu_item_list = list()
		var/list/templist = typesof(/obj/item/storage/backpack/satchel/inteq/ftu)
		for(var/V in templist)
			var/atom/A = V
			ftu_item_list[initial(A.name)] = A
	return ftu_item_list

/obj/item/choice_beacon/ftu/generate_display_names()
	var/static/list/ftu_item_list
	if(!ftu_item_list)
		ftu_item_list = list()
		var/list/templist = list(
		/obj/item/storage/backpack/satchel/inteq/ftu/shootgun,
		/obj/item/storage/backpack/satchel/inteq/ftu/fire,
		/obj/item/storage/backpack/satchel/inteq/ftu/sniper,
		/obj/item/storage/backpack/satchel/inteq/ftu/med)
		for(var/V in templist)
			var/atom/A = V
			ftu_item_list[initial(A.name)] = A
	return ftu_item_list
