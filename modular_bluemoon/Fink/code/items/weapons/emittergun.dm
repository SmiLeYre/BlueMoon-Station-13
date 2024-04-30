/obj/item/ammo_casing/energy/emittergun //бп
	fire_sound = 'sound/weapons/emitter.ogg'
	e_cost = 200
	projectile_type = /obj/item/projectile/beam/emittergun

/obj/item/projectile/beam/emittergun
	hitscan = TRUE
	damage = 45
	muzzle_type = /obj/effect/projectile/muzzle/laser/emitter
	tracer_type = /obj/effect/projectile/tracer/laser/emitter
	impact_type = /obj/effect/projectile/impact/laser/emitter
	wound_bonus = 20
	bare_wound_bonus = 20
	impact_effect_type = null

/obj/item/gun/energy/emittergun
	name = "Handicraft Emitter Rifle"
	desc = "A rifle constructed of some trash materials. Looks rough but very powerful."
	icon = 'modular_bluemoon/Fink/icons/obj/makeshift.dmi'
	lefthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/lefthand.dmi'
	righthand_file = 'modular_bluemoon/Fink/icons/mob/inhands/righthand.dmi'
	icon_state = "emittercannonvgovne"
	item_state = "emitter"
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	cell_type = /obj/item/stock_parts/cell{charge = 2200; maxcharge = 2200}
	ammo_type = list(/obj/item/ammo_casing/energy/emittergun)
	can_charge = TRUE


/obj/item/gun/energy/emittergun/Initialize(mapload)
	. = ..()
	fire_delay = 36

/obj/item/gun/energy/emittergun/do_fire(atom/target, mob/living/user, message = TRUE, params, zone_override = "", bonus_spread = 0)
	. = ..()
	do_sparks(3, 1, src) // искрим

/obj/item/gun/energy/emittergun/cool
	name = "Emitter Rifle"
	desc = "A rifle constructed for mobilised emitting."
	icon_state = "emittercannon"

/obj/item/gun/energy/emittergun/cool/Initialize(mapload)
	. = ..()
	fire_delay = 24

/datum/design/emittergun // инфа для протолата
	name = "Emitter Rifle"
	desc = "A rifle constructed for mobilised emitting."
	id = "emittergun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500, /datum/material/plasma = 1000)
	build_path = /obj/item/storage/lockbox/weapon/emittergun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	min_security_level = SEC_LEVEL_RED


/obj/item/storage/lockbox/weapon/emittergun // не валидить
	name = "Lockbox with Emitter Rifle"

/obj/item/storage/lockbox/weapon/emittergun/PopulateContents()
	new /obj/item/gun/energy/emittergun/cool(src)
