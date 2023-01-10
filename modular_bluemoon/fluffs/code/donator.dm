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

/datum/gear/donator/bm/modern_watch
	name = "modern watch"
	slot = ITEM_SLOT_GLOVES
	path = /obj/item/clothing/wrists/donator/bm/modern_watch
	ckeywhitelist = list("zar_shef")

/datum/gear/donator/bm/gaston
	name = "Gaston"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/toy/plush/chaotic_toaster/gaston
	ckeywhitelist = list("gastonix")

/datum/gear/donator/bm/blueflame
	name = "horns of blue flame"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/blueflame
	ckeywhitelist = list("weirdbutton")

/datum/gear/donator/bm/gorka
	name = "Gorka"
	slot = ITEM_SLOT_ICLOTHING
	path = /obj/item/clothing/under/donator/bm/gorka
	ckeywhitelist = list("leony24")

/datum/gear/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/donator/bm/lightning_holocloak
	ckeywhitelist = list("weirdbutton")

/datum/gear/donator/bm/case_ds
	name = "military case"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/storage/box/donator/bm/case_ds
	ckeywhitelist = list("phenyamomota")
