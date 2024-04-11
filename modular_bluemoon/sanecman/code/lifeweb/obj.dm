// Различные предметы
/obj/item/storage/box/raven_box
	name = "dark red box"
	desc = "Тёмно-красная коробка."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/box.dmi'
	icon_state = "ravenbox"

/obj/item/storage/box/raven_box/posters
	name = "ravenheart posters box"
	desc = "Тёмно-красная коробка."

/obj/item/storage/box/raven_box/posters/PopulateContents()
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
	new	/obj/item/poster/random_ravenheart(src)
