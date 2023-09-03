//Файл для выдачи предметов донатерам по сикею

/*
/datum/gear/donator/bm
	name = "Видишь это - пингуй Feenie#1815" //Название предмета
	slot = ITEM_SLOT_BACKPACK //Место, в который будет выдаваться предмет, конкретно тут - кладётся в рюкзак
	path = /obj/item/bikehorn/golden //Ссылка на датум объекта
	category = LOADOUT_CATEGORY_DONATOR //Категория, в которой будет содержаться предмет - собственно во вкладке лодаута донатерских
	ckeywhitelist = list("Сикей получателя") //Если вы видите этот текст ингейм, значит кто-то ебанулся с кодом - пингуйте всё того же
*/

/datum/gear/donator/bm/pt_crown
	name = "Crown of Pure Tyranny"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/pt_crown
	ckeywhitelist = list("snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON01

/datum/gear/donator/bm/bishop_mitre
	name = "GPC Mitre"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/bishop_mitre
	ckeywhitelist = list("snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON01

/datum/gear/donator/bm/bishop_mantle
	name = "Bishop Mantle"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/bishop_mantle
	ckeywhitelist = list("snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON01

/datum/gear/donator/bm/reaper_helmet
	name = "Reaper Helmet"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/head/helmet/space/plasmaman/security/reaper
	ckeywhitelist = list("reaperdb")
	subcategory = LOADOUT_SUBCATEGORIES_DON02

/datum/gear/donator/bm/reaper_suit
	name = "Reaper Suit"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/under/plasmaman/security/reaper
	ckeywhitelist = list("reaperdb")
	subcategory = LOADOUT_SUBCATEGORIES_DON02

/datum/gear/donator/bm/modern_watch
	name = "modern watch"
	slot = ITEM_SLOT_GLOVES
	path = /obj/item/clothing/wrists/donator/bm/modern_watch
	ckeywhitelist = list("zarshef")
	subcategory = LOADOUT_SUBCATEGORIES_DON03

/datum/gear/donator/bm/gaston
	name = "Gaston"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/chaotic_toaster/gaston
	ckeywhitelist = list("gastonix")
	subcategory = LOADOUT_SUBCATEGORIES_DON04

/datum/gear/donator/bm/blueflame
	name = "horns of blue flame"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/blueflame
	ckeywhitelist = list("weirdbutton")
	subcategory = LOADOUT_SUBCATEGORIES_DON05

/datum/gear/donator/bm/gorka
	name = "Gorka"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/gorka
	ckeywhitelist = list("leony24", "vulp_shiro", "dolbajob", "trustmeimengineer", "stgs", "Krashly", "hazzi")
	subcategory = LOADOUT_SUBCATEGORIES_DON06

/datum/gear/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/lightning_holocloak
	ckeywhitelist = list("weirdbutton")
	subcategory = LOADOUT_SUBCATEGORIES_DON05

/datum/gear/donator/bm/modern_suit
	name = "Modern Suit"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/modern_suit
	ckeywhitelist = list("rainbowkurwa")
	subcategory = LOADOUT_SUBCATEGORIES_DON07

/datum/gear/donator/bm/case_ds
	name = "military case"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/storage/box/donator/bm/case_ds
	ckeywhitelist = list("phenyamomota")
	subcategory = LOADOUT_SUBCATEGORIES_DON15

/datum/gear/donator/bm/Shigu_Kit
	name = "Butcher Knife Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/shigu_kit
	ckeywhitelist = list("lakomkin0911")
	subcategory = LOADOUT_SUBCATEGORIES_DON08

/datum/gear/donator/bm/Advanced_Tracksuit
	name = "Advanced Tracksuit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/clothing/under/syndicate/rus_army_alt
	ckeywhitelist = list("noterravija")
	subcategory = LOADOUT_SUBCATEGORIES_DON09

/datum/gear/donator/bm/cerberus_helmet
	name = "cerberus helmet"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/cerberus_helmet
	ckeywhitelist = list("krashly", "stgs", "dedmodo", "hazzi", "dolbajob", "snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

/datum/gear/donator/bm/cerberus_suit
	name = "cerberus suit"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/cerberus_suit
	ckeywhitelist = list("krashly", "stgs", "dedmodo", "hazzi", "dolbajob", "snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

/datum/gear/donator/bm/censor_fem_suit
	name = "censor suit"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/censor_fem_suit
	ckeywhitelist = list("krashly", "stgs", "dedmodo", "hazzi", "dolbajob", "snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

/datum/gear/donator/bm/Dina_Kit
	name = "Kikimora Suit Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/Dina_Kit
	ckeywhitelist = list("xdinka")
	subcategory = LOADOUT_SUBCATEGORIES_DON11

/datum/gear/donator/bm/Kovac_Gun
	name = "Kovac Gun"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/Kovac_Kit
	ckeywhitelist = list("stgs", "krashly", "dolbajob", "hazzi")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/auto9_gun
	name = "Auto 9 Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/auto9_kit
	ckeywhitelist = list("stgs", "sodastrike", "dolbajob", "hazzi", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/m240_gun
	name = "M240 Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/m240_kit
	ckeywhitelist = list("stgs", "sodastrike", "dolbajob", "hazzi", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/luftkuss_gun
	name = "Luftkuss Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/old_kit
	ckeywhitelist = list("stgs", "sodastrike", "dolbajob", "hazzi", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/Friskis_Mask
	name = "Magic Kitsune Mask"
	slot = ITEM_SLOT_MASK
	path = /obj/item/clothing/mask/magickitsune
	ckeywhitelist = list("friskis")
	subcategory = LOADOUT_SUBCATEGORIES_DON13

/datum/gear/donator/bm/Rar_Suit
	name = "HEV Suit"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/space/hardsuit/rd/hev/cosmetic
	ckeywhitelist = list("rarslt")
	subcategory = LOADOUT_SUBCATEGORIES_DON14

/datum/gear/donator/bm/utilgen
	name = "G-66 Uniform"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/utilgen
	ckeywhitelist = list("reaperdb", "rainbowkurwa")
	subcategory = LOADOUT_SUBCATEGORIES_DON02

/datum/gear/donator/bm/multicam
	name = "Multicam"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/multicam
	ckeywhitelist = list("leony24", "vulp_shiro", "dolbajob", "trustmeimengineer")
	subcategory = LOADOUT_SUBCATEGORIES_DON06

/datum/gear/donator/bm/baron
	name = "Terrifying Cloak"
	slot = ITEM_SLOT_NECK
	path = /obj/item/clothing/neck/baron
	ckeywhitelist = list("snacksman", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

/datum/gear/donator/bm/angelo
	name = "Angelo's Coat"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/angelo
	ckeywhitelist = list("axidant")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/skull_patch
	name = "PMC Skull Patch"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/clothing/accessory/skull_patch
	ckeywhitelist = list("krashly", "stgs", "hazzi", "dolbajob", "leony24", "snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON10
