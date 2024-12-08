/*
****************************************
// Modular Supermatter Delaminations! //
****************************************
The Problems:
• Staff manually delete the supermatter, because...
• Supermatter explosions are so frequent, and so large that people don't want to fix it.
Our Solutions:
• Make all supermatter explosions respect the bombcap, to prevent it annihilating a third of the station.
• Remove the tesla and singularity delaminations, because lets face it, staff would never allow it...
• Gauge prospective interest in fixing the supermatter, and scale damage based on how willing the crew is to fix the damage.
Our Method:
• Override the supermatter's explode() proc to respect the bombcap.
• Scan through the player list an count how many alive engineers are there. If you sign up as an engineer, you consent to fixing the damage.
*/

#define EXPLOSION_MODIFIER_SMALL 1
#define EXPLOSION_MODIFIER_MEDIUM 2
#define EXPLOSION_MODIFIER_LARGE 3

// Check if the SM Can explode at all or not
/proc/check_sm_delam()
	switch(GLOB.delam_override)
		if(TRUE)
			return TRUE
		if(FALSE)
			return FALSE

	var/cooldown_sm = CONFIG_GET(number/sm_delamination_cooldown)

	// If fully disabled
	if(cooldown_sm == -1)
		return FALSE

	// Check if the cooldown is still active
	if(!rustg_file_exists("data/last_sm_delam.txt"))
		return TRUE
	var/last_sm_delam = text2num(rustg_file_read("data/last_sm_delam.txt"))
	if(GLOB.round_id > last_sm_delam + cooldown_sm)
		return TRUE
	return FALSE

// Proc to log the round in which the sm or another engine goes boom
/proc/write_sm_delam()
	rustg_file_write("data/last_sm_delam.txt", "[GLOB.round_id]")

// Let's turn the base explosion power down a little...
/obj/machinery/power/supermatter_crystal
	explosion_power = 240
/obj/machinery/power/supermatter_crystal/shard
	explosion_power = 120

// Proc to screen the mob list for engineers. We'll need this later!
/proc/count_alive_engineers(mob/M)
	if(!istype(M) || isobserver(M))
		return FALSE
	if(M.stat != DEAD && M.mind && (M.mind.assigned_role in GLOB.engineering_positions))
		return TRUE

/obj/item/debug/engineer_counter
	name = "magical engineer counter"
	icon = 'icons/obj/guns/magic.dmi'
	icon_state = "nothingwand"

/obj/item/debug/engineer_counter/attack_self(mob/user)
	var/alive_engineers = 0
	for(var/mob/living/carbon/human/M in GLOB.alive_mob_list)
		if(count_alive_engineers(M))
			alive_engineers++
	priority_announce("На станции присутствует [alive_engineers] живых инженеров!", "А сколько у нас инженеров?")

/obj/machinery/power/supermatter_crystal/explode()
	for(var/mob in GLOB.alive_mob_list)
		var/mob/living/L = mob
		if(istype(L) && L.z == z)
			if(ishuman(mob))
				//Hilariously enough, running into a closet should make you get hit the hardest.
				var/mob/living/carbon/human/H = mob
				H.hallucination += max(50, min(300, DETONATION_HALLUCINATION * sqrt(1 / (get_dist(mob, src) + 1)) ) )
			var/rads = DETONATION_RADS * sqrt( 1 / (get_dist(L, src) + 1) )
			L.rad_act(rads)

// Handle the mood event.
	var/turf/T = get_turf(src)
	for(var/mob/M in GLOB.player_list)
		if(M.z == z)
			SEND_SOUND(M, 'sound/magic/charge.ogg')
			to_chat(M, "<span class='boldannounce'>Вы чувствуете, как реальность на мгновение искажается...</span>")
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "delam", /datum/mood_event/delam)

// Don't explode if we no allow
	if(!check_sm_delam())
		investigate_log("has attempted a delamination, but the config disallows it", INVESTIGATE_SUPERMATTER)
		priority_announce("Симуляция Суперматерии отозвана. Текущий экипаж признан неподходящим для работы с двигателями повышенной опасности. Вам надо тренироваться.", "ОТКЛЮЧЕНИЕ СИМУЛЯЦИИ")
		var/skill_issue_sound = pick('modular_splurt/sound/voice/boowomp.ogg', 'modular_splurt/sound/effects/fart_reverb.ogg')
		sound_to_playing_players(skill_issue_sound)
		var/turf/plush_turf = get_turf(src)
		var/obj/item/toy/plush/random/plushe = new(plush_turf)
		plushe = locate(/obj/item/toy/plush) in plush_turf
		plushe?.name = "Consolation plushie"
		plushe?.desc = "It has \"You tried\" poorly written in its tag."
		plushe?.squeak_override = list(skill_issue_sound = 1)
		plushe?.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF | FREEZE_PROOF
		qdel(src)
		return

// Log if it explodes
	write_sm_delam()

// Ахуй.
	if(combined_gas > MOLE_PENALTY_THRESHOLD)
		investigate_log("has collapsed into a singularity.", INVESTIGATE_SUPERMATTER)
		if(T) //If something fucks up we blow anyhow. This fix is 4 years old and none ever said why it's here. help.
			var/obj/singularity/S = new(T)
			S.energy = 800
			S.consume(src)
			return //No boom for me sir
	else if(power > POWER_PENALTY_THRESHOLD)
		investigate_log("has spawned additional energy balls.", INVESTIGATE_SUPERMATTER)
		if(T)
			var/obj/singularity/energy_ball/E = new(T)
			E.energy = power

// Grab the mob list and count the amount of engineers there are.
	var/alive_engineers = 0
	for(var/mob/living/carbon/human/M in GLOB.alive_mob_list)
		if(count_alive_engineers(M))
			alive_engineers++
	switch(alive_engineers)

//	DELAMINATION B: Too few engineers, minimal explosion.
		if(0)
			investigate_log("has delaminated, but there are only [alive_engineers] engineers! Defaulting to minimum explosion.", INVESTIGATE_SUPERMATTER)
			priority_announce("Обнаружено расслоение структуры Суперматерии. Гиперструктура кристалла разрушилась в пределах допустимого уровня безопасности, что привело к самоаннигиляции сверхматериального образования.", "BНИМАНИЕ: СУПЕРМАТЕРИЯ ПОТЕРЯНА!")
			explosion(get_turf(src), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.05), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.1), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.2), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.3), TRUE, TRUE, ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.3))
			qdel(src)
			return
//	DELAMINATION C: Enough engineers, halved explosion size.
		if(1)
			investigate_log("has delaminated with [alive_engineers] engineers, explosion size has been halved!", INVESTIGATE_SUPERMATTER)
			priority_announce("Обнаружено множественное расслоение структуры Суперматерии. Гиперструктура кристалла завершила коллапс фатально. Bозможны жертвы.", "BНИМАНИЕ: СУПЕРМАТЕРИЯ ПОТЕРЯНА!")
			explosion(get_turf(src), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM * 0.05), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM * 0.1), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM * 0.2), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM * 0.3), TRUE, TRUE, ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM * 0.3))
			qdel(src)
			return
//	DELAMINATION D:
		if(2 to INFINITY)
			investigate_log("has delaminated with full effect due to there being [alive_engineers] engineers.", INVESTIGATE_SUPERMATTER)
			priority_announce("Обнаружено катастрофическое расслоение структуры Суперматерии. Гиперструктура кристалла создала катастрофический хлопок.", sender_override="BНИМАНИЕ: СУПЕРМАТЕРИЯ ПОТЕРЯНА!")
			explosion(get_turf(src), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE * 0.05), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE * 0.1), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE * 0.2), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE * 0.3), TRUE, TRUE, ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE * 0.3))
			qdel(src)
			return
		if(null)
			investigate_log("has delaminated, but there are only [alive_engineers] engineers! Defaulting to minimum explosion.", INVESTIGATE_SUPERMATTER)
			priority_announce("Обнаружено расслоение структуры Суперматерии. Гиперструктура кристалла разрушилась в пределах допустимого уровня безопасности, что привело к самоаннигиляции сверхматериального образования.", "BНИМАНИЕ: СУПЕРМАТЕРИЯ ПОТЕРЯНА!")
			explosion(get_turf(src), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.05), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.1), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.2), ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.3), TRUE, TRUE, ((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL * 0.3))
			qdel(src)
			return

#undef EXPLOSION_MODIFIER_SMALL
#undef EXPLOSION_MODIFIER_MEDIUM
#undef EXPLOSION_MODIFIER_LARGE
