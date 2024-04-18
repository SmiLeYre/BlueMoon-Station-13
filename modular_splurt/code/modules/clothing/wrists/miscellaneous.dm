// Sprites by Keila
/obj/item/clothing/wrists/armwarmer
	name = "Arm Warmers"
	desc = "A pair of arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer"
	item_state = "armwarmer"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer/long
	name = "Long Arm Warmers"
	desc = "A pair of long arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_long"
	item_state = "armwarmer_long"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer_striped
	name = "Striped Arm Warmers"
	desc = "A pair of striped arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_striped"
	item_state = "armwarmer_striped"
	body_parts_covered = ARMS
	var/list/poly_colors = list("#FFFFFF", "#FFFFFF")

/obj/item/clothing/wrists/armwarmer_striped/long
	name = "Long Striped Arm Warmers"
	desc = "A pair of long striped arm warmers."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "armwarmer_striped_long"
	item_state = "armwarmer_striped_long"
	body_parts_covered = ARMS

/obj/item/clothing/wrists/armwarmer_striped/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 2)

/obj/item/clothing/wrists/helper_bracelet
	name = "Браслет - Давайте общаться"
	desc = "Относительно новая разработка для поддержки некоторого социального слоя существ."
	icon = 'modular_splurt/icons/obj/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/wrists.dmi' // BLUEMOON EDIT - was 'modular_splurt/icons/mob/clothing/wrists.dmi'
	icon_state = "talk_need"

/obj/item/clothing/wrists/helper_bracelet/love_need_bracelet
	name = "Браслет - Нахожусь в активном поиске любви"
	icon_state = "love_need"

/obj/item/clothing/wrists/helper_bracelet/rape_need_bracelet
	name = "Браслет - Изнасилуйте меня"
	icon_state = "rape_need"

/obj/item/clothing/wrists/helper_bracelet/fuckme_need_bracelet
	name = "Браслет - Трахните меня"
	icon_state = "fuckme_need"

/obj/item/clothing/wrists/helper_bracelet/fuckyou_need_bracelet
	name = "Браслет - Хочу трахнуть кого-то"
	icon_state = "fuckyou_need"
