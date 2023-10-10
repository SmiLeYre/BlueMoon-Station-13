/*
	Bones
*/
// TODO: well, a lot really, but i'd kill to get overlays and a bonebreaking effect like Blitz: The League, similar to electric shock skeletons

/*
	Base definition
*/
/datum/wound/blunt
	sound_effect = 'sound/effects/wounds/crack1.ogg'
	wound_type = WOUND_BLUNT
	wound_flags = (BONE_WOUND | ACCEPTS_GAUZE)

	/// Have we been taped?
	var/taped
	/// Have we been bone gel'd?
	var/gelled
	/// If we did the gel + surgical tape healing method for fractures, how many regen points we need
	var/regen_points_needed
	/// Our current counter for gel + surgical tape regeneration
	var/regen_points_current
	/// If we suffer severe head booboos, we can get brain traumas tied to them
	var/datum/brain_trauma/active_trauma
	/// What brain trauma group, if any, we can draw from for head wounds
	var/brain_trauma_group
	/// If we deal brain traumas, when is the next one due?
	var/next_trauma_cycle
	/// How long do we wait +/- 20% for the next trauma?
	var/trauma_cycle_cooldown
	/// If this is a chest wound and this is set, we have this chance to cough up blood when hit in the chest
	var/internal_bleeding_chance = 0

/*
	Overwriting of base procs
*/
/datum/wound/blunt/wound_injury(datum/wound/old_wound = null)
	if(limb.body_zone == BODY_ZONE_HEAD && severity == WOUND_SEVERITY_CRITICAL && brain_trauma_group)
		processes = TRUE
		active_trauma = victim.gain_trauma_type(brain_trauma_group, TRAUMA_RESILIENCE_WOUND)
		next_trauma_cycle = world.time + (rand(100-WOUND_BONE_HEAD_TIME_VARIANCE, 100+WOUND_BONE_HEAD_TIME_VARIANCE) * 0.01 * trauma_cycle_cooldown)

	RegisterSignal(victim, COMSIG_HUMAN_EARLY_UNARMED_ATTACK, .proc/attack_with_hurt_hand)
	if(limb.held_index && victim.get_item_for_held_index(limb.held_index) && (disabling || prob(30 * severity)))
		var/obj/item/I = victim.get_item_for_held_index(limb.held_index)
		if(istype(I, /obj/item/offhand))
			I = victim.get_inactive_held_item()

		if(I && victim.dropItemToGround(I))
			victim.visible_message("<span class='danger'>[victim] роняет [I] от болевого шока!</span>", "<span class='warning'><b>Ваша изнывающая от боли [limb.ru_name] больше не может держать [I]!</b></span>", vision_distance=COMBAT_MESSAGE_RANGE)

	update_inefficiencies()

/datum/wound/blunt/remove_wound(ignore_limb, replaced)
	limp_slowdown = 0
	QDEL_NULL(active_trauma)
	if(victim)
		UnregisterSignal(victim, COMSIG_HUMAN_EARLY_UNARMED_ATTACK)
	return ..()

/datum/wound/blunt/handle_process()
	. = ..()
	if(limb.body_zone == BODY_ZONE_HEAD && severity == WOUND_SEVERITY_CRITICAL && brain_trauma_group && world.time > next_trauma_cycle)
		if(active_trauma)
			QDEL_NULL(active_trauma)
		else
			active_trauma = victim.gain_trauma_type(brain_trauma_group, TRAUMA_RESILIENCE_WOUND)
		next_trauma_cycle = world.time + (rand(100-WOUND_BONE_HEAD_TIME_VARIANCE, 100+WOUND_BONE_HEAD_TIME_VARIANCE) * 0.01 * trauma_cycle_cooldown)

	if(!regen_points_needed)
		return

	regen_points_current++
	if(prob(severity * 2))
		victim.take_bodypart_damage(rand(2, severity * 2), stamina=rand(2, severity * 2.5), wound_bonus=CANT_WOUND)
		if(prob(33))
			to_chat(victim, "<span class='danger'>Вы ощущаете острую боль в теле, пока ваши кости восстанавливаются!</span>")

	if(regen_points_current > regen_points_needed)
		if(!victim || !limb)
			qdel(src)
			return
		to_chat(victim, "<span class='green'>Ваша [limb.ru_name] была избавлена от перелома!</span>")
		remove_wound()

/// If we're a human who's punching something with a broken arm, we might hurt ourselves doing so
/datum/wound/blunt/proc/attack_with_hurt_hand(mob/M, atom/target, proximity)
	if(victim.get_active_hand() != limb || victim.a_intent == INTENT_HELP || !ismob(target) || severity <= WOUND_SEVERITY_MODERATE)
		return

	// With a severe or critical wound, you have a 15% or 30% chance to proc pain on hit
	if(prob((severity - 1) * 15))
		// And you have a 70% or 50% chance to actually land the blow, respectively
		if(prob(70 - 20 * (severity - 1)))
			to_chat(victim, "<span class='userdanger'>Перелом в вашей [limb.ru_name_v] отзывается болью, пока вы бьете [target]!</span>")
			limb.receive_damage(brute=rand(1,5))
		else
			victim.visible_message("<span class='danger'>[victim] слабо бьет [target] [victim.ru_ego()] сломанной конечностью - [limb.ru_name], изнывая от боли!</span>", \
			"<span class='userdanger'>Вам не удается ударить [target] из-за боли и перелома в вашей конечности - [limb.ru_name]!</span>", vision_distance=COMBAT_MESSAGE_RANGE)
			victim.emote("scream")
			victim.Stun(0.5 SECONDS)
			limb.receive_damage(brute=rand(3,7))
			return COMPONENT_NO_ATTACK_HAND

/datum/wound/blunt/receive_damage(wounding_type, wounding_dmg, wound_bonus)
	if(!victim || wounding_dmg < WOUND_MINIMUM_DAMAGE)
		return
	if(ishuman(victim))
		var/mob/living/carbon/human/human_victim = victim
		if(NOBLOOD in human_victim.dna?.species.species_traits)
			return

	if(limb.body_zone == BODY_ZONE_CHEST && victim.blood_volume && prob(internal_bleeding_chance + wounding_dmg))
		var/blood_bled = rand(1, wounding_dmg * (severity == WOUND_SEVERITY_CRITICAL ? 2 : 1.5)) // 12 brute toolbox can cause up to 18/24 bleeding with a severe/critical chest wound
		switch(blood_bled)
			if(1 to 6)
				victim.bleed(blood_bled, TRUE)
			if(7 to 13)
				victim.visible_message("<span class='smalldanger'>[victim] выкашлывивает немного крови из [victim.ru_ego()] грудной клетки.</span>", "<span class='danger'>Вы выкашливаете немного крови из своей грудной клетки.</span>", vision_distance=COMBAT_MESSAGE_RANGE)
				victim.bleed(blood_bled, TRUE)
			if(14 to 19)
				victim.visible_message("<span class='smalldanger'>[victim] выкашливает кровь из [victim.ru_ego()] грудной клетки!</span>", "<span class='danger'>Вы выкашливаете кровь из своей грудной клетки!</span>", vision_distance=COMBAT_MESSAGE_RANGE)
				if(ishuman(victim))
					var/mob/living/carbon/human/H = victim
					new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir, H.dna.species.exotic_blood_color)
				else
					new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
				victim.bleed(blood_bled)
			if(20 to INFINITY)
				victim.visible_message("<span class='danger'>[victim] закашливывается и сплёвывает кучу крови из [victim.ru_ego()] грудной клетки!</span>", "<span class='danger'><b>Вы обильно кашляете и сплёвываете кучу крови из своей грудной клетки!</b></span>", vision_distance=COMBAT_MESSAGE_RANGE)
				victim.bleed(blood_bled)
				if(ishuman(victim))
					var/mob/living/carbon/human/H = victim
					new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir, H.dna.species.exotic_blood_color)
				else
					new /obj/effect/temp_visual/dir_setting/bloodsplatter(victim.loc, victim.dir)
				victim.add_splatter_floor(get_step(victim.loc, victim.dir))


/datum/wound/blunt/get_examine_description(mob/user)
	if(!limb.current_gauze && !gelled && !taped)
		return ..()

	var/list/msg = list()
	if(!limb.current_gauze)
		msg += "[victim.ru_ego(TRUE)] [limb.ru_name] [examine_desc]"
	else
		var/sling_condition = ""
		// how much life we have left in these bandages
		switch(limb.current_gauze.obj_integrity / limb.current_gauze.max_integrity * 100)
			if(0 to 25)
				sling_condition = "слабо "
			if(25 to 50)
				sling_condition = "частично "
			if(50 to 75)
				sling_condition = "обильно "
			if(75 to INFINITY)
				sling_condition = "туго "

		msg += "[victim.ru_ego(TRUE)] [limb.ru_name] [sling_condition] перевязана жгутом из [limb.current_gauze.name]"

	if(taped)
		msg += ", <span class='notice'>и, похоже, восстанавливается после обработки хирургической лентой!</span>"
	else if(gelled)
		msg += ", <span class='notice'>и покрыта шипящим костным гелем синеватого оттенка!</span>"
	else
		msg +=  "!"
	return "<B>[msg.Join()]</B>"

/*
	New common procs for /datum/wound/blunt/
*/

/datum/wound/blunt/proc/update_inefficiencies()
	if(limb.body_zone in list(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG))
		if(limb.current_gauze)
			limp_slowdown = initial(limp_slowdown) * limb.current_gauze.splint_factor
		else
			limp_slowdown = initial(limp_slowdown)
		victim.apply_status_effect(STATUS_EFFECT_LIMP)
	else if(limb.body_zone in list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		if(limb.current_gauze)
			interaction_efficiency_penalty = 1 + ((interaction_efficiency_penalty - 1) * limb.current_gauze.splint_factor)
		else
			interaction_efficiency_penalty = interaction_efficiency_penalty

	if(initial(disabling))
		disabling = !limb.current_gauze

	limb.update_wounds()

/*
	Moderate (Joint Dislocation)
*/

/datum/wound/blunt/moderate
	name = "Joint Dislocation"
	ru_name = "Вывих"
	ru_name_r = "вывиха"
	desc = "Кость пациента неестественно выгнулась, что вызывает болевые ощущения и ухудшает моторику."
	treat_text = "Использовать костоправ. В крайнем случае возможно, но не рекомендуется вправление конечности своими силами с помощью агрессивного захвата."
	examine_desc = "неестественно вывихнута"
	occur_text = "сильно дергается, издавая хруст"
	severity = WOUND_SEVERITY_MODERATE
	viable_zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	interaction_efficiency_penalty = 1.8
	limp_slowdown = 1.3
	threshold_minimum = 35
	threshold_penalty = 13
	treatable_tool = TOOL_BONESET
	wound_flags = (BONE_WOUND)
	status_effect_type = /datum/status_effect/wound/blunt/moderate
	scar_keyword = "bluntmoderate"

/datum/wound/blunt/moderate/crush()
	if(prob(33))
		victim.visible_message("<span class='danger'>Вывихнутая [limb.ru_name] персонажа [victim] возвращается на место!</span>", "<span class='userdanger'>Ваша вывихнутая [limb.ru_name] возвращается на место! Ау!</span>")
		remove_wound()

/datum/wound/blunt/moderate/try_handling(mob/living/carbon/human/user)
	if(user.pulling != victim || user.zone_selected != limb.body_zone || user.a_intent == INTENT_GRAB)
		return FALSE

	if(user.grab_state == GRAB_PASSIVE)
		to_chat(user, "<span class='warning'>Необходимо взять персонажа [victim] в агрессивный захват с целью дальнейших манипуляций с [victim.ru_ego()] конечностью!</span>")
		return TRUE

	if(user.grab_state >= GRAB_AGGRESSIVE)
		user.visible_message("<span class='danger'>[user] начинает впралять вывих на [limb.ru_name_v] - персонажа [victim]!</span>", "<span class='notice'>Вы начинаете вправлять вывих на [limb.ru_name_v] персонажа [victim]...</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] начинает вправлять вывих на вашей [limb.ru_name_v]!</span>")
		if(user.a_intent == INTENT_HELP)
			chiropractice(user)
		else
			malpractice(user)
		return TRUE

/// If someone is snapping our dislocated joint back into place by hand with an aggro grab and help intent
/datum/wound/blunt/moderate/proc/chiropractice(mob/living/carbon/human/user)
	var/time = base_treat_time

	if(!do_after(user, time, target=victim, extra_checks = CALLBACK(src, .proc/still_exists)))
		return

	if(prob(65))
		user.visible_message("<span class='danger'>[user] вправляет вывих на [limb.ru_name_v] персонажа [victim]!</span>", "<span class='notice'>Вы вправляете вывих на [limb.ru_name_v] персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] вправляет вашу вывих на [limb.ru_name_v] - на место!</span>")
		victim.emote("scream")
		limb.receive_damage(brute=20, wound_bonus=CANT_WOUND)
		qdel(src)
	else
		user.visible_message("<span class='danger'>[user] болезненно выкручивает вывих на [limb.ru_name_v] персонажа [victim].</span>", "<span class='danger'>Вы болезненно выкручиваете вывих на [limb.ru_name_v] персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] болезненно выкручивает вывих на [limb.ru_name_v]!</span>")
		limb.receive_damage(brute=10, wound_bonus=CANT_WOUND)
		chiropractice(user)

/// If someone is snapping our dislocated joint into a fracture by hand with an aggro grab and harm or disarm intent
/datum/wound/blunt/moderate/proc/malpractice(mob/living/carbon/human/user)
	var/time = base_treat_time

	if(!do_after(user, time, target=victim, extra_checks = CALLBACK(src, .proc/still_exists)))
		return

	if(prob(65))
		user.visible_message("<span class='danger'>[user] с резким хрустом вправляет вывих на [limb.ru_name_v] персонажа [victim]!</span>", "<span class='notice'>Вы с резким хрустом вправляете вывих на [limb.ru_name_v] персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] с резким хрустом вправляет вывих на вашей [limb.ru_name_v]!</span>")
		victim.emote("scream")
		limb.receive_damage(brute=25, wound_bonus=30)
	else
		user.visible_message("<span class='danger'>[user] болезненно выкручивает вывих на [limb.ru_name_v] персонажа [victim].</span>", "<span class='danger'>Вы болезненно выкручиваете вывих на [limb.ru_name_v] персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] болезненно выкручивает вывих на вашей [limb.ru_name_v]!</span>")
		limb.receive_damage(brute=10, wound_bonus=CANT_WOUND)
		malpractice(user)


/datum/wound/blunt/moderate/treat(obj/item/I, mob/user)
	if(victim == user)
		victim.visible_message("<span class='danger'>[user] пытается восстановить [victim.ru_ego()] конечность - [limb.ru_name], используя [I].</span>", "<span class='warning'>Вы пытаетесь восстановить свою конечность - [limb.ru_name], используя [I]...</span>")
	else
		user.visible_message("<span class='danger'>[user] пытается восстановить конечность - [limb.ru_name] - персонажа [victim], используя [I].</span>", "<span class='notice'>Вы пытаетесь восстановить конечность - [limb.ru_name] - персонажа [victim], используя [I]...</span>")

	if(!do_after(user, base_treat_time * (user == victim ? 1.5 : 1), target = victim, extra_checks=CALLBACK(src, .proc/still_exists)))
		return

	if(victim == user)
		limb.receive_damage(brute=15, wound_bonus=CANT_WOUND)
		victim.visible_message("<span class='danger'>[user] восстанавливает [victim.ru_ego()] конечность - [limb.ru_name]!</span>", "<span class='userdanger'>Вы восстанавливаете вашу конечность - [limb.ru_name]!</span>")
	else
		limb.receive_damage(brute=10, wound_bonus=CANT_WOUND)
		user.visible_message("<span class='danger'>[user] восстанавливает конечность - [limb.ru_name] - персонажа [victim]!</span>", "<span class='nicegreen'>Вы завершаете восстановление конечности - [limb.ru_name] - персонажа [victim]!</span>", victim)
		to_chat(victim, "<span class='userdanger'>[user] восстанавливает вашу конечность - [limb.ru_name]!</span>")

	victim.emote("scream")
	qdel(src)

/*
	Severe (Hairline Fracture)
*/

/datum/wound/blunt/severe
	name = "Hairline Fracture"
	ru_name = "Перелом"
	ru_name_r = "перелома"
	desc = "Кость пациента сломана. Это вызывает сильные боли и серьёзно ухудшает моторику."
	treat_text = "Хирургическое вмешательство с применением костного геля. Наложение марлевой повязки позволит избежать усугубления ситуации."
	examine_desc = "сильно распухла и покрылась синяками"
	occur_text = "набухает от обломков костей и образует неприятного вида синяк"

	severity = WOUND_SEVERITY_SEVERE
	interaction_efficiency_penalty = 2.5
	limp_slowdown = 3.2
	threshold_minimum = 65
	threshold_penalty = 17
	treatable_by = list(/obj/item/stack/sticky_tape/surgical, /obj/item/stack/medical/bone_gel)
	status_effect_type = /datum/status_effect/wound/blunt/severe
	scar_keyword = "bluntsevere"
	brain_trauma_group = BRAIN_TRAUMA_MILD
	trauma_cycle_cooldown = 1.5 MINUTES
	internal_bleeding_chance = 40
	wound_flags = (BONE_WOUND | ACCEPTS_GAUZE | MANGLES_BONE)

/datum/wound/blunt/critical
	name = "Compound Fracture"
	ru_name = "Открытый перелом"
	ru_name_r = "открытого перелома"
	desc = "Кости пациента получили множественные серьёзные переломы. Конечность, вкупе с сопутствующими невыносимыми болями, практически не функционирует."
	treat_text = "Немедленная фиксация конечности с последующим хирургическим вмешательством."
	examine_desc = "изуродована и раздроблена, держась только благодаря тканям"
	occur_text = "надламывается, из-за чего кости выходят наружу"

	severity = WOUND_SEVERITY_CRITICAL
	interaction_efficiency_penalty = 6
	limp_slowdown = 6.5
	sound_effect = 'sound/effects/wounds/crack2.ogg'
	threshold_minimum = 115
	threshold_penalty = 25
	disabling = TRUE
	treatable_by = list(/obj/item/stack/sticky_tape/surgical, /obj/item/stack/medical/bone_gel)
	status_effect_type = /datum/status_effect/wound/blunt/critical
	scar_keyword = "bluntcritical"
	brain_trauma_group = BRAIN_TRAUMA_SEVERE
	trauma_cycle_cooldown = 2.5 MINUTES
	internal_bleeding_chance = 60
	wound_flags = (BONE_WOUND | ACCEPTS_GAUZE | MANGLES_BONE)

// doesn't make much sense for "a" bone to stick out of your head
/datum/wound/blunt/critical/apply_wound(obj/item/bodypart/L, silent, datum/wound/old_wound, smited)
	if(L.body_zone == BODY_ZONE_HEAD && severity == WOUND_SEVERITY_CRITICAL)
		occur_text = "раскалывается, обнажая сквозь пелену крови и плоти потрескавшийся череп"
		examine_desc = "имеет выемку, из которой торчат куски черепа"
	. = ..()

/// if someone is using bone gel on our wound
/datum/wound/blunt/proc/gel(obj/item/stack/medical/bone_gel/I, mob/user)
	if(gelled)
		to_chat(user, "<span class='warning'>[user == victim ? "Ваша [limb.ru_name]" : "[limb.ru_name_capital] персонажа [victim]"] уже покрыта костным гелем!</span>")
		return

	user.visible_message("<span class='danger'>[user] пытаетесь нанести [I] на конечность - [limb.ru_name] - персонажа [victim]...</span>", "<span class='warning'>Вы пытаетесь нанести [I] на [user == victim ? "вашу конечность - [limb.ru_name]" : "конечность - [limb.ru_name] - персонажа [victim]"].</span>")

	if(!do_after(user, base_treat_time * 1.5 * (user == victim ? 1.5 : 1), target = victim, extra_checks=CALLBACK(src, .proc/still_exists)))
		return

	I.use(1)
	victim.emote("scream")
	if(user != victim)
		user.visible_message("<span class='notice'>[user] с шипящим звуком наносит [I] на конечность - [limb.ru_name] - персонажа [victim]!</span>", "<span class='notice'>Вы наносите [I] на конечность - [limb.ru_name] - персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='userdanger'>[user] наносит [I] на вашу на конечность - [limb.ru_name]. Вы чувствуете, как ваши кости болезнено хрустят, срастаясь и перестриваясь.</span>")
	else
		var/painkiller_bonus = 0
		if(victim.drunkenness)
			painkiller_bonus += 5
		if(victim.reagents?.has_reagent(/datum/reagent/medicine/morphine))
			painkiller_bonus += 10
		if(victim.reagents?.has_reagent(/datum/reagent/determination))
			painkiller_bonus += 5

		if(prob(25 + (20 * severity - 2) - painkiller_bonus)) // 25%/45% chance to fail self-applying with severe and critical wounds, modded by painkillers
			victim.visible_message("<span class='danger'>[victim] проваливается с нанесением [I] на [victim.ru_ego()] конечность - [limb.ru_name]!</span>", "<span class='notice'>Вы дергаетесь от боли, не в силах нанести [I] на вашу конечность [limb.ru_name]!</span>")
			victim.AdjustUnconscious(5 SECONDS)
			return
		victim.visible_message("<span class='notice'>[victim] неудачно наносит [I] на [victim.ru_ego()] конечность -  [limb.ru_name]!</span>", "<span class='notice'>Вы пытаетесь нанести [I] на вашу конечность - [limb.ru_name], ваши кости изнывают от боли!</span>")

	limb.receive_damage(30, stamina=100, wound_bonus=CANT_WOUND)
	if(!gelled)
		gelled = TRUE

/// if someone is using surgical tape on our wound
/datum/wound/blunt/proc/tape(obj/item/stack/sticky_tape/surgical/I, mob/user)
	if(!gelled)
		to_chat(user, "<span class='warning'>[user == victim ? "Ваша [limb.ru_name]" : "[limb.ru_name_capital] персонажа [victim]"] должна быть покрыта костным гелем прежде, чем вы приступите к этой операции!</span>")
		return
	if(taped)
		to_chat(user, "<span class='warning'>[user == victim ? "Ваша [limb.ru_name]" : "[limb.ru_name_capital] персонажа [victim]"] уже обработана с помощью [I.name] и восстанавливается!</span>")
		return

	user.visible_message("<span class='danger'>[user] пытается нанести [I] на конечность - [limb.ru_name] - персонажа [victim]...</span>", "<span class='warning'>Вы пытаетесь нанести [I] на [user == victim ? "свою конечность - [limb.ru_name]" : "конечность персонажа [victim] - [limb.ru_name]"]...</span>")

	if(!do_after(user, base_treat_time * (user == victim ? 1.5 : 1), target = victim, extra_checks=CALLBACK(src, .proc/still_exists)))
		return

	regen_points_current = 0
	regen_points_needed = 30 SECONDS * (user == victim ? 1.5 : 1) * (severity - 1)
	I.use(1)
	if(user != victim)
		user.visible_message("<span class='notice'>[user] с шипящим звуком наносит [I] на конечность - [limb.ru_name] - персонажа [victim]!</span>", "<span class='notice'>Вы наносите [I] на конечность - [limb.ru_name] - персонажа [victim]!</span>", ignored_mobs=victim)
		to_chat(victim, "<span class='green'>[user] наносит [I] на вашу конечность - [limb.ru_name], в результате чего ощущаете, как ваши кости начинают срастаться!</span>")
	else
		victim.visible_message("<span class='notice'>[victim] наносит [I] на [victim.ru_ego()] конечность - [limb.ru_name]!</span>", "<span class='green'>Вы наносите [I] на конечность - [limb.ru_name], в результате чего ощущаете, как ваши кости начинают срастаться!</span>")

	taped = TRUE
	processes = TRUE

/datum/wound/blunt/treat(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/medical/bone_gel))
		gel(I, user)
	else if(istype(I, /obj/item/stack/sticky_tape/surgical))
		tape(I, user)

/datum/wound/blunt/get_scanner_description(mob/user)
	. = ..()

	. += "<div class='ml-3'>"

	if(!gelled)
		. += "Альтернативное лечение: Нанести костный гель прямо на поврежденную конечность, после чего перевязать её хирургической лентой. Рекомендуется применять в экстренных ситуациях, ввиду медлительности и болезненности данной процедуры.\n"
	else if(!taped)
		. += "<span class='notice'>Продолжайте альтернативное лечение: Нанесите хирургическое ленту прямо на поврежденную конечность. Стоит учесть: эта процедура болезненна и медленна.</span>\n"
	else
		. += "<span class='notice'>Уточнение: Восстановление костей началось. Кости восстановились на [round(regen_points_current*100/regen_points_needed)]%.</span>\n"

	if(limb.body_zone == BODY_ZONE_HEAD && severity == WOUND_SEVERITY_CRITICAL)
		. += "Обнаружена черепно-мозговая травма: Пациент будет испытывать неконтроллируемые [severity == WOUND_SEVERITY_CRITICAL ? "приступы средней тяжести" : "тяжелые приступы"] до того момента, как кости будут восстановлены."
	else if(limb.body_zone == BODY_ZONE_CHEST && victim.blood_volume)
		. += "Обнаружена травма грудной клетки: Последующие повреждения будут усиливать внутреннее кровотечения до того момента, пока кости не будут восстановлены."
	. += "</div>"
