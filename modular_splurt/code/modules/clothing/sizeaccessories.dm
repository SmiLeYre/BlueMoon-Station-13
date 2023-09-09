//GLOVE SLOT ITEMS...
//SynTech ring
/obj/item/clothing/accessory/ring/syntech
	name = "normalizer ring"
	desc = "An expensive, shimmering SynTech ring gilded with golden NanoTrasen markings. It will 'normalize' the size of the user to a specified height approved for work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	icon_state = "ring"
	item_state = "sring" //No use in a unique sprite since it's just one pixel
	w_class = WEIGHT_CLASS_TINY
	body_parts_covered = 0
	transfer_prints = TRUE
	strip_delay = 40
	equip_delay_self = 175
	unequip_delay_self = 175
	//These are already defined under the parent ring, but I wanna leave em here for reference purposes

//For glove slots
/obj/item/clothing/accessory/ring/syntech/equipped(mob/living/user, slot)
	if(slot != ITEM_SLOT_GLOVES)
		return ..()

	// BLUEMOON ADDITION AHEAD - запрет на нормализацию размера существ, у которых есть трейт на невозможность нормализации размера
	if(HAS_TRAIT(user, TRAIT_BLUEMOON_ANTI_NORMALIZER))
		to_chat(user, "<span class='warning'>\The [src] buzzes, as nothing changes.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return . = ..()
	// BLUEMOON ADDITION END

	if(user.GetComponent(/datum/component/size_normalized))
		to_chat(user, "<span class='warning'>\The [src] buzzes, being overwritten by another accessory.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
	else
		user.AddComponent(/datum/component/size_normalized, wear=src)
	. = ..()

/obj/item/clothing/accessory/ring/syntech/dropped(mob/living/user, slot)
	var/datum/component/size_normalized/comp = user.GetComponent(/datum/component/size_normalized)
	if(comp?.attached_wear == src)
		qdel(comp)
	. = ..()

//SynTech Wristband
/obj/item/clothing/wrists/syntech
	name = "normalizer wristband"
	desc = "An expensive technological wristband cast in SynTech purples with shimmering NanoTrasen golds. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. There is a small screen buzzing with information."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/hands.dmi'
	icon_state = "wristband"
	item_state = "syntechband"
	equip_delay_self = 175
	unequip_delay_self = 175

/obj/item/clothing/wrists/syntech/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_WRISTS)
		return ..()

	// BLUEMOON ADDITION AHEAD - запрет на нормализацию размера существ, у которых есть трейт на невозможность нормализации размера
	if(HAS_TRAIT(user, TRAIT_BLUEMOON_ANTI_NORMALIZER))
		to_chat(user, "<span class='warning'>\The [src] buzzes, as nothing changes.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return . = ..()
	// BLUEMOON ADDITION END

	if(user.GetComponent(/datum/component/size_normalized))
		to_chat(user, "<span class='warning'>\The [src] buzzes, being overwritten by another accessory.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
	else
		user.AddComponent(/datum/component/size_normalized, wear=src)
	. = ..()

/obj/item/clothing/wrists/syntech/dropped(mob/living/user, slot)
	var/datum/component/size_normalized/comp = user.GetComponent(/datum/component/size_normalized)
	if(comp?.attached_wear == src)
		qdel(comp)
	. = ..()

//NECK SLOT ITEMS...
//Syntech Pendant
/obj/item/clothing/neck/syntech
	name = "normalizer pendant"
	desc = "A vibrant violet jewel cast in silvery-gold metals, sporting the elegance of NanoTrasen with SynTech prowess. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "pendant"
	item_state = "pendant"
	equip_delay_self = 175
	unequip_delay_self = 175

//For neck items
/obj/item/clothing/neck/syntech/equipped(mob/living/user, slot)
	if(slot != ITEM_SLOT_NECK)
		return ..()

	// BLUEMOON ADDITION AHEAD - запрет на нормализацию размера существ, у которых есть трейт на невозможность нормализации размера
	if(HAS_TRAIT(user, TRAIT_BLUEMOON_ANTI_NORMALIZER))
		to_chat(user, "<span class='warning'>\The [src] buzzes, as nothing changes.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return . = ..()
	// BLUEMOON ADDITION END

	if(user.GetComponent(/datum/component/size_normalized))
		to_chat(user, "<span class='warning'>\The [src] buzzes, being overwritten by another accessory.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
	else
		user.AddComponent(/datum/component/size_normalized, wear=src)
	. = ..()

/obj/item/clothing/neck/syntech/dropped(mob/living/user, slot)
	var/datum/component/size_normalized/comp = user.GetComponent(/datum/component/size_normalized)
	if(comp?.attached_wear == src)
		qdel(comp)
	. = ..()

//Syntech Choker
/obj/item/clothing/neck/syntech/choker
	name = "normalizer choker"
	desc = "A sleek, tight-fitting choker embezzled with silver to gold, adorned with vibrant purple studs; combined technology of NanoTrasen and SynTech. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. There is a small screen buzzing with information."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	icon_state = "choker"
	item_state = "collar"

//Syntech Collar
/obj/item/clothing/neck/syntech/collar
	name = "normalizer collar"
	desc = "A cute pet collar, technologically designed with vibrant purples and smooth silvers. There is a small gem bordered by gold at the front, reading 'SYNTECH' engraved within the metal. It will 'normalize' the size of the user to a specified height for approved work-conditions, as long as it is equipped. The artificial violet gem inside twinkles ominously."
	icon = 'modular_splurt/icons/obj/clothing/sizeaccessories.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "collar"
	item_state = "collar"
