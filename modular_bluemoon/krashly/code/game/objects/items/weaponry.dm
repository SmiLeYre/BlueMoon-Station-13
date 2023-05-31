//Melee

/obj/item/claymore/cerberus
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "siegesword"
	item_state = "claymore"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 30

/obj/item/claymore/censor
	name = "silver sword"
	desc = "A silver sword with patterns on its blade and handle. Dried blood on the edge of the blade is frightening."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "silversword"
	item_state = "bastard"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	force = 35

/obj/item/claymore/baron
	name = "silver sabre"
	desc = "A silver sabre with patterns on its blade and handle. Dried blood on the edge of the blade is frightening."
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
	desc = "A simple-to-use automatic assault rifle that was used hundreds of years ago, but has not become obsolete to this day."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12"
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/weapons/righthand.dmi'
	item_state = "ak12"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ak12
	can_suppress = FALSE
	burst_size = 2
	fire_delay = 2
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
	desc = "magazine able to hold 30 rounds of 5.45 ammo."
	icon = 'modular_bluemoon/krashly/icons/obj/weapons/weapons.dmi'
	icon_state = "ak12_mag"
	item_state = "ak12_mag"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/ak12/ap
	name = "\improper AK-12 armor-piercing magazine"
	desc = "magazine able to hold 30 rounds of armor-piercing 5.45 ammo."
	ammo_type = /obj/item/ammo_casing/a556/ap

/obj/item/ammo_box/magazine/ak12/hp
	name = "\improper AK-12 hollow-point magazine"
	desc = "magazine able to hold 30 rounds of hollow-point 5.45 ammo."
	ammo_type = /obj/item/ammo_casing/a556/hp
