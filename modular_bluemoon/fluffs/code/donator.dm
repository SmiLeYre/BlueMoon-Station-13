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

/datum/gear/donator/bm/ellys_suit
	name = "Ellys Costume"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/ellys_suit
	ckeywhitelist = list("chowny")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/ellys_hoodie
	name = "Ellys Hoodie"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/ellys_hoodie
	ckeywhitelist = list("chowny")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

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
	ckeywhitelist = list("leony24", "vulpshiro", "dolbajob", "trustmeimengineer", "stgs", "krashly", "hazzi")
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
	ckeywhitelist = list("stgs", "sodastrike", "dolbajob", "hazzi", "krashly", "fiaskin")
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
	ckeywhitelist = list("leony24", "vulpshiro", "dolbajob", "trustmeimengineer")
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

/datum/gear/donator/bm/dominator
	name = "Dominator Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/dominator_kit
	ckeywhitelist = list("shalun228")
	subcategory = LOADOUT_SUBCATEGORIES_DON19

/datum/gear/donator/bm/nue
	name = "Araki Nue Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/nue_kit
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife", "z67")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/stunblade
	name = "Stunblade Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/stunblade_kit
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife", "leony24", "stgs", "lonofera", "z67")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/aviator_helmet
	name = "Aviator Helmet"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/helmet/aviator_helmet/no_armor
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON18

/datum/gear/donator/bm/old_wrappings
	name = "Old Wrappings"
	slot = ITEM_SLOT_NECK
	path = /obj/item/clothing/neck/mantle/cowboy
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON18

/datum/gear/donator/bm/flektarn
	name = "Flektarn Combat Uniform"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/flektarn
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24")
	subcategory = LOADOUT_SUBCATEGORIES_DON16

/datum/gear/donator/bm/flektarn_casual
	name = "Flektarn Casual Uniform"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/flektarn_casual
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24")
	subcategory = LOADOUT_SUBCATEGORIES_DON16

/datum/gear/donator/bm/flektarn_montur
	name = "Flektarn Montur"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/flektarn_montur
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24")
	subcategory = LOADOUT_SUBCATEGORIES_DON16

/datum/gear/donator/bm/flektarn_beret
	name = "Flektarn Beret"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/flektarn_beret
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24")
	subcategory = LOADOUT_SUBCATEGORIES_DON16

/datum/gear/donator/bm/skull_patch
	name = "PMC Skull Patch"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/clothing/accessory/skull_patch
	ckeywhitelist = list("krashly", "stgs", "hazzi", "dolbajob", "leony24", "snacksman")
	subcategory = LOADOUT_SUBCATEGORIES_DON10

/datum/gear/donator/bm/SH_jacket
	name = "Shiro Silverhand Jacket"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/SH_jacket
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife", "z67")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/SH_glasses
	name = "Shiro Silverhand Glasses"
	slot = ITEM_SLOT_EYES
	path = /obj/item/clothing/glasses/sunglasses/shiro
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife", "z67")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/emma_plush
	name = "Emma Plush"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/mammal/fox/emma
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/shiro_plush
	name = "Shiro Plush"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/mammal/fox/emma/shiro
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/raita_plush
	name = "Raita Plush"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/mammal/fox/emma/raita
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/who_plush
	name = "Security Officer Plush"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/nukeplushie/who
	ckeywhitelist = list("stgs")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/noonar
	name = "Syndicate jacket"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/toggle/noonar
	ckeywhitelist = list("noonar")
	subcategory = LOADOUT_SUBCATEGORIES_DON20

/datum/gear/donator/bm/pchelik
	name = "GFYS"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/gun/ballistic/automatic/AM4B_pchelik
	ckeywhitelist = list("pchelik")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/pchelik_cloak
	name = "Coopie's Cloak"
	slot = ITEM_SLOT_NECK
	path = /obj/item/clothing/neck/cloak/coopie_cloak
	ckeywhitelist = list("pchelik")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/pomogator
	name = "Pomogator Modification Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/pomogator_kit
	ckeywhitelist = list("danik10p")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/sponge
	name = "Sponge Modification Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/sponge_kit
	ckeywhitelist = list("danik10p")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/battle_coat
	name = "Battle Coat"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/battle_coat
	ckeywhitelist = list("ghoststalin", "g3234")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/sports_jacket
	name = "Sports Jacket"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/sports_jacket
	ckeywhitelist = list("ghoststalin", "g3234")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/harness
	name = "Harness Armor Modification Kit"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/harness_kit
	ckeywhitelist = list("ghoststalin", "g3234")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/cross_shielded
	name = "Shielded Cross"
	slot = ITEM_SLOT_NECK
	path = /obj/item/clothing/neck/tie/cross/shielded
	ckeywhitelist = list("kalifasun", "dofalt")
	subcategory = LOADOUT_SUBCATEGORIES_DON21

/datum/gear/donator/bm/miner_plushie
	name = "Miner Plushie"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/miner
	ckeywhitelist = list("cheburek228")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/omega_plushie
	name = "Omega Plushie"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/nukeplushie/omega
	ckeywhitelist = list("malopharan")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/nri_drg
	name = "Covert Ops Tactical Uniform"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/nri_drg
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/nri_drg_head
	name = "Covert Ops Headgear"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/nri_drg_head
	ckeywhitelist = list("vulpshiro", "dolbajob", "stgs", "leony24", "krashly")
	subcategory = LOADOUT_SUBCATEGORIES_DON12

/datum/gear/donator/bm/booma_patch
	name = "Boomah Patch"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/clothing/accessory/booma_patch
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/booma
	name = "Boomah Turtleneck"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/booma
	ckeywhitelist = list("vulpshiro", "dolbajob", "ordinarylife")
	subcategory = LOADOUT_SUBCATEGORIES_DON17

/datum/gear/donator/bm/vance_plush
	name = "Vance Plush"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/sergal/judas/vance
	ckeywhitelist = list("littlemouse2729")
	subcategory = LOADOUT_SUBCATEGORIES_DON12
