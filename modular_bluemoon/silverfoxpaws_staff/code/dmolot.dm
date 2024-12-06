/*
 * Demolition Sledgehammer
 */
/obj/item/dmolot  // Непосредственно молот
	name = "Demolition Molot"
	desc = "Chief Engineer's sledgehammer. The finest choice for tasks of demolishing something... Or someone."
	icon = 'modular_bluemoon/silverfoxpaws_staff/icons/obj/weapons/dmolot_icon.dmi'
	lefthand_file = 'modular_bluemoon/silverfoxpaws_staff/icons/mob/inhands/weapons/dmolot_lefthand.dmi'
	righthand_file = 'modular_bluemoon/silverfoxpaws_staff/icons/mob/inhands/weapons/dmolot_righthand.dmi'
	icon_state = "dmolotred_i"
	item_state = "dmolotred_0"
	force = 5
	throwforce = 15
	armour_penetration = 40
	wound_bonus = 8
	bare_wound_bonus = 14
	max_integrity = 200
	slot_flags = 0 // Не повесить ни на спину, ни на пояс
	sharpness = SHARP_NONE // Для дробящего урона
	w_class = WEIGHT_CLASS_BULKY
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	attack_verb = list("crushed", "big ironed", "smashed", "destroyed", "demolished", "nailed")
	hitsound = 'modular_bluemoon/fluffs/sound/weapon/stab_hammer.ogg'
	usesound = 'sound/weapons/sonic_jackhammer.ogg'
	var/wielded = FALSE // track wielded status on item

/obj/item/dmolot/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))

/obj/item/dmolot/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=22, icon_wielded="dmolotred1")

/// triggered on wield of two handed item
/obj/item/dmolot/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/// triggered on unwield of two handed item
/obj/item/dmolot/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/obj/item/dmolot/update_icon_state()
	icon_state = "dmolotred0"

/obj/item/dmolot/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window/reinforced)) // укреплённые окна эффективно не разрушает
		var/obj/structure/window/reinforced = A
		reinforced.take_damage(5, BRUTE, MELEE, 0)
		user.visible_message("<span class='warning'>The sledge's head bounced off the glass!</span>")
	else if(istype(A, /obj/structure/window))
		var/obj/structure/window/W = A
		W.take_damage(200, BRUTE, MELEE, 0)
