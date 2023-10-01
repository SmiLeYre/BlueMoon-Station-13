/obj/item/gun
	pickup_sound = 'modular_bluemoon/krashly/sound/items/gun_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/gun_drop.ogg'

/obj/item/flashlight
	soundon = 'modular_bluemoon/krashly/sound/items/flashlight_on.ogg'
	soundoff = 'modular_bluemoon/krashly/sound/items/flashlight_off.ogg'

/obj/item/gun/ballistic/shotgun
	pickup_sound = 'modular_bluemoon/krashly/sound/items/shotgun_pickup.ogg'

/obj/item/gun/ballistic/shotgun/boltaction
	pickup_sound = 'modular_bluemoon/krashly/sound/items/rifle_pickup.ogg'

/obj/item/coin
	pickup_sound = 'modular_bluemoon/krashly/sound/items/coin_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/coin_drop.ogg'

/obj/item/kitchen/knife
	pickup_sound = 'modular_bluemoon/krashly/sound/items/knife_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/knife_drop.ogg'

/obj/item/stack/rods
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/scalpel
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/retractor
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/hemostat
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/cautery
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/circular_saw
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/surgicaldrill
	pickup_sound = 'modular_bluemoon/krashly/sound/items/surgery1_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/metal_drop.ogg'

/obj/item/surgical_drapes
	pickup_sound =  'modular_bluemoon/krashly/sound/items/surgery2_pickup.ogg'

/obj/item/reagent_containers/glass
	pickup_sound = 'modular_bluemoon/krashly/sound/items/bottle_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/bottle_drop.ogg'

/obj/item/reagent_containers/glass/beaker
	pickup_sound = 'modular_bluemoon/krashly/sound/items/beaker_pickup.ogg'
	drop_sound = 'modular_bluemoon/krashly/sound/items/beaker_drop.ogg'

/obj/item/storage/backpack
	var/on_sound = 'modular_bluemoon/krashly/sound/items/unzip.ogg'

/obj/item/storage/backpack/attack_self(mob/user)
	playsound(src.loc, on_sound, 40, 1)

/datum/component/storage/backpack
	dupe_mode = COMPONENT_DUPE_UNIQUE

/datum/component/storage/backpack/on_alt_click(datum/source, mob/user)
	if(!isliving(user) || !user.CanReach(parent))
		return
	if(check_locked(source, user, TRUE))
		return TRUE

	var/atom/A = parent
	if(!quickdraw)
		A.add_fingerprint(user)
		user_show_to_mob(user, trigger_on_found = TRUE)
		if(rustle_sound)
			playsound(A, 'modular_bluemoon/krashly/sound/items/unzip.ogg', 50, 1, -5)
		return TRUE

/datum/component/storage/backpack/on_attack_hand(datum/source, mob/user)
	var/atom/A = parent
	if(!attack_hand_interact)
		return
	if(user.active_storage == src && A.loc == user) //if you're already looking inside the storage item
		user.active_storage.close(user)
		close(user)
		. = COMPONENT_NO_ATTACK_HAND
		return

	if(rustle_sound)
		playsound(A, 'modular_bluemoon/krashly/sound/items/unzip.ogg', 50, 1, -5)

/obj/item/storage/briefcase
	var/on_sound = 'modular_bluemoon/krashly/sound/items/briefcase.ogg'

/obj/item/storage/briefcase/attack_self(mob/user)
	playsound(src.loc, on_sound, 40, 1)

/obj/item/reagent_containers/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(src.loc, 'modular_bluemoon/krashly/sound/items/watersplash.ogg', 40, 1)

