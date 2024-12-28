/obj/item/clothing/head/donator/bm/ushankich
	name = "ushanka"
	desc = "Perfect for winter in Siberia, da?"
	icon = 'modular_bluemoon/fedor1545/icons/clothing/obj/hats.dmi'
	mob_overlay_icon ='modular_bluemoon/fedor1545/icons/clothing/mob/head.dmi'
	icon_state = "sovietushankadown"
	item_state = "sovietushankadown"
	flags_inv = HIDEEARS
	var/earflaps = TRUE
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = COAT_MAX_TEMP_PROTECT
	///Sprite visible when the ushanka flaps are folded up.
	var/upsprite = "sovietushankaup"
	///Sprite visible when the ushanka flaps are folded down.
	var/downsprite = "sovietushankadown"

/obj/item/clothing/head/donator/bm/ushankich/attack_self(mob/user)
	if(earflaps)
		icon_state = upsprite
		item_state = upsprite
		to_chat(user, "<span class='notice'>You raise the ear flaps on the ushanka.</span>")
	else
		icon_state = downsprite
		item_state = downsprite
		to_chat(user, "<span class='notice'>You lower the ear flaps on the ushanka.</span>")
	earflaps = !earflaps
