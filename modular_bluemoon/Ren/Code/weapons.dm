/// USHM
/obj/item/pickaxe/drill/jackhammer/angle_grinder
	name = "USHM"
	icon = 'icons/obj/mining.dmi'
	icon_state = "jackhammer"
	item_state = "jackhammer"
	w_class = WEIGHT_CLASS_HUGE
	toolspeed = 0.3 //the epitome of powertools. extremely fast mining, laughs at puny walls
	digrange = 2
	usesound = 'modular_bluemoon/Ren/Sound/USHM_hit.ogg'
	hitsound = 'modular_bluemoon/Ren/Sound/USHM_hit.ogg'
	desc = "Heavy industrial angle grinder. Designed for cutting reinforced concrete, but will easily cut through human bones. Equipped with a high capacity portable battery."
	force = 30
	attack_speed = CLICK_CD_MELEE * 1.5
	throwforce = 10
	wound_bonus = 40
	armour_penetration = 40
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "shredded")

/obj/item/pickaxe/drill/jackhammer/angle_grinder/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/// Melter
/obj/item/gun/energy/pulse/pistol/inteq
	name = "Melter"
	desc = "What they were proud of will kill them"
	icon_state = "pulse_pistol"
	item_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/melter)
	cell_type = "/obj/item/stock_parts/cell/pulse/pistol"

/obj/item/ammo_casing/energy/laser/melter  
	projectile_type = /obj/item/projectile/beam/melter
	e_cost = 300
	select_name = "MELT"
	fire_sound = 'modular_bluemoon/Ren/Sound/Melter.ogg'

/obj/item/projectile/beam/melter 
	icon_state = "pulse0"
	damage = 60
	light_color = "#ffff00"
	wound_bonus = 40
	

/obj/item/projectile/beam/melter/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!QDELETED(target) && (isturf(target) || istype(target, /obj/structure/)))
		target.ex_act(EXPLODE_HEAVY)

/// Tactical cameras connected

/obj/item/clothing/glasses/TCC
	name = "TCC"
	desc = "Glasses whith tactical conect to station cameras"
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "judicial_visor_0"
	var/obj/machinery/computer/camera_advanced
	actions_types = list(/datum/action/item_action/toggle_cameras)

/datum/action/item_action/toggle_cameras
	name = "Подключение к системе видеонаблюдения"
	desc = "Позволяет пользоваться системой видеонаблюдения станции"
	icon_icon = 'icons/mob/actions/actions.dmi'
	button_icon_state = "hook"
	button_icon = 'icons/mob/actions/actions.dmi'

/obj/item/clothing/glasses/TCC/Initialize(mapload)
	. = ..()
	camera_advanced = new()

///datum/action/item_action/toggle_cameras/Trigger()

/obj/item/clothing/glasses/TCC/attack_self(mob/user)
	..()
	camera_advanced.attack_hand(mob/user)


///InteQ Uplink additions
/datum/uplink_item/inteq/angle_grinder
	name = "USHM"
	desc = "An industrial tool that will help cut a path through walls, stones and “living barriers”."
	item = /obj/item/pickaxe/drill/jackhammer/angle_grinder
	cost = 8
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/pulse_pistol
	name = "Melter"
	desc = "The power of an industrial plasma cutter and military pulse rifles in a pistol package. Small, killer and practically disposable. It burns through walls and enemies like butter, but after a couple of shots it already requires reloading."
	item = /obj/item/gun/energy/pulse/pistol/inteq
	cost = 13
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)
