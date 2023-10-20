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
	AddComponent(/datum/component/two_handed, force_unwielded=25, force_wielded=32, icon_wielded="[icon_prefix]1")

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


/obj/item/gun/ballistic/revolver/inteq
	icon_state = "revolver_inteq"

// Нерф Энфорсеров.

/obj/item/ammo_box/magazine/e32
	name = "Enforcer magazine (.32 Rubber)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "enforcer"
	ammo_type = /obj/item/ammo_casing/c32
	caliber = ".32"
	desc = "A Mk. 58 magazine. Loaded with rubber rounds."
	max_ammo = 8

/obj/item/ammo_box/magazine/e32/update_icon()
	..()
	icon_state = "enforcer-[round(ammo_count())]"

/obj/item/ammo_box/magazine/e32/lethal
	name = "Enforcer magazine (.32 Lethal)"
	desc = "A Mk. 58 magazine. Loaded with lethal rounds."
	ammo_type = /obj/item/ammo_casing/c32/lethal

/obj/item/ammo_box/magazine/e32/hydra
	name = "Enforcer magazine (.32 Hydra}"
	desc = "A Mk. 58 magazine. Loaded with Hydra-shock."
	ammo_type = /obj/item/ammo_casing/c32/hydra

/obj/item/ammo_box/magazine/e32/taser
	name = "Enforcer magazine (.32 Taser}"
	desc = "A Mk. 58 magazine. Loaded with taser rounds."
	ammo_type = /obj/item/ammo_casing/c32/taser

/obj/item/ammo_box/magazine/e32/trac
	name = "Enforcer magazine (.32 Tracking}"
	desc = "A Mk. 58 magazine. Loaded with trac rounds."
	ammo_type = /obj/item/ammo_casing/c32/trac

/obj/item/ammo_box/magazine/e32/hotshot
	name = "Enforcer magazine (.32 Hotshot}"
	desc = "A Mk. 58 magazine. Loaded with Hotshot rounds."
	ammo_type = /obj/item/ammo_casing/c32/hotshot

/obj/item/ammo_box/magazine/e32/ion
	name = "Enforcer magazine (.32 Ion}"
	desc = "A Mk. 58 magazine. Loaded with Ion rounds."
	ammo_type = /obj/item/ammo_casing/c32/ion

/obj/item/ammo_box/magazine/e32/laser
	name = "Enforcer magazine (.32 Laser}"
	desc = "A Mk. 58 magazine. Loaded with Laser rounds."
	ammo_type = /obj/item/ammo_casing/c32/laser

/obj/item/ammo_box/magazine/e32/stun
	name = "Enforcer magazine (.32 Stun}"
	desc = "A Mk. 58 magazine. Loaded with Stun rounds."
	ammo_type = /obj/item/ammo_casing/c32/stun

////////

/obj/item/ammo_casing/c32/hydra
	name = ".32 Hydra-shock casing"
	projectile_type = /obj/item/projectile/bullet/c32/hydra

/obj/item/ammo_casing/c32/taser
	name = ".32 Taser casing"
	projectile_type = /obj/item/projectile/energy/electrode/c32

/obj/item/ammo_casing/c32/trac
	name = ".32 TRAC casing"
	projectile_type = /obj/item/projectile/bullet/c32/trac

/obj/item/ammo_casing/c32/lethal
	name = ".32 casing"
	projectile_type = /obj/item/projectile/bullet/c32/lethal

/obj/item/ammo_casing/c32/ion
	name = ".32 Ion casing"
	projectile_type = /obj/item/projectile/bullet/c32/ion

/obj/item/ammo_casing/c32/hotshot
	name = ".32 Hotshot casing"
	projectile_type = /obj/item/projectile/bullet/c32/hotshot

/obj/item/ammo_casing/c32/stun
	name = ".32 Stun casing"
	projectile_type = /obj/item/projectile/beam/disabler

/obj/item/ammo_casing/c32/laser
	name = ".32 Laser casing"
	projectile_type = /obj/item/projectile/beam/laser

//////////

/obj/item/projectile/bullet/c32
	name = ".32 rubber bullet"
	damage = 3 //Было 10
	stamina = 20
	sharpness = NONE

/obj/item/projectile/bullet/c32/lethal // Пуля неиронично была как Слаг.
	name = ".32 bullet"
	damage = 20 // Было 30
	wound_bonus = 4 // Было 6
	stamina = 0
	wound_falloff_tile = -10
	sharpness = NONE

/obj/item/projectile/bullet/c32/hydra
	name = ".32 Hydra-shock bullet"
	damage = 10
	stamina = 0
	armour_penetration = -30
	wound_bonus = 10
	bare_wound_bonus = 10
	embedding = list(embed_chance=75, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5
	embed_falloff_tile = -15

/obj/item/projectile/bullet/c32/trac
	name = ".32 TRAC bullet"
	damage = 10
	stamina = 0

/obj/item/projectile/bullet/c32/ion
	projectile_type = /obj/item/projectile/ion/weak

/obj/item/projectile/bullet/c32/trac/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/mob/living/carbon/M = target
	var/obj/item/implant/tracking/c38/imp
	for(var/obj/item/implant/tracking/c38/TI in M.implants) //checks if the target already contains a tracking implant
		imp = TI
		return
	if(!imp)
		imp = new /obj/item/implant/tracking/c38(M)
		imp.implant(M)

/obj/item/projectile/bullet/c32/hotshot //similar to incendiary bullets, but do not leave a flaming trail
	name = ".32 Hot Shot bullet"
	damage = 10
	stamina = 0

/obj/item/projectile/bullet/c32/hotshot/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/item/projectile/bullet/c32_cleaning

/obj/item/projectile/energy/electrode/c32
	tase_duration = 30
	knockdown = 10
	stamina = 15
	knockdown_stamoverride = 5
	knockdown_stam_max = 40
	strong_tase = FALSE

/////////

/obj/item/gun/ballistic/automatic/pistol/enforcer/o32
	name = "\improper Mk. 58 Enforcer (.32)"
	desc = "A polymer frame pistol made by Nanotreason. Won't show up on Space port X-rays and cost more then you make in a month."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_black"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e32
	can_suppress = TRUE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14
	obj_flags = UNIQUE_RENAME
	unique_reskin = list(
		"Default" = list("icon_state" = "enforcer_black"),
		"M2611 Enforcer" = list("icon_state" = "cde"),
		"M1911 Enforcer" = list("icon_state" = "m1911"),
		"VP78 Enforcer" = list("icon_state" = "vp78"),
		"USP Enforcer" = list("icon_state" = "usp-m")
	)

/obj/item/gun/ballistic/automatic/pistol/enforcer/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]["icon_state"]][chambered ? "" : "-e"]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/enforcer/o32/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/enforcerred/o32
	name = "\improper Blueshield Mk. 58 Enforcer (.32)"
	desc = "A polymer frame pistol made by Nanotreason. Won't show up on Space port X-rays and cost more then you make in a month. Respect mah Authorita!"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_red"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e32
	can_suppress = TRUE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14

/obj/item/gun/ballistic/automatic/pistol/enforcerred/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


/obj/item/gun/ballistic/automatic/pistol/enforcergold/o32
	name = "\improper Gold Mk. 58 Enforcer (.32)"
	desc = "A titianium gold plated Enforcer. A vulger display of power. A show of force in a public execution."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "enforcer_gold"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/e32
	can_suppress = TRUE
	can_flashlight = 1
	flight_x_offset = 18
	flight_y_offset = 14

/obj/item/gun/ballistic/automatic/pistol/enforcergold/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

///////////

/datum/design/e32/e32rubber
	name = "Enforcer magazine (.32 Rubber)"
	desc = "A magazine of .32 Rubber for the Mk. 58 Enforcer"
	id = "e32_rubber"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/e32lethal
	name = "Enforcer magazine (.32 Lethal)"
	desc = "A magazine of .32 Lethal for the Mk. 58 Enforcer"
	id = "e32_lethal"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/e32taser
	name = "Enforcer magazine (.32 Taser)"
	desc = "A magazine of .32 Taser for the Mk. 58 Enforcer"
	id = "e32_taser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32/taser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/e32trac
	name = "Enforcer magazine (.32 Tracking)"
	desc = "A magazine of .32 Tracking for the Mk. 58 Enforcer"
	id = "e32_trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/hotshot
	name = "Enforcer magazine (.32 Hotshot)"
	desc = "A magazine of .32 Hotshot for the Mk. 58 Enforcer"
	id = "e32_hot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/hydra
	name = "Enforcer magazine (.32 Hydra)"
	desc = "A magazine of .32 Hydra-Shock for the Mk. 58 Enforcer"
	id = "e32_hydra"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/magazine/e32/hydra
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/e32ion
	name = "Enforcer magazine (.32 Ion)"
	desc = "A magazine of .32 Ion for the Mk. 58 Enforcer"
	id = "e32_ion"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/magazine/e32/ion
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/e32/e32stun
	name = "Enforcer magazine (.32 Stun)"
	desc = "A magazine of .32 Stun for the Mk. 58 Enforcer"
	id = "e32_stun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/magazine/e32/stun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/datum/design/e32/e32laser
	name = "Enforcer magazine (.32 Laser)"
	desc = "A magazine of .32 Laser for the Mk. 58 Enforcer"
	id = "e32_laser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/magazine/e32/laser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32r
	name = "Box of ammo (.32 Rubber)"
	desc = "A box of .32 Rubber"
	id = "c32r"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c32
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32leath
	name = "Box of ammo (.32 Lethal)"
	desc = "A box of .32 Lethal"
	id = "c32leath"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/c32/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32t
	name = "Box of ammo (.32 Taser)"
	desc = "A box of .32 Taser"
	id = "c32t"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c32/taser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32hydra
	name = "Box of ammo (.32 Hydra-Shock)"
	desc = "A box of .32 Hydra-shock"
	id = "c32hydra"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c32/hydra
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32hot
	name = "Box of ammo (.32 Hotshot)"
	desc = "A box of .32 Hotshot"
	id = "c32hot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c32/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32trac
	name = "Box of ammo (.32 Trac)"
	desc = "A box of .32 Trac"
	id = "c32trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c32/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32stun
	name = "Box of ammo (.32 Stun)"
	desc = "A box of .32 Stun"
	id = "c32stun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/uranium = 1500)
	build_path = /obj/item/ammo_box/c32/stun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32las
	name = "Box of ammo (.32 Laser)"
	desc = "A box of .32 Laser"
	id = "c32las"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/uranium = 1500)
	build_path = /obj/item/ammo_box/c32/laser
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c32/c32ion
	name = "Box of ammo (.32 Ion)"
	desc = "A box of .32 Ion"
	id = "c32ion"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/uranium = 1500)
	build_path = /obj/item/ammo_box/c32/ion
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/techweb_node/c32ammo
	id = "c32_ammo"
	display_name = ".32 Ammunition"
	description = "Ammo for 32 Caliber pistols."
	prereq_ids = list("weaponry")
	design_ids = list("c32r", "c32leath", "c32t", "c32hydra", "c32trac", "e32_rubber", "e32_lethal", "e32_taser", "e32_trac", "e32_hydra")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/advc32ammo
	id = "advc32_ammo"
	display_name = "Advance .32 Ammunition"
	description = "Make .32 ammo your bitch and make it do crazy shit."
	prereq_ids = list("weaponry", "c32_ammo", "ballistic_weapons")
	design_ids = list("e32_ion", "e32_stun", "e32_laser","e32_hot", "c32hot","c32las", "c32ion","c32stun")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3200)

/datum/design/c32
	name = "Ammo Box (.32 Rubber)"

/datum/design/c32lethal
	name = "Ammo Box (.32 Lethal)"
	id = "c32lehtal"
	build_type = AUTOLATHE | NO_PUBLIC_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/c32/lethal
	category = list("hacked", "Security")

/obj/item/ammo_box/c32
	name = "ammo box (.32 Rubber)"
	icon = 'modular_splurt/icons/obj/ammo.dmi'

/obj/item/ammo_box/c32/taser
	name = "ammo box (.32 Taser)"
	icon_state = "32box-y"
	ammo_type = /obj/item/ammo_casing/c32/taser

/obj/item/ammo_box/c32/lethal
	name = "ammo box (.32 Lethal)"
	icon_state = "32box-r"
	ammo_type = /obj/item/ammo_casing/c32/lethal

/obj/item/ammo_box/c32/stun
	name = "ammo box (.32 Stun)"
	icon_state = "32box-c"
	ammo_type = /obj/item/ammo_casing/c32/stun

/obj/item/ammo_box/c32/laser
	name = "ammo box (.32 Laser)"
	icon_state = "32box-o"
	ammo_type = /obj/item/ammo_casing/c32/laser

/obj/item/ammo_box/c32/hydra
	name = "ammo box (.32 Hydra-shock)"
	icon_state = "32box-g"
	ammo_type = /obj/item/ammo_casing/c32/hydra

/obj/item/ammo_box/c32/hotshot
	name = "ammo box (.32 Hotshot)"
	icon_state = "32box-o"
	ammo_type = /obj/item/ammo_casing/c32/hotshot

/obj/item/ammo_box/c32/ion
	name = "ammo box (.32 Ion)"
	icon_state = "32box-c"
	ammo_type = /obj/item/ammo_casing/c32/ion

/obj/item/ammo_box/c32/trac
	name = "ammo box (.32 Trac)"
	ammo_type = /obj/item/ammo_casing/c32/trac

