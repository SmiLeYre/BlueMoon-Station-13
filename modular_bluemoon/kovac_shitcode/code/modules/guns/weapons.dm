//Vintorez

/obj/item/gun/ballistic/automatic/vss
	name = "\improper Vintovka Snayperskya Spetszyalnya"
	desc = "Russian Empire Spetznaz weapon, intended for use with 9x39 ammo caliber. SolGov capitalists and politicians are enormously afraid of this thingy."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	icon_state = "vintorez_scope"
	item_state = "vintorez_scope"
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/vss_mag
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	inaccuracy_modifier = 0.5
	zoomable = TRUE
	zoom_amt = 8 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5
	fire_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/vss_shoot.ogg'

/obj/item/gun/ballistic/automatic/vss/update_icon_state()
	if(magazine)
		icon_state = "vintorez_scope"
	else
		icon_state = "vintorez_scope_open"

/obj/item/ammo_box/magazine/vss_mag
	name = "\improper VSS magazine"
	desc = "A VSS magazine able to hold 20 rounds of 9x39 ammo."
	icon_state = "75-8"
	ammo_type = /obj/item/ammo_casing/a9x39
	caliber = "9x39"
	max_ammo = 20

/obj/item/gun/ballistic/automatic/l6_saw/pkmp
	name = "\improper PKMP Machinegun"
	desc = "Modified 7.12x82mm russian machinegun, also known as L6 SAW counterpart."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	icon_state = "pkmp"
	item_state = "pkmp"
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	fire_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/pkmp_shoot.ogg'
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/l6_saw/pkmp/update_icon_state()
	if(magazine)
		icon_state = "pkmp"
	else
		icon_state = "pkmp_open"
