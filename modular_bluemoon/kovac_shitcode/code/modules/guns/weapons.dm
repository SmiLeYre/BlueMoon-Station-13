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

//Pecheneg
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

//RSH-12

/obj/item/ammo_box/magazine/internal/shot/com/rsh12
	name = "rsh-12 internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/rubbershot
	max_ammo = 5

/obj/item/gun/ballistic/shotgun/automatic/combat/rsh12
	name = "RSH-12"
	desc = "A russian-made semi-automatic beast, intended to use with 12 gauge."
	icon_state = "rsh12"
	item_state = "rsh12"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	fire_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/rsh12.ogg'
	pumpsound = 'modular_bluemoon/kovac_shitcode/sound/weapons/rsh12_drum.ogg'
	fire_delay = 3
	recoil = 5
	spread = 3
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/rsh12
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	unique_reskin = list(
		"RSH-12" = list("icon_state" = "rsh12")
	)

//HoS G22 pistol
/obj/item/gun/ballistic/automatic/pistol/g22
	name = "\improper G22 Mark. 1"
	desc = "Solar Federation Marine Corps pistol, downgraded in order to be used by the NT Security. Can be loaded with 10mm."
	icon_state = "g22"
	item_state = "g22"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	can_suppress = FALSE
	burst_size = 3
	automatic_burst_overlay = TRUE
	spawnwithmagazine = FALSE
	fire_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/g22.ogg'

/obj/item/gun/ballistic/automatic/pistol/g22/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


//Head of Security's new weapons beacon and stuff

/obj/item/storage/secure/briefcase/rsh12_box
	name = "\improper RSH-12 revolver box"
	desc = "A storage case for a heavy HoS revolver."

/obj/item/storage/secure/briefcase/rsh12_box/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/automatic/combat/rsh12(src)
	new /obj/item/ammo_box/shotgun/loaded/rubbershot(src)
	new /obj/item/ammo_box/shotgun/loaded/rubbershot(src)
	new /obj/item/ammo_box/shotgun/loaded/buckshot(src)

/obj/item/storage/secure/briefcase/g22_box
	name = "\improper G-22 pistol box"
	desc = "A storage case for a HoS pistol."

/obj/item/storage/secure/briefcase/g22_box/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/g22(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm/soporific(src)
	new /obj/item/ammo_box/magazine/m10mm/soporific(src)

/obj/item/choice_beacon/hos_new_weapon
	name = "personal weapon beacon"
	desc = "Use this to summon your personal Head of Security issued firearm!"

/obj/item/choice_beacon/hos_new_weapon/generate_display_names()
	var/static/list/hos_new_weapon = list("RSH-12 Revolver" = /obj/item/storage/secure/briefcase/rsh12_box,
		"G-22 Pistol" = /obj/item/storage/secure/briefcase/g22_box,
		"X-01 MultiPhase Energy Gun" = /obj/item/storage/secure/briefcase/hos/multiphase_box)
	if(!hos_new_weapon)
		hos_new_weapon = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			hos_new_weapon[initial(A.name)] = A
	return hos_new_weapon

