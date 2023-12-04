//M16A4

/obj/item/gun/ballistic/automatic/m16a4
	name = "\improper M16A4 rifle"
	desc = "An american automatic rifle chambered for the 5.56 round, designed for use by SWAT."
	icon = 'modular_bluemoon/phenyamomota/icon/obj/guns/rifles.dmi'
	icon_state = "m16"
	lefthand_file = 'modular_bluemoon/phenyamomota/icon/mob/inhand/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/phenyamomota/icon/mob/inhand/guns_righthand.dmi'
	mob_overlay_icon = 'modular_bluemoon/phenyamomota/icon/mob/rifles_back.dmi'
	item_state = "m16"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/m16
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	burst_size = 3
	fire_delay = 2
	fire_sound = 'modular_bluemoon/phenyamomota/sound/guns/m16_fire.ogg'

/obj/item/gun/ballistic/automatic/m16a4/update_icon_state()
	if(magazine)
		icon_state = "m16"
	else
		icon_state = "m16-e"

/obj/item/ammo_box/magazine/m16
	name = "\improper M16A4 magazine"
	desc = "A double-stack translucent polymer magazine for use with the M16A4 rifles. Holds 30 rounds of 5.56."
	icon = 'modular_bluemoon/phenyamomota/icon/obj/guns/ammo.dmi'
	icon_state = "m16e"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/m16/ap
	name = "\improper M16A4 armor-piercing magazine"
	desc = "A double-stack translucent polymer magazine for use with the M16A4 rifles. Holds 30 rounds of armor-piercing 5.56."
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_box/magazine/m16/hp
	name = "\improper M16A4 hollow-point magazine"
	desc = "A double-stack translucent polymer magazine for use with the M16A4 rifles. Holds 30 rounds of hollow-point 5.56."
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/ammo_box/magazine/m16/rubber
	name = "\improper M16A4 rubber magazine"
	desc = "A double-stack translucent polymer magazine for use with the M16A4 rifles. Holds 30 rounds of rubber 5.56."
	ammo_type = /obj/item/ammo_casing/a556/rubber

/obj/item/gun/ballistic/automatic/m16a4/tactical
	name = "\improper tactical M16A4 rifle"
	desc = "An american automatic rifle chambered for the 5.56 round, designed for use by Special Ops."
	icon_state = "m16_tactical"
	burst_size = 5
	fire_delay = 3

/obj/item/gun/ballistic/automatic/m16a4/tactical/update_icon_state()
	if(magazine)
		icon_state = "m16_tactical"
	else
		icon_state = "m16_tactical-e"

/obj/item/gun/ballistic/automatic/m16a4/stock
	name = "\improper stock M16A4 rifle"
	desc = "An american automatic rifle chambered for the 5.56 round, just bought from nearest gun-shop."
	icon_state = "m16_stock"
	burst_size = 3
	fire_delay = 4

/obj/item/gun/ballistic/automatic/m16a4/stock/update_icon_state()
	if(magazine)
		icon_state = "m16_stock"
	else
		icon_state = "m16_stock-e"

//AK-47

/obj/item/gun/ballistic/automatic/ak47
	name = "\improper AK-47 rifle"
	desc = "A timeless human design of a carbine chambered for the 7.62 ammo. A weapon so simple that even a child could use it - and they often did. Respected by illegal mercenaries."
	icon = 'modular_bluemoon/phenyamomota/icon/obj/guns/rifles.dmi'
	icon_state = "ak47"
	lefthand_file = 'modular_bluemoon/phenyamomota/icon/mob/inhand/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/phenyamomota/icon/mob/inhand/guns_righthand.dmi'
	mob_overlay_icon = 'modular_bluemoon/phenyamomota/icon/mob/rifles_back.dmi'
	item_state = "ak47"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ak47
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	burst_size = 3
	fire_delay = 2
	fire_sound = 'modular_bluemoon/phenyamomota/sound/guns/ak47_fire.ogg'

/obj/item/gun/ballistic/automatic/ak47/update_icon_state()
	if(magazine)
		icon_state = "ak47"
	else
		icon_state = "ak47-e"

/obj/item/ammo_box/magazine/ak47
	name = "\improper AK-47 magazine"
	desc = "a banana-shaped double-stack magazine able to hold 30 rounds of 7.62 ammo."
	icon = 'modular_bluemoon/phenyamomota/icon/obj/guns/ammo.dmi'
	icon_state = "ak47"
	ammo_type = /obj/item/ammo_casing/a762x39
	caliber = "a762x39"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ak47/ap
	name = "\improper AK-47 armor-piercing magazine"
	desc = "a banana-shaped double-stack magazine able to hold 30 rounds of armor-piercing 7.62 ammo."
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_box/magazine/ak47/hp
	name = "\improper AK-47 hollow-point magazine"
	desc = "a banana-shaped double-stack magazine able to hold 30 rounds of hollow-point 7.62 ammo."
	ammo_type = /obj/item/ammo_casing/a762x39/hp

/obj/item/ammo_box/magazine/ak47/rubber
	name = "\improper AK-47 rubber magazine"
	desc = "a banana-shaped double-stack magazine able to hold 30 rounds of rubber 7.62 ammo."
	ammo_type = /obj/item/ammo_casing/a762x39/rubber

/obj/item/gun/ballistic/automatic/ak47/akm
	name = "\improper AKM rifle"
	desc = "A timeless human design of a carbine chambered for the 7.62 ammo. Imported from far-far-away frontier spaces."
	icon_state = "akm"

/obj/item/gun/ballistic/automatic/ak47/akm/update_icon_state()
	if(magazine)
		icon_state = "akm"
	else
		icon_state = "akm-e"

/obj/item/gun/ballistic/automatic/ak47/homemade
	name = "\improper HomeMade AK-47 rifle"
	desc = "Kalak-12 with zatvornaya zaderjka like M16. Karch not included."
	icon_state = "ak47_hm"
	burst_size = 3
	fire_delay = 5

/obj/item/gun/ballistic/automatic/ak47/homemade/update_icon_state()
	if(magazine)
		icon_state = "ak47_hm"
	else
		icon_state = "ak47_hm-e"

/obj/item/gun/ballistic/automatic/ak47/pindicate
	pin = /obj/item/firing_pin/implant/pindicate

/obj/item/gun/ballistic/automatic/ak47/homemade/pindicate
	pin = /obj/item/firing_pin/implant/pindicate
