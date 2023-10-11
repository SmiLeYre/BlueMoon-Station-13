//Melee

/obj/item/claymore/cerberus
	name = "claymore"
	desc = "Чего ты пялишься? Руби врагов!"
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "siegesword"
	item_state = "claymore"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 30

/obj/item/claymore/censor
	name = "silver sword"
	desc = "Серебрянный меч с гравировкой на лезвии и рукояти. Подсохшая кровь на лезвии будоражит ваш рассудок."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "silversword"
	item_state = "bastard"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/claymore/baron
	name = "silver sabre"
	desc = "Серебрянная сабля с гравировкой на лезвии и рукояти. Подсохшая кровь на лезвии будоражит ваш рассудок."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 40

/obj/item/spear/cerberus
	icon_state = "tribal_spear0"
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	name = "tribal spear"
	force = 25
	icon_prefix = "tribal_spear"

/obj/item/spear/cerberus/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=25, force_wielded=45, icon_wielded="[icon_prefix]1")

/obj/item/claymore/cerberus/bardiche
	name = "bardiche"
	desc = "A huge stick with a blade at the end. Say it's called an ax? In any case, it cuts people well."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "bardiche"
	item_state = "bardiche"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/shield/riot/roman/cerberus
	name = "wooden shield"
	desc = "wooden shield with a small iron insert in the middle. Has a handle to make it easier to hold."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "wbuckler"
	item_state = "wbuckler"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/shield/riot/roman/paladin
	name = "paladin shield"
	desc = "steel shield with a with the cross of the Gray Post Christian Church in the middle."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "paladin"
	item_state = "paladin"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'

/obj/item/gun/energy/taser/bolestrel
	name = "sparq"
	desc = "A weapon that uses small darts that cause your opponent to wallow in agony."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	icon_state = "sparq"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/electrode/bolestrel)

/obj/item/gun/energy/taser/bolestrel/censor
	name = "modernized sparq"
	icon_state = "taser_h"

/obj/item/ammo_casing/energy/electrode/bolestrel
	projectile_type = /obj/item/projectile/energy/electrode/security/hos/bolestrel
	select_name = "make pain"
	fire_sound = 'sound/weapons/bowfire.wav'
	e_cost = 50
	harmful = FALSE

/obj/item/projectile/energy/electrode/security/hos/bolestrel
	icon = 'modular_bluemoon/krashly/icons/obj/projectiles.dmi'
	icon_state = "cbbolt"
	hitsound = 'sound/weapons/nebhit.ogg'
	tracer_type = null
	muzzle_type = null
	impact_type = null

/obj/item/candle/infinite/candlestick
	name = "candlestick"
	desc = "Candlestick with candles. Smells tasty."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "candle1_lit"
	item_state = "candle1_lit"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'

//Ballistic

/obj/item/gun/ballistic/automatic/ak12
	name = "\improper AK-12 rifle"
	desc = "Простая в использовании Автоматическая Винтовка. Её придумали ещё столетия назад, а популярна она и по сей день."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	item_state = "ak12"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ak12
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	burst_size = 3
	fire_delay = 1
	fire_sound = 'modular_bluemoon/krashly/sound/ak12_fire.ogg'

/obj/item/gun/ballistic/automatic/ak12/update_icon_state()
	if(magazine)
		icon_state = "ak12"
		item_state = "ak12"
	else
		icon_state = "ak12_e"
		item_state = "ak12_e"

/obj/item/ammo_box/magazine/ak12
	name = "\improper AK-12 magazine"
	desc = "Магазин способный держать 30 патронов калибра 5.56мм."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12_mag"
	item_state = "ak12_mag"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ak12/ap
	name = "\improper AK-12 armor-piercing magazine"
	desc = "Магазин способный держать 30 бронепробивающих патронов калибра 5.56мм."
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_box/magazine/ak12/hp
	name = "\improper AK-12 hollow-point magazine"
	desc = "Магазин способный держать 30 разрывных патронов калибра 5.56мм."
	ammo_type = /obj/item/ammo_casing/a556/hp

/obj/item/gun/ballistic/automatic/ak12/pindicate
	pin = /obj/item/firing_pin/implant/pindicate

////////////////////////////////////////////////////////////////////////////////////
/obj/item/gun/ballistic/automatic/ak12/r
	name = "\improper Pink AK-12 rifle"
	icon_state = "akr12"
	item_state = "akr12"
	fire_delay = 3
	mag_type = /obj/item/ammo_box/magazine/ak12/r
	//fire_sound = 'modular_bluemoon/krashly/sound/ak12_fire.ogg'

/obj/item/gun/ballistic/automatic/ak12/r/update_icon_state()
	if(magazine)
		icon_state = "akr12"
		item_state = "akr12"
	else
		icon_state = "akr12_e"
		item_state = "akr12_e"

/obj/item/ammo_box/magazine/ak12/r
	name = "\improper Pink AK-12 magazine"
	icon_state = "akr12_mag"
	item_state = "akr12_mag"

/datum/supply_pack/security/armory/ak12r
	name = "Pink AK-12 Rifle Crate"
	desc = "Contains one high-powered, fully automatic rifle, and three mags. Requires Armory access to open."
	cost = 35000
	contains = list(/obj/item/gun/ballistic/automatic/ak12/r,
					/obj/item/ammo_box/magazine/ak12/r,
					/obj/item/ammo_box/magazine/ak12/r,
					/obj/item/ammo_box/magazine/ak12/r)
	crate_name = "pink ak12 rifle crate"
