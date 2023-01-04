//Файл для выдачи предметов донатерам по сикею

/*
/datum/gear/donator/bm
	name = "Видишь это - пингуй Feenie#1815" //Название предмета
	slot = ITEM_SLOT_BACKPACK //Место, в который будет выдаваться предмет, конкретно тут - кладётся в рюкзак
	path = /obj/item/bikehorn/golden //Ссылка на датум объекта
	category = LOADOUT_CATEGORY_DONATOR //Категория, в которой будет содержаться предмет - собственно во вкладке лодаута донатерских
	ckeywhitelist = list("Этого вы не должны видеть") //Иначе кто-то ебанулся с кодом - пингуйте всё того же
*/

/datum/gear/donator/bm/pt_crown
	name = "Crown of Pure Tyranny"
	slot = ITEM_SLOT_HEAD
	path = /obj/item/clothing/head/donator/bm/pt_crown
	ckeywhitelist = list("snacksman")

/datum/gear/donator/bm/modern_watch
	name = "modern watch"
	slot = ITEM_SLOT_GLOVES
	path = /obj/item/clothing/wrists/bm/modern_watch
	ckeywhitelist = list("zar_shef")
