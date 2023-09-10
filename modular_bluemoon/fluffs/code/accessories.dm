/obj/item/clothing/accessory/medal/donator/bm/delta
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	icon_state = "medal_delta"
	name = "Delta squad medal"
	desc = "Proof of belonging to the \"Delta Squad\", as well as the strength and leadership in it."

/obj/item/clothing/neck/cloak/coopie_cloak
	name = "Coopie's cloak"
	desc = "Именной плащ слаймика. Виднеется большая буква 'С'. Ниже, мелким шрифтом, написано: 'если вы нашли его, значит я его потеряла. Верните, пожалуйста. Владелец: Coopie'"
	icon_state = "coopie_cloak"
	item_state = "coopie_cloak"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'


/////

/obj/item/pomogator_kit
	name = "Pomogator Modification Kit"
	desc = "A modkit for making a default backpack into a Pomogator."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/storage/backpack/pomogator //what it makes
	var/list/fromitem = list(/obj/item/storage/backpack) //what it needs

/obj/item/pomogator_kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

/obj/item/storage/backpack/pomogator
	name = "Pomogator"
	desc = "It's a satchel that holds fixie tools and other things."
	icon_state = "pomogator"
	item_state = "pomogator"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
