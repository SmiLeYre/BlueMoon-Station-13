#define SANDMAN_TOTAL_LAYERS 1

///Mr. sandman
/mob/living/simple_animal/hostile/morph/sandman
	name = "sandman"
	unique_name = FALSE
	desc = "Who the fuck is he?!"
	icon = 'modular_bluemoon/Ren/Icons/Mob/sandman.dmi'
	icon_state = "sandman"
	icon_living = "sandman"
	icon_dead = "sandman_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	AIStatus = AI_OFF
	maxHealth = 150
	health = 150
	minbodytemp = 270
	maxbodytemp = 350
	status_flags = (null)
	loot = list(/obj/effect/gibspawner/generic)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4)
	response_help_continuous = "touches"
	response_help_simple = "touch"
	response_disarm_continuous = "shoves"
	response_disarm_simple = "shove"
	response_harm_continuous = "hits"
	response_harm_simple = "hit"
	attack_verb_continuous = "gores"
	attack_verb_simple = "gore"
	speak_emote = list("murmurs")
	speed = -0.3
	see_in_dark = 7
	melee_damage_lower = 10
	melee_damage_upper = 15
	wound_bonus = 20
	damage_coeff = list(BRUTE = 0.2, BURN = 1.5, TOX = 0, CLONE = 5, STAMINA = 0, OXY = 0)
	attack_sound = 'sound/creatures/zombie_attack.ogg'
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM,)
	healable = 1
	dextrous = TRUE
	dextrous_hud_type = /datum/hud/dextrous/sandman
	var/list/sandman_overlays[SANDMAN_TOTAL_LAYERS]
	var/obj/item/internal_storage
	var/obj/item/wear_id
	held_items = list(null, null)

	vocal_bark_id = "bump"


/mob/living/simple_animal/hostile/morph/sandman/mob_has_gravity()
	return ..() || mob_negates_gravity()

///Дроп вещей при смерти
/mob/living/simple_animal/hostile/morph/sandman/death(gibbed)
	..()
	if(internal_storage)
		dropItemToGround(internal_storage)
	var/mob/living/brain/B = new(drop_location())
	B.name = real_name
	B.real_name = real_name
	mind.transfer_to(B)

///Инвентарь
/mob/living/simple_animal/hostile/morph/sandman/doUnEquip(obj/item/I, force, newloc, no_move, invdrop = TRUE, silent)
	if(..())
		update_inv_hands()
		if(I == internal_storage)
			internal_storage = null
			update_inv_internal_storage()
		return 1
	return 0

/mob/living/simple_animal/hostile/morph/sandman/can_equip(obj/item/I, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE, clothing_check = FALSE, list/return_warning)
	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			if(internal_storage)
				return 0
			return 1
	..()

/mob/living/simple_animal/hostile/morph/sandman/equip_to_slot(obj/item/I, slot)
	if(!..())
		return

	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			internal_storage = I
			update_inv_internal_storage()
		else
			to_chat(src, "<span class='danger'>You are trying to equip this item to an unsupported inventory slot. Report this to a coder!</span>")

/mob/living/simple_animal/hostile/morph/sandman/getBackSlot()
	return ITEM_SLOT_DEX_STORAGE

/mob/living/simple_animal/hostile/morph/sandman/getBeltSlot()
	return ITEM_SLOT_DEX_STORAGE

/mob/living/simple_animal/hostile/morph/sandman/proc/update_inv_internal_storage()
	if(internal_storage && client && hud_used && hud_used.hud_shown)
		internal_storage.screen_loc = ui_id
		client.screen += internal_storage

/mob/living/simple_animal/hostile/morph/sandman/regenerate_icons()
	..()
	update_inv_internal_storage()

///inteq mobs

/mob/living/simple_animal/hostile/syndicate/ranged/sniper
	name = "InteQ Sniper"
	desc = "Он очень сильно хочет, что бы ты сдох"
	ranged = 1
	retreat_distance = 7
	minimum_distance = 7
	icon = 'modular_bluemoon/Ren/Icons/Mob/mobs.dmi'
	icon_state = "infiltrator_sniper"
	icon_living = "infiltrator_sniper"
	casingtype = /obj/item/ammo_casing/p50
	projectilesound = "sound/weapons/noscope.ogg"
	ranged_cooldown = 90
	check_friendly_fire = 1
	loot = list(/obj/effect/gibspawner/human)
	dodging = TRUE
	rapid_melee = 1
	speak_chance = 12
	speak = list("Я попал? Я попал, да?!", "Это там твои мозги вытекают?!", "Да куда я положил магазин, сука где он, где он?!", "Я буду убивать тебя медленно, отстреливая кусочек за кусочком~")

/mob/living/simple_animal/hostile/syndicate/ranged/sniper/Aggro()
	..()
	summon_backup(15)
	say("Парни, у нас тут мишень нарисовалась. Работаем, работаем!")

/mob/living/simple_animal/hostile/syndicate/melee/ushm
	name = "InteQ Breacher"
	melee_damage_lower = 10
	melee_damage_upper = 10
	wound_bonus = 40
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	icon = 'modular_bluemoon/Ren/Icons/Mob/mobs.dmi'
	icon_state = "infiltrator_mele"
	icon_living = "infiltrator_mele"
	loot = list(/obj/effect/gibspawner/human)
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'modular_bluemoon/Ren/Sound/USHM_hit.ogg'
	status_flags = 0

/mob/living/simple_animal/hostile/skeleton/meatguy
	name = "Living meat"
	desc = "Отвратительная пародия на человека из мяса и костей"
	melee_damage_lower = 10
	melee_damage_upper = 20
	sharpness = SHARP_EDGED
	wound_bonus = 10
	bare_wound_bonus = 10
	icon = 'modular_bluemoon/Ren/Icons/Mob/mobs.dmi'
	var/number

/mob/living/simple_animal/hostile/skeleton/meatguy/Initialize(mapload)
	. = ..()
	if(!number)
		number = rand(3)
	icon_state = "fleshling[number]"
	icon_living = "fleshling[number]"
