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
	fire_delay = 4
	recoil = 4
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
	desc = "Solar Federation Marine Corps pistol, downgraded in order to be used by the NT Security. Can be loaded with enlarged 10mm magazines."
	icon_state = "g22"
	item_state = "g22"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	mag_type = /obj/item/ammo_box/magazine/m10mm_large
	can_suppress = FALSE
	burst_size = 4
	fire_delay = 2
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	automatic_burst_overlay = TRUE
	spawnwithmagazine = FALSE
	fire_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/g22.ogg'

/obj/item/gun/ballistic/automatic/pistol/g22/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"


///
/obj/item/ammo_box/magazine/m10mm_large
	name = "enlarged pistol magazine (10mm)"
	desc = "An extra ammo gun magazine."
	icon_state = "c20r45-16"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = "10mm"
	max_ammo = 16

/obj/item/ammo_box/magazine/m10mm_large/soporific
	name = "enlarged pistol magazine (10mm soporific)"
	desc = "An extra ammo gun magazine. Loaded with rounds which inject the target with a variety of substances to induce sleep in the target."
	icon_state = "c20r46-16"
	ammo_type = /obj/item/ammo_casing/c10mm/soporific

/obj/item/ammo_box/magazine/m10mm_large/update_icon()
	..()
	icon_state = "c20r45-[round(ammo_count(),2)]"

/obj/item/ammo_box/magazine/m10mm_large/soporific/update_icon()
	..()
	icon_state = "c20r46-[round(ammo_count(),2)]"
///

/datum/design/m10mm_large
	name = "enlarged pistol magazine (10mm)"
	desc = "An extra ammo gun magazine."
	id = "10mm_large"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/ammo_box/magazine/m10mm_large
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m10mm_large_soporific
	name = "enlarged pistol magazine (10mm soporific)"
	desc = "An extra ammo gun magazine. Loaded with rounds which inject the target with a variety of substances to induce sleep."
	id = "10mm_large_soporific"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass=3000)
	build_path = /obj/item/ammo_box/magazine/m10mm_large/soporific
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

///

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
	new /obj/item/ammo_box/magazine/m10mm_large(src)
	new /obj/item/ammo_box/magazine/m10mm_large(src)
	new /obj/item/ammo_box/magazine/m10mm_large(src)
	new /obj/item/ammo_box/magazine/m10mm_large/soporific(src)
	new /obj/item/ammo_box/magazine/m10mm_large/soporific(src)
	new /obj/item/ammo_box/magazine/m10mm_large/soporific(src)

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


/// Sledgehammer
/obj/item/inteq_sledgehammer
	name = "sledgehammer"
	desc = "Just a normal engineering tool, ain't it?"
	icon_state = "sledgehammer"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_l.dmi'
	righthand_file = 'modular_bluemoon/kovac_shitcode/icons/mob/weapons/weapons_r.dmi'
	force = 10
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	wound_bonus = 30
	bare_wound_bonus = 50
	armour_penetration = 70
	attack_speed = CLICK_CD_MELEE * 1.2
	w_class = WEIGHT_CLASS_BULKY
	item_flags = ITEM_CAN_PARRY | ITEM_CAN_BLOCK
	block_parry_data = /datum/block_parry_data/inteq_sledgehammer
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("smashed", "rammed", "slammed")
	hitsound = 'modular_bluemoon/kovac_shitcode/sound/weapons/sledge.ogg'
	var/swiping = FALSE
	var/wielded = FALSE // track wielded status on item

/obj/item/inteq_sledgehammer/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)

/obj/item/inteq_sledgehammer/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=10, force_wielded=25, icon_wielded="sledgehammer1")

/// triggered on wield of two handed item
/obj/item/inteq_sledgehammer/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/// triggered on unwield of two handed item
/obj/item/inteq_sledgehammer/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/obj/item/inteq_sledgehammer/update_icon_state()
	icon_state = "sledgehammer"

/obj/item/inteq_sledgehammer/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is trying to literally smash himself with [src]! It looks like [user.ru_who()] trying to commit suicide!</span>")
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/obj/item/bodypart/BP = C.get_bodypart(BODY_ZONE_HEAD)
		if(BP)
			BP.drop_limb()
			playsound(src,pick('modular_bluemoon/kovac_shitcode/sound/weapons/sledge.ogg') ,50, 1, -1)
	return (BRUTELOSS)

/obj/item/inteq_sledgehammer/pre_attack(atom/A, mob/living/user, params, attackchain_flags, damage_multiplier)
	. = ..()
	if(. & STOP_ATTACK_PROC_CHAIN)
		return
	if(swiping || !istype(A, /obj/structure/spacevine) || get_turf(A) == get_turf(user))
		return
	else
		var/turf/user_turf = get_turf(user)
		var/dir_to_target = get_dir(user_turf, get_turf(A))
		var/stam_gain = 0
		swiping = TRUE
		var/static/list/sledge_slash_angles = list(0, 45, 90, -45, -90)
		for(var/i in sledge_slash_angles)
			var/turf/T = get_step(user_turf, turn(dir_to_target, i))
			for(var/obj/structure/spacevine/V in T)
				if(user.Adjacent(V))
					melee_attack_chain(user, V, attackchain_flags = ATTACK_IGNORE_CLICKDELAY)
					stam_gain += 20					//should be hitcost
		swiping = FALSE
		stam_gain += 15								//Initial hitcost
		user.adjustStaminaLoss(-stam_gain)
		user.DelayNextAction()

/obj/item/inteq_sledgehammer/attack(mob/target, mob/living/carbon/human/user)
	if(user.has_dna() && user.dna.check_mutation(HULK))
		to_chat(user, "<span class='warning'>You grip the sledgehammer too hard and accidentally drop it!</span>")
		user.dropItemToGround(src)
		return
	..()
	if((wielded) && prob(50))
		INVOKE_ASYNC(src, .proc/slash, user)

/obj/item/inteq_sledgehammer/proc/slash(mob/living/user, mob/living/target)
		user.do_attack_animation(target, ATTACK_EFFECT_KICK)
		sleep(1)

/obj/item/inteq_sledgehammer/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(proximity && isobj(A) && !isitem(A))
		var/obj/O = A
		O.take_damage(18)
		O.take_damage(8)

/datum/block_parry_data/inteq_sledgehammer
	can_block_directions = BLOCK_DIR_NORTH
	block_damage_absorption = 3
	block_damage_multiplier = 0.1
	block_damage_multiplier_override = list(
		ATTACK_TYPE_MELEE = 0.1
	)
	block_start_delay = 0.5
	block_stamina_cost_per_second = 6.5
	block_stamina_efficiency = 2
	block_lock_sprinting = TRUE
	// no attacking while blocking
	block_lock_attacking = TRUE

	parry_time_windup = 0
	parry_time_active = 3
	parry_time_spindown = 0

	parry_time_windup_visual_override = 1
	parry_time_active_visual_override = 3
	parry_time_spindown_visual_override = 3
	parry_flags = PARRY_DEFAULT_HANDLE_FEEDBACK
	parry_time_perfect = 1
	parry_time_perfect_leeway = 1
	parry_imperfect_falloff_percent = 10
	parry_efficiency_considered_successful = 15
	parry_failed_stagger_duration = 4 SECONDS

// Traitor Chainsaw
/obj/item/chainsaw/inteq_chainsaw
	name = "Chainsaw"
	desc = "<span class='warning'>VRRRRRRR!!!</span>"
	armour_penetration = 40
	force_on = 30

///InteQ Uplink additions

/datum/uplink_item/inteq/inteq_sledgehammer
	name = "Sledgehammer"
	desc = "A murderous weapon, perfect for dealing fracture wounds and breaching structures. Posses some blocking and armor piecing capabilities.\
	Bought massively from NRI mercenaries, it has become one of the most beloved InteQ weapons."
	item = /obj/item/inteq_sledgehammer
	cost = 10

/datum/uplink_item/dangerous/inteq_chainsaw
	name = "Chainsaw"
	desc = "A high powered chainsaw for cutting up ...you know...."
	item = /obj/item/chainsaw/inteq_chainsaw
	cost = 12
