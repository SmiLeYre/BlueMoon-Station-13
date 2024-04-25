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

/obj/item/clothing/head/helmet/infiltrator/inteq/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		user.digitalcamo = TRUE
		user.digitalinvis = TRUE

/obj/item/clothing/head/helmet/infiltrator/inteq/dropped(mob/living/carbon/human/user)
	..()
	if (user.head == src)
		user.digitalcamo = FALSE
		user.digitalinvis = FALSE

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

/obj/item/clothing/suit/armor/vest/infiltrator/inteq/ComponentInitialize()
	. = ..()
	var/datum/component/storage/concrete/storage = AddComponent(/datum/component/storage/concrete)
	storage.max_items = 5

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
			addtimer(CALLBACK(src, PROC_REF(explode)), 3 SECONDS)

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
	resistance_flags = FIRE_PROOF | ACID_PROOF
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	alternate_screams = SPASEMAR_SCREAMS
	armor = list(MELEE = 50, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
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
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	equip_delay_self = 50
	resistance_flags = FIRE_PROOF | ACID_PROOF
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	alternate_screams = SPASEMAR_SCREAMS
	armor = list(MELEE = 50, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 50, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
	equip_sound = 'modular_bluemoon/Ren/Sound/equp.ogg'
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC
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
	resistance_flags = FIRE_PROOF | ACID_PROOF
	actions_types = list(/datum/action/item_action/halt)
	aggressiveness = 999 ///Очень злой
	recent_uses = -10

///Ботинки
/obj/item/clothing/shoes/jackboots/powerbots
	name = "Power boots"
	desc = "Тяжёлые латные ботинки созданые, что бы ходить по трупам поверженых врагов."
	clothing_flags = NOSLIP
	resistance_flags = FIRE_PROOF | ACID_PROOF
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
/obj/item/organ/heart/gland/ossmodula
	name = "Ossmodula"
	desc = "Its fells strong"
	item_flags = DROPDEL
	cooldown_low = 200
	cooldown_high = 200
	uses = -1

/obj/item/organ/heart/gland/ossmodula/activate()
	owner.reagents.add_reagent(/datum/reagent/medicine/lesser_syndicate_nanites, 2)
	owner.adjustToxLoss(-5, TRUE, TRUE)
	..()

/obj/item/organ/heart/gland/ossmodula/Insert(mob/living/carbon/M, drop_if_replaced = TRUE)
	..()
	ADD_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
	ADD_TRAIT(owner, TRAIT_NOSOFTCRIT, GENETIC_MUTATION)
	ADD_TRAIT(owner, TRAIT_NOHARDCRIT, GENETIC_MUTATION)
	ADD_TRAIT(owner, TRAIT_STUNIMMUNE, GENETIC_MUTATION)
	ADD_TRAIT(owner, TRAIT_PUSHIMMUNE, GENETIC_MUTATION)
	var/size = get_size(owner)
	owner.update_size(size * 1.35)
	owner.visible_message("<span class='danger'>[owner] Внезапно становится больше!</span>", "<span class='notice'>Всё вокруг неожиданно уменьшается..</span>")

/obj/item/organ/heart/gland/ossmodula/Remove(special = FALSE)
	if(!QDELETED(owner))
		REMOVE_TRAIT(owner, TRAIT_NOSOFTCRIT, GENETIC_MUTATION)
		REMOVE_TRAIT(owner, TRAIT_NOHARDCRIT, GENETIC_MUTATION)
		REMOVE_TRAIT(owner, TRAIT_STUNIMMUNE, GENETIC_MUTATION)
		REMOVE_TRAIT(owner, TRAIT_PUSHIMMUNE, GENETIC_MUTATION)
	return ..()

/obj/item/autosurgeon/syndicate/inteq/astartes
	desc = "Последний шаг, разделяющий жизнь человека от жизни ангела смерти"
	uses = 1
	starting_organ = /obj/item/organ/heart/gland/ossmodula

///Набор космодесантника
/obj/item/storage/box/syndie_kit/spacehero
	name = "Death Angel armor kit"
	icon_state = "inteqbox"

/obj/item/nullrod/claymore/chainsaw_sword/real
	force = 35

/obj/item/storage/box/syndie_kit/spacehero/PopulateContents()
	new /obj/item/autosurgeon/syndicate/inteq/astartes(src)
	new /obj/item/clothing/shoes/jackboots/powerbots(src)
	new /obj/item/clothing/mask/gas/sechailer/angrymarin(src)
	new /obj/item/clothing/suit/space/syndicate/darktemplar(src)
	new /obj/item/clothing/head/helmet/space/syndicate/darktemplar(src)
	new /obj/item/clothing/under/syndicate/combat(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)
	new	/obj/item/nullrod/claymore/chainsaw_sword/real(src)

//Великий грейтайдер
/obj/item/storage/box/syndie_kit/grayhero
	name = "Grey tide"
	icon_state = "inteqbox"

/obj/item/storage/box/syndie_kit/grayhero/PopulateContents()
	new /obj/item/clothing/under/color/grey/glorf(src)
	new	/obj/item/clothing/shoes/chameleon/noslip(src)
	new	/obj/item/clothing/gloves/color/yellow(src)
	new	/obj/item/storage/belt/utility/full(src)
	new	/obj/item/clothing/mask/gas(src)
	new	/obj/item/clothing/glasses/phantomthief/syndicate(src)
	new	/obj/item/spear/grey_tide(src)

//безумие
/obj/item/clothing/head/helmet/hank
	name = "Black old bandana"
	desc = "Чёрные повязки на голову, призваные скрывать бинты. В этих красных очках виднелось отражение не одной сотни смертей."
	icon_state = "hank_m"
	item_state = "hank_m"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 10, BOMB = 0, BIO = 50, RAD = 0, FIRE = 50, ACID = 50, WOUND = 35)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = FIRE_PROOF | ACID_PROOF
	flash_protect = 2
	mutantrace_variation = NONE

/obj/item/clothing/head/helmet/hank/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/hank
	name = "Old black coat"
	desc = "Поношеный временем костюм. Его чернота отдаёт красным оттенком, а сам он удивительно хорошо прилегает к телу."
	icon_state = "hank"
	item_state = "hank"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 10, BOMB = 0, BIO = 50, RAD = 0, FIRE = 50, ACID = 50, WOUND = 35)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	mutantrace_variation = NONE

/obj/item/clothing/suit/hank/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/hank/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()
	if((!IS_INTEQ(owner)) && (owner.client))
		return BULLET_ACT_HIT
	if(owner.incapacitated(FALSE, TRUE))
		return BULLET_ACT_HIT
	if(!CHECK_ALL_MOBILITY(owner, MOBILITY_USE|MOBILITY_STAND))
		return BULLET_ACT_HIT
	if(!isturf(owner.loc))
		return BULLET_ACT_HIT
	if((attack_type & ATTACK_TYPE_PROJECTILE) && (rand(5) != 1))
		owner.visible_message(src, pick("<span class='danger'>[owner] чудом уворачивается от пули, выгнувшись спиной в последний момент!</span>", "<span class='danger'>[owner] ловко уходит в сторону, предугадав траекторию выстрела!</span>", "<span class='danger'>[owner] делает резкий рывок, едва успевая уйти из под огня!</span>"))
		playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, 1)
		return BLOCK_SUCCESS | BLOCK_PHYSICAL_EXTERNAL
	return ..()

/obj/item/storage/box/inteq_kit/hank/PopulateContents()
	new /obj/item/clothing/suit/hank (src)
	new /obj/item/clothing/head/helmet/hank (src)

///Ошейники для заложников.
/obj/item/electropack/shockcollar/bomb
	name = "Bomb collar"
	desc = "Металлический ошейник с покрытием из кожи. В центре красуется странное устройство с мигающей лампочкой. Он.. точно должен пикать?"
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon_state = "bombcollar"
	item_state = "bombcollar"
	equip_delay_other = 40
	strip_delay = 360

/obj/item/electropack/shockcollar/bomb/receive_signal(datum/signal/signal)
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc))
		playsound(get_turf(src), 'sound/machines/nuke/confirm_beep.ogg', 65, 1, 1)
		addtimer(CALLBACK(src, PROC_REF(explode)), 3 SECONDS)

	if(master)
		master.receive_signal()

/obj/item/electropack/shockcollar/bomb/proc/explode()
	do_sparks(3, 1, src)
	explosion(src.loc,1,0,2,0)
	qdel(src)

///InteQ Uplink additions
/datum/uplink_item/suits/inteq_infiltrator_bundle
	name = "SpecOps Infiltration Gear Case"
	desc = "Тактический костюм разработки Мародёров Горлекса, слегка изменённый внутренними предприятиями inteQ для собственных нужд. Лёгкий, прочный и тихий костюм совершенно не сковывает движений владельца. Покрывает всё тело носителя и использует внутренний блок шифровки голоса, гарантируя, что никто не узнает вашу личность. Набор содержит в себе костюм, бронежилет, ботинки, перчатки, шлем и балаклаву. Не предназначен для использования в условиях пониженного давления."
	item = /obj/item/storage/toolbox/infiltrator/inteq
	cost = 5
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/bundles_tc/angel
	name = "Angel of death"
	desc = "Набор очень древней брони, использовавшейся в первых космических войнах Солнечной федерацией. Для полного раскрытия потенциала этого полутонного куска керамита необходимо вживить специальный орган, значительно увеличивающий выживаемость и силу владельца. Пришло время доказать, что ты достоин зваться 'Ангелом смерти'."
	item = /obj/item/storage/box/syndie_kit/spacehero
	cost = 20
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/bundles_tc/grey
	name = "The Greatest of the Greys"
	desc = "Вещи величайшего грейтайдера. Его копьё впитало в себя столько крови, страха и превозмогания, что стало великим артефактом равным которому нет в бою. С этим даже один человек сможет стать целым тайфуном."
	item = /obj/item/storage/box/syndie_kit/grayhero
	cost = 20
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/explosives/bombcollar
	name = "Bomb collar"
	desc = "Ошейник с бомбой. Больше нечего добавить. Сигналлер в комплект не входит."
	item = /obj/item/electropack/shockcollar/bomb
	cost = 1
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/suits/hank
	name = "AAHW trophey"
	desc = "Старое и потрёпаное пальто, бандана и красные очки. От всего этого невероятно розит кровию, но если с выкнуться с этим, костюм подарит рефлексы своего прошлого владельца.\
			Увернуться от пули ещё никогда не было так стильно."
	item = /obj/item/storage/box/inteq_kit/hank
	cost = 15
	purchasable_from = ~(UPLINK_CLOWN_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/suits/quet
	name = "Quet kid kit"
	desc = "Тебя выгоняют из дома на самоубийственную миссию, а менять толстовку с кепкой на каску с бронежилетом не хочется? Наборы из гибких пластин помогут с этим и будут отлично сидеть под любой одеждой."
	item = /obj/item/storage/box/inteq_kit/quetkid
	cost = 3
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS | UPLINK_SYNDICATE)

///Чехол гитары
/obj/item/storage/backpack/guitarbag
	name = "Guitar bag"
	desc = "Обычный чехол от гитары. В него поместится много всего."
	icon_state = "guitarbag"
	item_state = "guitarbag"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'

/obj/item/storage/backpack/guitarbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_combined_w_class = INFINITY
	STR.max_items = 7
	STR.can_hold = typecacheof(list(/obj/item/storage/box, /obj/item/gun, /obj/item/ammo_box,
	/obj/item/reagent_containers/food, /obj/item/melee, /obj/item/grenade, /obj/item/reagent_containers/peacehypo, /obj/item/storage/firstaid, /obj/item/card/id, /obj/item/instrument))

/obj/item/clothing/neck/cloak/miner
	name = "Miner Cape"
	desc = "Мой бур пронзит небеса!"
	icon_state = "kaminacape"
	item_state = "kaminacape"
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'

/obj/item/clothing/neck/cloak/ftu
	name = "FTU Cape"
	desc = "Плащ флота объединённых свободных торговцев. Теперь и ты стал частью чего-то великого."
	icon_state = "ftu_cape"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'

/obj/item/clothing/suit/armor/vest/ftu
	name = "FTU Security Armor"
	desc = "Стандартный бронежилет охраны свободных торговцев. Обеспечивает оптимальную защиту жизнено важных органов в тесных коридорах кораблей и трюмов."
	icon_state = "epic_bp_armor"
	item_state = "epic_bp_armor"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	armor = list(MELEE = 30, BULLET = 60, LASER = 25, ENERGY = 20, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 30)

/obj/item/clothing/suit/armor/vest/ftu/ComponentInitialize()
	. = ..()
	var/datum/component/storage/concrete/storage = AddComponent(/datum/component/storage/concrete)
	storage.max_items = 5

/obj/item/clothing/under/inteq/tactical_gorka/ftu
	name = "Cargo gorka"

/obj/item/clothing/head/helmet/skull/ftu
	name = "FTU combat skull"
	desc = "Бронированая маска из полимеров стилизованая под череп. Вселяет страх в каждого пирата."
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'
	armor = list(MELEE = 30, BULLET = 60, LASER = 25, ENERGY = 20, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 30)
	flags_inv = HIDEEYES | HIDEFACE | HIDEMASK

/obj/item/card/id/away/ftu
	name = "Ship access card"
	desc = "Личная карта каждого члена экипажа карабля"
	icon_state = "retro"
	access = list(ACCESS_AWAY_GENERIC4)

///Наборы бронирования
/obj/item/armorkit/inteq
	name = "Quiet kid armor kit"
	desc = "Набор гибких армированых пластин которые будут совершенно незаметно сидеть под твоей толстовкой, с которой ты так не захотел растоваться даже на миссии, нёрд."
	icon_state = "inteq_armor_kit"
	icon = 'modular_bluemoon/Ren/Icons/Obj/misc.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/armorkit/inteq/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE
	if(!isclothing(target))
		return
	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_OCLOTHING))
		return
	if(target.type in typesof(/obj/item/clothing/suit/toggle/armor, /obj/item/clothing/suit/space, /obj/item/clothing/suit/armor))
		to_chat(user, span_danger("You cannot modify [target], as it already has armor or is a part of special equipment."))
		return
	var/obj/item/clothing/C = target
	var/obj/item/clothing/suit/armor/vest/bluesheid/A = new /obj/item/clothing/suit/armor/vest/bluesheid(src)
	C.set_armor(A.armor)
	C.body_parts_covered = A.body_parts_covered
	C.cold_protection = A.cold_protection
	C.heat_protection = A.heat_protection
	C.resistance_flags = A.resistance_flags
	C.clothing_flags = A.clothing_flags
	C.min_cold_protection_temperature = A.min_cold_protection_temperature
	C.max_heat_protection_temperature = A.max_heat_protection_temperature
	used = TRUE
	if(used)
		C.allowed = GLOB.security_vest_allowed
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a armored vest.</span>")
		C.name = "quiet [C.name]"
		C.upgrade_prefix = "quiet"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/armorkit/helmet/inteq
	name = "Quiet kid helmet kit"
	desc = "Набор гибких армированых пластин которые будут совершенно незаметно сидеть под твоей кепкой, с которой ты так не захотел растоваться даже на миссии, нёрд."
	icon_state = "inteq_helm_kit"
	icon = 'modular_bluemoon/Ren/Icons/Obj/misc.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/armorkit/helmet/afterattack(obj/item/target, mob/user, proximity_flag, click_parameters)
	var/used = FALSE
	if(!isclothing(target))
		return
	if(!(isobj(target) && target.slot_flags & ITEM_SLOT_HEAD))
		return
	if(target.type in typesof(/obj/item/clothing/head/helmet))
		to_chat(user, span_danger("You cannot modify [target], as it already has armor or is a part of special equipment."))
		return
	var/obj/item/clothing/C = target
	var/obj/item/clothing/head/helmet/sec/blueshield/A = new /obj/item/clothing/head/helmet/sec/blueshield(src)
	C.set_armor(A.armor)
	C.body_parts_covered = A.body_parts_covered
	C.cold_protection = A.cold_protection
	C.heat_protection = A.heat_protection
	C.resistance_flags = A.resistance_flags
	C.clothing_flags = A.clothing_flags
	C.min_cold_protection_temperature = A.min_cold_protection_temperature
	C.max_heat_protection_temperature = A.max_heat_protection_temperature
	used = TRUE
	if(used)
		user.visible_message("<span class = 'notice'>[user] reinforces [C] with [src].</span>", \
		"<span class = 'notice'>You reinforce [C] with [src], making it as protective as a helmet.</span>")
		C.name = "quiet [C.name]"
		C.upgrade_prefix = "quiet"
		qdel(src)
		return
	else
		to_chat(user, "<span class = 'notice'>You don't need to reinforce [C] any further.")
		return

/obj/item/storage/box/inteq_kit/quetkid/PopulateContents()
	new /obj/item/armorkit/inteq(src)
	new /obj/item/armorkit/helmet/inteq(src)

///Инженерный риг
/obj/item/clothing/head/helmet/space/hardsuit/engine/ftu
	name = "Ship engineering hardsuit helmet"
	desc = "Стандартный шлем инженерного костюма для техническогл обслуживания судов торгового флота."
	icon_state = "hardsuit0-odst"
	item_state = "hardsuit0-odst"
	hardsuit_type = "odst"
	mob_overlay_icon = 'modular_sand/icons/mob/clothing/head.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	anthro_mob_worn_overlay = 'modular_sand/icons/mob/clothing/head_muzzled.dmi'
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15)

/obj/item/clothing/suit/space/hardsuit/engine/ftu
	name = "Ship engineering hardsuit"
	desc = "Стандартный инженерный костюм для технического обслуживания судов торгового флота."
	icon_state = "hardsuit-odst"
	item_state = "hardsuit-odst"
	mob_overlay_icon = 'modular_sand/icons/mob/clothing/suit.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine/ftu
	anthro_mob_worn_overlay = 'modular_sand/icons/mob/clothing/suit_digi.dmi'
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list(MELEE = 30, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 60, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 15)
	unique_reskin = list()
	jetpack = /obj/item/tank/jetpack/suit

///Исследовательский риг
/obj/item/tank/jetpack/suit/fast
	full_speed = TRUE

/obj/item/clothing/head/helmet/space/hardsuit/security/explorer
	name = "Expedition hardsuit helmet"
	desc = "Армированый шлем, в котором не страшно засунуть свой нос даже в самые опасные заброшеные станции и обломки кораблей."
	icon_state = "hardsuit0-explorer"
	item_state = "hardsuit0-explorer"
	hardsuit_type = "explorer"
	mob_overlay_icon = 'modular_sand/icons/mob/clothing/head.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	anthro_mob_worn_overlay = 'modular_sand/icons/mob/clothing/head_muzzled.dmi'

/obj/item/clothing/suit/space/hardsuit/security/explorer
	name = "Expedition hardsuit"
	desc = "Армированый костюм, в котором не страшно ступить даже в самые опасные заброшеные станции и обломки кораблей."
	icon_state = "hardsuit-explorer"
	item_state = "hardsuit-explorer"
	mob_overlay_icon = 'modular_sand/icons/mob/clothing/suit.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/explorer
	anthro_mob_worn_overlay = 'modular_sand/icons/mob/clothing/suit_digi.dmi'
	jetpack = /obj/item/tank/jetpack/suit/fast
	unique_reskin = list()

///FTU риг
/obj/item/clothing/head/helmet/space/hardsuit/security/ftu
	name = "Fleet security hardsuit helmet"
	desc = "Носи с гордостью."
	icon_state = "hardsuit0-ftu_combat"
	item_state = "hardsuit0-ftu_combat"
	hardsuit_type = "ftu_combat"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'

/obj/item/clothing/suit/space/hardsuit/security/ftu
	name = "Fleet security hardsuit"
	desc = "Боевой костюм, расчитаный на длительные сражения в космосе с превосходящими силами противника. После многолетних чисток целых секторов от пиратства, теперь заставляет многих нервно сглотнуть от одного своего вида."
	icon_state = "hardsuit-ftu_combat"
	item_state = "hardsuit-ftu_combat"
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/cloth.dmi'
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/ftu
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/clothing_digi.dmi'
	equip_sound = 'modular_bluemoon/Ren/Sound/equp.ogg'
	slowdown = 0.1
	jetpack = /obj/item/tank/jetpack/suit/fast
	unique_reskin = list()

///Чулки чулки чулки блять
/obj/item/clothing/underwear/socks/thigh/stockings/socks_garterbelt
	name = "Socks garterbelt"
	icon_state = "socks_garterbelt"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/thigh/stockings/stocking_2strip
	name = "Two strip stocking"
	icon_state = "stocking_2strip"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/thigh/stockings/stocking_checkered
	name = "Checkered stocking"
	icon_state = "stocking_checkered"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/thigh/stockings/stocking_1strip
	name = "One strip stocking"
	icon_state = "stocking_1strip"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/thigh/stockings/stocking_line
	name = "Line stocking"
	icon_state = "stocking_line"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/socks_2strip
	name = "Two strip socks"
	icon_state = "socks_2strip"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/socks_checkered
	name = "Checkered socks"
	icon_state = "socks_checkered"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/socks_2strip
	name = "Two strip socks"
	icon_state = "socks_2strip"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

/obj/item/clothing/underwear/socks/socks_line
	name = "Line socks"
	icon_state = "socks_line"
	icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Ren/Icons/Mob/random_cloth/more_stockings_digi.dmi'

///Сука, чулки в лодауте. Пиздец чулков.
/datum/gear/socks/socks_garterbelt
	name = "Polychromic Socks Garterbelt"
	path = /obj/item/clothing/underwear/socks/thigh/stockings/socks_garterbelt

/datum/gear/socks/stocking_2strip
	name = "Polychromic Two Strip Stocking"
	path = /obj/item/clothing/underwear/socks/thigh/stockings/stocking_2strip

/datum/gear/socks/stocking_checkered
	name = "Polychromic Checkered Stocking"
	path = /obj/item/clothing/underwear/socks/thigh/stockings/stocking_checkered

/datum/gear/socks/stocking_1strip
	name = "Polychromic One Strip Stocking"
	path = /obj/item/clothing/underwear/socks/thigh/stockings/stocking_1strip

/datum/gear/socks/stocking_line
	name = "Polychromic Line Stocking"
	path = /obj/item/clothing/underwear/socks/thigh/stockings/stocking_line

/datum/gear/socks/socks_2strip
	name = "Polychromic Two Strip Socks"
	path = /obj/item/clothing/underwear/socks/socks_2strip

/datum/gear/socks/socks_checkered
	name = "Polychromic Checkered Socks"
	path = /obj/item/clothing/underwear/socks/socks_checkered

/datum/gear/socks/socks_2strip
	name = "Polychromic Two Strip Socks"
	path = /obj/item/clothing/underwear/socks/socks_2strip

/datum/gear/socks/socks_line
	name = "Polychromic Line Socks"
	path = /obj/item/clothing/underwear/socks/socks_line

/datum/outfit/inteq_dead
	back = /obj/item/storage/backpack
	name = "InteQ corps"
	suit = /obj/item/clothing/suit/armor/inteq
	uniform = /obj/item/clothing/under/inteq
	shoes = /obj/item/clothing/shoes/combat/swat/knife
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/swat/inteq
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	id = /obj/item/card/id/inteq

/obj/effect/mob_spawn/human/corpse/inteq_dead
	name = "InteQ Operative"
	id_job = "Operative"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	outfit = /datum/outfit/inteq_dead

/datum/outfit/ftu/solder
	name = "FTU Solder"
	uniform = /obj/item/clothing/under/inteq/tactical_gorka
	belt = /obj/item/storage/belt/military/assault
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/fingerless
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	suit = /obj/item/clothing/suit/armor/vest/ftu
	head = /obj/item/clothing/head/helmet/skull/ftu
	neck = /obj/item/clothing/neck/cloak/ftu
	l_hand = /obj/item/choice_beacon/ftu
	r_pocket = /obj/item/kitchen/knife/combat/survival/knuckledagger
	id = /obj/item/card/id/away/ftu

/datum/outfit/ftu/crew
	name = "FTU Crew"
	uniform = /obj/item/clothing/under/inteq/tactical_gorka/ftu
	belt = /obj/item/storage/belt/military/assault
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/soft/orange
	back = /obj/item/storage/backpack/satchel
	l_pocket = /obj/item/choice_beacon/ftu
	r_pocket = /obj/item/kitchen/knife/combat/survival/knuckledagger
	id = /obj/item/card/id/away/ftu
	backpack_contents = list(/obj/item/storage/box/survival/security/radio)

/datum/outfit/ftu/qm
	name = "FTU QM"
	uniform = /obj/item/clothing/under/rank/cargo/qm
	belt = /obj/item/storage/belt/military/assault
	neck = /obj/item/clothing/neck/cloak
	back = /obj/item/storage/backpack/satchel
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	suit = /obj/item/clothing/suit/armor/vest
	head = /obj/item/clothing/head/beret/qm
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/gun/energy/pulse/pistol/inteq
	id = /obj/item/card/id/away/ftu
	backpack_contents = list(/obj/item/storage/box/survival/security/radio, /obj/item/paper/fluff/traid_ship/qm)
