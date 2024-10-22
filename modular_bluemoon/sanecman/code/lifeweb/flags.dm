// Флаги и постеры лавеба

// Флаги
/obj/structure/sign/flag/ravenheart
	name = "flag of Ravenheart"
	desc = "Красный флаг с изображением вороны."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/raven_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/ravenheart

/obj/item/sign/flag/ravenheart
	name = "folded flag of the Ravenheart"
	desc = "Сложенный флаг графства \"Воронье Сердце\"."
	flag_type = "ravenheart"
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/raven_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/ravenheart


/obj/structure/sign/flag/ravenheart/alt
	name = "banner of Ravenheart"
	desc = "Красный баннер с изображением вороны."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/raven_flag.dmi'
	icon_state = "full_alt"
	item_flag = /obj/item/sign/flag/ravenheart/alt

/obj/item/sign/flag/ravenheart/alt
	name = "rolled banner of the Ravenheart"
	desc = "Свёрнутый баннер графства \"Воронье Сердце\"."
	flag_type = "ravenheart_alt"
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/raven_flag.dmi'
	icon_state = "mini_alt"
	sign_path = /obj/structure/sign/flag/ravenheart/alt

// Постеры

// Основа
/obj/item/poster/random_ravenheart
	name = "random ravenheart poster"
	poster_type = /obj/structure/sign/poster/contraband/ravenheart/random
	icon_state = "rolled_contraband"

/obj/structure/sign/poster/contraband/ravenheart/random
	name = "random ravenheart poster"
	icon_state = "random_contraband"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/contraband/ravenheart

// Различные постеры
/obj/structure/sign/poster/contraband/ravenheart/sad
	name = "Burning sad pain"
	desc = "Прошлое жалит больно, как и будущее."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "sad"

/obj/structure/sign/poster/contraband/ravenheart/inq
	name = "Inquisitor"
	desc = "Они защищают наши души от еретических учений."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "inq"

/obj/structure/sign/poster/contraband/ravenheart/inq1
	name = "Servant of God"
	desc = "Слуга божья что защищает наши души от еретических умов."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "inq1"

/obj/structure/sign/poster/contraband/ravenheart/death
	name = "Nothing is eternal"
	desc = "Ничто не вечно."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "death"

/obj/structure/sign/poster/contraband/ravenheart/pray
	name = "Pray for us"
	desc = "Только молитвы богу спасут наши души."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "poster_pray"

/obj/structure/sign/poster/contraband/ravenheart/lana
	name = "Lana Aiko"
	desc = "Первая женщина-патриарх."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "lana"

/obj/structure/sign/poster/contraband/ravenheart/obscene
	name = "Obscenity is part of life"
	desc = "Всего понемногу." // https://ru.wiktionary.org/wiki/понемногу
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/poster.dmi'
	icon_state = "obscene"
