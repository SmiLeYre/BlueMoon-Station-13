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

////////////////////////////////

/obj/item/sponge_kit
	name = "Sponge Vloes Modification Kit"
	desc = "A modkit for making a default boxing gloves into a yellow gloves."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/clothing/gloves/boxing/sponge //what it makes
	var/list/fromitem = list(/obj/item/clothing/gloves/boxing, /obj/item/clothing/gloves/boxing/blue, /obj/item/clothing/gloves/boxing/green) //what it needs

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


/obj/item/clothing/gloves/boxing/sponge
	icon_state = "sponge"
	item_state = "sponge"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hands.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hands.dmi'

/////////

/obj/item/clothing/neck/tie/cross/shielded
	name = "Radiant relic"
	desc = "Данный артефакт был известен еще во времена затухания звёзд. Он стал знаменит тем, что излучает направленные лучи света, которые образуют купол вокруг носителя. Поколениями его носили верховные христианские жрецы. Теперь же это не более чем очень дорогой уникальный аксессуар."
	icon_state = "cross_shielded"
	//var/cached_vis_overlay

//Декоративный оверлей при надевании предмета в слот шеи. Убран по просьбе заказчика, но мало ли
///obj/item/clothing/neck/tie/cross/shielded/equipped(mob/living/L, slot)
	//..()
	//if(slot == ITEM_SLOT_NECK)
		//var/layer = (L.layer > MOB_LAYER ? L.layer : MOB_LAYER) + 0.01
		//cached_vis_overlay = SSvis_overlays.add_vis_overlay(L, 'icons/effects/effects.dmi', "shield-golden", layer, GAME_PLANE, L.dir)

///obj/item/clothing/neck/tie/cross/shielded/dropped(mob/living/L)
	//areaif(cached_vis_overlay)
		//SSvis_overlays.remove_vis_overlay(L, cached_vis_overlay)
		//cached_vis_overlay = null
	//..()

///obj/item/clothing/neck/tie/cross/shielded/Destroy(mob/living/L)
	//if(cached_vis_overlay)
		//SSvis_overlays.remove_vis_overlay(L, cached_vis_overlay)
		//cached_vis_overlay = null
	//return ..()


////////

/obj/item/clothing/glasses/sunglasses/shiro
	name = "Shiro's Sunglasses"
	desc = "These silver aviators belong to Shiro Silverhand."
	icon_state = "shiro"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'


////////////////////////

/obj/item/clothing/accessory/booma_patch
	name = "BSF ArmPatch"
	desc = "«BoomahSpecialForces» — предплечевая выполненная на заказ нашивка, означающая о принадлежности к некоему отряду Бумахов, или, для более углублённых в тему людей, Бустеров!"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	icon_state = "booma"
	item_state = "booma"
