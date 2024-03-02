/obj/item/storage/toolbox/infiltrator/inteq
	name = "SpecOps case"
	desc = "Элегантный кейс с отделкой из кожи и эмблемой золотого щита. Содержит внутри костюм, разработанный для понижения заметности пользователя в условиях тесных пространств замкнутых помещений. Сам кейс же отлично подходит для переноса всего того арсенала оружия, что ты взял с собой на 'тихую' миссию."
	icon_state = "infiltrator_case"
	item_state = "infiltrator_case"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'

/obj/item/storage/toolbox/infiltrator/inteq/PopulateContents()
	new /obj/item/clothing/head/helmet/infiltrator/inteq(src)
	new /obj/item/clothing/suit/armor/vest/infiltrator/inteq(src)
	new /obj/item/clothing/under/inteq/tactical_gorka(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated/infiltrator/inteq(src)
	new /obj/item/clothing/mask/infiltrator/inteq(src)
	new /obj/item/clothing/shoes/combat/sneakboots/inteq(src)

/obj/item/clothing/head/helmet/infiltrator/inteq
	name = "SpecOps Helmet"
	desc = "Лёгкий шлем с панорамным визором. Покрыт защитной плёнкой, спасающей владельца от ярких вспышек, а армированный визор сможет выдержать не одну пулю во время твоей 'скрытной' миссии."
	icon_state = "infiltrator_h"
	item_state = "infiltrator_h"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

/obj/item/clothing/gloves/tackler/combat/insulated/infiltrator/inteq
	name = "SpecOps Guerrilla Gloves"
	desc = "Боевые перчатки предназначенные для усиления навыков владельца. Встроенные наночипы напрямую посылают сигналы в нервные окончания рук, доводя движения владельца до идеала, что позволяет укладывать жертв на землю и перетаскивать их с максимальной эффективностью."
	icon_state = "infiltrator_g"
	item_state = "infiltrator_g"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

/obj/item/clothing/mask/infiltrator/inteq
	name = "SpecOps Balaclava"
	desc = "Необычная балоклава со встроеным блоком изменения голоса. Выглядит немного кустарно, но идеально справляется со своими задачами"
	icon_state = "infiltrator_m"
	item_state = "infiltrator_m"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

/obj/item/clothing/suit/armor/vest/infiltrator/inteq
	name = "SpecOps combat vest"
	desc = "Качественный бронежилет с бронепластиной из многослойной пластали. Совмещает в себе лёгкость и прочность, имеет буферный подкладки и идеально прилегает к телу, не издавая лишних звуков при ношении."
	icon_state = "infiltrator_a"
	item_state = "infiltrator_a"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'

/obj/item/clothing/under/inteq/tactical_gorka
	name = "SpecOps gorka"
	desc = "Костюм данной модели, выполнен на основе классической модели Горка. Изготавливается из особо прочной ткани Рип Стоп с водоотталкивающей пропиткой и высоким содержанием хлопка и полиэфирных нитей. Идеально подогнан под пропорции клиента и прекрасно подходит для грязной работы."
	icon_state = "infiltrator_u"
	item_state = "infiltrator_u"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 0, BIO = 0, RAD = 10, FIRE = 100, ACID = 100, WOUND = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	can_adjust = FALSE
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

/obj/item/clothing/shoes/combat/sneakboots/inteq
	name = "SpecOps sneakboots"
	desc = "Пара ботинок с высоким берцем. Подошва покрыта звукопоглощающим слоем, почти полностью сводя шум шагов на нет. Выполнены в карго стиле, воплощая в себе саму идею практичности."
	icon_state = "sneakboots"
	item_state = "sneakboots"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

///Космодесантские приколы

///Самоподрыв костюма для не трейторов. Никакого манча СБ
/obj/item/clothing/suit/space/syndicate/darktemplar/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if(!IS_INTEQ(user))
			to_chat(user, "<span class='danger'><B>Запуск проверки генетического кода</B><br> Обнаружены неавторизованные сигнатуры. <B>ПРОИЗВОДИТСЯ ОЧИСТКА</B></span>")
			playsound(get_turf(src), 'sound/machines/nuke/confirm_beep.ogg', 65, 1, 1)
			addtimer(CALLBACK(src, .proc/explode), 3 SECONDS)

/obj/item/clothing/suit/space/syndicate/darktemplar/proc/explode()
	do_sparks(3, 1, src)
	explosion(src.loc,0,1,1,1)
	qdel(src)

/obj/item/clothing/head/helmet/space/syndicate/darktemplar
	name = "Dark Power Armour helmet"
	desc = "Грамоздкий шлем, созданый что бы вселять страх в сердца предателей и ксеносов."
	icon_state = "darktemplar_helm"
	item_state = "darktemplar_helm"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	equip_delay_self = 50
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	alternate_screams = SPASEMAR_SCREAMS
	armor = list(MELEE = 50, BULLET = 50, LASER = 40, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
	equip_sound = 'modular_bluemoon/Ren/Sound/equp1.ogg'
	mutantrace_variation = NONE
	unique_reskin = list("Dark Power Armour helmet holy patern" = list(RESKIN_ICON_STATE = "darktemplar_chaplai_helm"), "Dark Power Armour helmet InteQ patern MKI" = list(RESKIN_ICON_STATE = "darktemplar_helm_inteq"), "Dark Power Armour helmet InteQ patern MKII" = list(RESKIN_ICON_STATE = "darktemplar_helm_inteq_alt"))

/obj/item/clothing/suit/space/syndicate/darktemplar
	name = "Dark Power Armour"
	desc = "Силовая броня древнего паттерна которому уже несколько сотен лет. Хоть и успела морально устареть по сравнению с современной бронёй, но до сих пор отлично защищает носителя от разной ксеноугрозы. "
	icon_state = "darktemplar"
	item_state = "darktemplar"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	equip_delay_self = 50
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	alternate_screams = SPASEMAR_SCREAMS
	armor = list(MELEE = 50, BULLET = 50, LASER = 40, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
	equip_sound = 'modular_bluemoon/Ren/Sound/equp.ogg'
	mutantrace_variation = NONE
	unique_reskin = list("Dark Power Armour holy patern" = list(RESKIN_ICON_STATE = "darktemplar_chaplai"), "Dark Power Armour InteQ patern MKI" = list(RESKIN_ICON_STATE = "darktemplar_inteq"), "Dark Power Armour InteQ patern MKII" = list(RESKIN_ICON_STATE = "darktemplar_inteq_alt") )

/obj/item/clothing/head/helmet/space/syndicate/darktemplar/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.add_hud_to(user)

/obj/item/clothing/head/helmet/space/syndicate/darktemplar/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		var/datum/atom_hud/DHUD = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		DHUD.remove_hud_from(user)

///Кричалка с крутыми фразами. Они прописаны в коде хайлера.
/obj/item/clothing/mask/gas/sechailer/angrymarin
	name = "Space Marine Gas Mask"
	desc = "Древняя система подачи кислорода объединёная с вокс системой, усиливающей голос пользователя"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	actions_types = list(/datum/action/item_action/halt)
	aggressiveness = 999 ///Очень злой
	recent_uses = -10

///Ботинки
/obj/item/clothing/shoes/jackboots/powerbots
	name = "Power boots"
	desc = "Тяжёлые латные ботинки созданые, что бы ходить по трупам поверженых врагов."
	clothing_flags = NOSLIP
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	armor = list(MELEE = 15, BULLET = 15, LASER = 15, ENERGY = 15, BOMB = 0, BIO = 0, RAD = 0, FIRE = 40, ACID = 75)

/obj/item/clothing/shoes/jackboots/powerbots/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_bluemoon/Ren/Sound/step/ast_step1.ogg'=1,'modular_bluemoon/Ren/Sound/step/ast_step2.ogg'=1), 60)

/obj/item/clothing/shoes/jackboots/powerbots/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		ADD_TRAIT(user, TRAIT_SILENT_STEP, SHOES_TRAIT)

/obj/item/clothing/shoes/jackboots/powerbots/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_SILENT_STEP, SHOES_TRAIT)

///Осмодула
/obj/item/organ/heart/gland/heal/ossmodula
	name = "Ossmodula"
	desc = "Its fells strong"
	uses = -1
	var/list/possible_reagents = list()

/obj/item/organ/heart/gland/heal/ossmodula/activate()
	owner.reagents.add_reagent(/datum/reagent/medicine/lesser_syndicate_nanites, 1)
	owner.adjustToxLoss(-5, TRUE, TRUE)
	..()

/obj/item/organ/heart/gland/heal/ossmodula/Insert(mob/living/carbon/M, drop_if_replaced = TRUE)
	..()
	ADD_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
	var/size = get_size(owner)
	owner.update_size(size * 1.35)
	owner.visible_message("<span class='danger'>[owner] Внезапно становится больше!</span>", "<span class='notice'>Всё вокруг неожиданно уменьшается..</span>")

/obj/item/autosurgeon/astartes
	desc = "Последний шаг, разделяющий жизнь человека от жизни ангела смерти"
	uses = 1
	starting_organ = /obj/item/organ/heart/gland/heal/ossmodula

///Набор космодесантника
/obj/item/storage/box/syndie_kit/spacehero
	name = "Death Angel armor kit"
	icon_state = "inteqbox"

/obj/item/storage/box/syndie_kit/spacehero/PopulateContents()
	new /obj/item/autosurgeon/astartes(src)
	new /obj/item/clothing/shoes/jackboots/powerbots(src)
	new /obj/item/clothing/mask/gas/sechailer/angrymarin(src)
	new /obj/item/clothing/suit/space/syndicate/darktemplar(src)
	new /obj/item/clothing/head/helmet/space/syndicate/darktemplar(src)
	new /obj/item/clothing/under/syndicate/combat(src)
	new /obj/item/clothing/gloves/tackler/combat(src)
//безумие

/obj/item/clothing/suit/hank
	name = "Old black coat"
	desc = "Поношеный временем костюм. Его чернота отдаёт красным оттенком, а сам он удивительно хорошо прилегает к телу."
	icon_state = "hank"
	item_state = "hank"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	var/reaction = 0

/obj/item/clothing/suit/hank/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/phantomthief)

/obj/item/clothing/suit/hank/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && (rand(5) != 1) && reaction == 1)
		owner.visible_message(src, pick("<span class='his_grace'>[owner] чудом уворачивается от пули, выгнувшись спиной в последний момент!</span>", "<span class='phobia'>[owner] ловко уходит в сторону, предугадав траекторию выстрела!</span>", "<span class='suicide'>[owner] делает резкий рывок, едва успевая уйти из под огня!</span>" ))
		playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, 1)
		return BLOCK_SUCCESS | BLOCK_PHYSICAL_EXTERNAL
	return ..()

/obj/item/clothing/suit/hank/proc/concentration(mob/living/user, was_forced = FALSE)
	if(!SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_ACTIVE))
		reaction = 0
	else
		reaction = 1

///InteQ Uplink additions

/datum/uplink_item/suits/inteq_infiltrator_bundle
	name = "SpecOps Infiltration Gear Case"
	desc = "Тактический костюм разработки Мародёров Горлекса, слегка изменённый внутренними предприятиями inteQ для собственных нужд. Лёгкий, прочный и тихий костюм совершенно не сковывает движений владельца. Покрывает всё тело носителя и использует внутренний блок шифровки голоса, гарантируя, что никто не узнает вашу личность. Набор содержит в себе костюм, бронежилет, ботинки, перчатки, шлем и балаклаву. Не предназначен для использования в условиях пониженного давления."
	item = /obj/item/storage/toolbox/infiltrator/inteq
	cost = 5
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/suits/angel
	name = "Angel of death"
	desc = "Набор очень древней брони, использовавшейся в первых космических войнах Солнечной федерацией. Для полного раскрытия потенциала этого полутонного куска керамита необходимо вживить специальный орган, значительно увеличивающий выживаемость и силу владельца. Пришло время доказать, что ты достоин зваться 'Ангелом смерти'."
	item = /obj/item/storage/box/syndie_kit/spacehero
	cost = 20
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

