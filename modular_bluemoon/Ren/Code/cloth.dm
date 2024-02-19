/obj/item/storage/toolbox/infiltrator/inteq
	name = "SpecOps case"
	desc = "Элегантный кейс с отделкой из кожи и эмблемой золотого щита. Содержит внутри костюм, разработанный для понижения заметности пользователя в условиях тесных пространств замкнутых помещений. Сам кейс же отлично подходит для переноса всего того арсенала оружия, что ты взял с собой на "тихую" миссию."
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
	desc = "Лёгкий шлем с панорамным визором. Покрыт защитной плёнкой, спасающей владельца от ярких вспышек, а армированный визор сможет выдержать не одну пулю во время твоей "скрытной" миссии.
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
	
///InteQ Uplink additions

/datum/uplink_item/suits/inteq_infiltrator_bundle
	name = "SpecOps Infiltration Gear Case"
	desc = "Тактический костюм разработки Мародёров Горлекса, слегка изменённый внутренними предприятиями inteQ для собственных нужд. Лёгкий, прочный и тихий костюм совершенно не сковывает движений владельца. Покрывает всё тело носителя и использует внутренний блок шифровки голоса, гарантируя, что никто не узнает вашу личность. Набор содержит в себе костюм, бронежилет, ботинки, перчатки, шлем и балаклаву. Не предназначен для использования в условиях пониженного давления."
	item = /obj/item/storage/toolbox/infiltrator/inteq
	cost = 5
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)
