#define TIME_BLOODSUCKER_DAY_WARN	90 		// 1.5 minutes
#define TIME_BLOODSUCKER_DAY_FINAL_WARN	25 	// 25 sec
#define TIME_BLOODSUCKER_DAY	90 			// 1.5 minutes // 10 is a second, 600 is a minute.
#define TIME_BLOODSUCKER_BURN_INTERVAL	40 	// 4 sec


// Over Time, tick down toward a "Solar Flare" of UV buffeting the station. This period is harmful to vamps.
/obj/effect/sunlight
	//var/amDay = FALSE
	var/amDay = FALSE
	var/time_til_cycle = 0
	var/nighttime_duration = 900 //15 Minutes
	var/issued_XP = FALSE

/obj/effect/sunlight/Initialize(mapload)
	start_countdown() // BLUEMOON ADD
	. = ..()

/obj/effect/sunlight/proc/start_countdown()
	START_PROCESSING(SSprocessing, src) // BLUEMOON EDIT - было SSweather, что создаёт рантаймы
	time_til_cycle = nighttime_duration

// BLUEMOON ADD START
/obj/effect/sunlight/Destroy(force)
	STOP_PROCESSING(SSprocessing, src)
	. = ..()
// BLUEMOON ADD END

/* BLUEMOON REMOVAL START
/obj/effect/sunlight/process()
	// Update all Bloodsucker sunlight huds
	for(var/datum/mind/M in SSticker.mode.bloodsuckers)
		if(!istype(M) || !istype(M.current))
			continue
		var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		if(istype(bloodsuckerdatum))
			bloodsuckerdatum.update_sunlight(max(0, time_til_cycle), amDay) // This pings all HUDs
	time_til_cycle--
	if(amDay)
		if(time_til_cycle > 0 && time_til_cycle % 4 == 0)
			punish_vamps()
			give_home_power()
			if(!issued_XP && time_til_cycle <= 5)
				issued_XP = TRUE
				// Cycle through all vamp antags and check if they're inside a closet.
				for(var/datum/mind/M in SSticker.mode.bloodsuckers)
					if(!istype(M) || !istype(M.current))
						continue
					// BLUEMOON ADD START
					/* - временно убрано, чтобы не слишком сильно душить вампиров
					if(!istype(M.current.loc, /obj/structure/closet/crate/coffin))
						to_chat(M, span_userdanger("Чтобы повышать своё поколение, днём нужно спать в гробу. Ты останешься слабым, если не приспособишься."))
						continue
					*/
					// BLUEMOON ADD END
					var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
					if(istype(bloodsuckerdatum))
						bloodsuckerdatum.RankUp()	// Rank up! Must still be in a coffin to level!


		// BLUEMOON ADD START - фикс резкого пропуска фазы дня
		if(!(time_til_cycle < 0))
			return
		// BLUEMOON ADD END

		warn_daylight(5,"<span class = 'cult'>Солнечные вспышки окончились, и угроза дневного света прошла... на какое то время.</span>",\
						"<span class = 'cult'>Солнечные вспышки окончились, и угроза дневного света прошла... на какое то время.</span>")
		amDay = FALSE
		issued_XP = FALSE
		for(var/datum/mind/M in SSticker.mode.bloodsuckers)
			if(!istype(M) || !istype(M.current))
				continue
			var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
			if(!istype(bloodsuckerdatum))
				continue
			// Reset Warnings
			bloodsuckerdatum.warn_sun_locker = FALSE
			bloodsuckerdatum.warn_sun_burn = FALSE
			// Remove Dawn Powers
			for(var/datum/action/cooldown/bloodsucker/P in bloodsuckerdatum.powers)
				if(istype(P, /datum/action/cooldown/bloodsucker/gohome))
					bloodsuckerdatum.powers -= P
					P.Remove(M.current)
		nighttime_duration += 100 //Each day makes the night a minute longer.
		time_til_cycle = nighttime_duration
		message_admins("ВАМПИРСКОЕ НАПОМИНАНИЕ: Дневное время закончилось. Сброс на Ночное время. (Продлится [nighttime_duration / 60] минут.)")
	else
		switch(time_til_cycle)
			if(TIME_BLOODSUCKER_DAY_WARN)
				//sleep(TIME_BLOODSUCKER_NIGHT - TIME_BLOODSUCKER_DAY_WARN)
				warn_daylight(1,"<span class = 'cult'>Солнечные вспышки обрушат на станцию опасное УФ излучение через [TIME_BLOODSUCKER_DAY_WARN / 60] минут. <b>Приготовьтесь искать укрытие в гробу или шкафах.</b></span>")  // time2text <-- use Help On
				give_home_power() // Give VANISHING ACT power to all vamps with a lair!
			if(TIME_BLOODSUCKER_DAY_FINAL_WARN)
				message_admins("ВАМПИРСКОЕ НАПОМИНАНИЕ: Дневное время начнётся через [TIME_BLOODSUCKER_DAY_FINAL_WARN] секунд.")
				warn_daylight(2,"<span class = 'userdanger'>Солнечные вспышки скоро обрушатся на станцию! У вас есть [TIME_BLOODSUCKER_DAY_FINAL_WARN] секунд чтобы найти укрытие!</span>",\
								"<span class = 'cult'>Через [TIME_BLOODSUCKER_DAY_FINAL_WARN / 10], ваш хозяин будет под опасностью солнечных вспышек. Убедитесь что хозяин нашел укрытие!</span>")
			if(5)
				warn_daylight(3,"<span class = 'userdanger'>Ищи укрытие, нечисть, ибо Светочь восстаёт!</span>")
			if(0)
				warn_daylight(4,"<span class = 'userdanger'>Солнечные вспышки обрушились на станцию смертельное ультрафиолетовое излучение!</span><br><span class = ''>Оставайтесь в укрытии [TIME_BLOODSUCKER_DAY / 60] минут или рискуете встретить Окончательную Смерть!</span>",\
								"<span class = 'cult'>Солнечные вспышки обрушивают на станцию ультрафиолетовое излучение!</span>")
				amDay = TRUE
				message_admins("ВАМПИРСКОЕ НАПОМИНАНИЕ: Дневное время началось и продлится [TIME_BLOODSUCKER_DAY / 60] минут.")
				time_til_cycle = TIME_BLOODSUCKER_DAY
/ BLUEMOON REMOVAL END */

// BLUEMOON ADD START - переписываем процесс дня. Оставляю здесь для облегчения поиска и отслеживания изменений
/obj/effect/sunlight/process()
	// Update all Bloodsucker sunlight huds
	for(var/datum/mind/M in SSticker.mode.bloodsuckers)
		if(!istype(M) || !istype(M.current))
			continue
		var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		if(istype(bloodsuckerdatum))
			bloodsuckerdatum.update_sunlight(max(0, time_til_cycle), amDay) // This pings all HUDs
	time_til_cycle--
	if(time_til_cycle <= 0)
		for(var/datum/mind/M in SSticker.mode.bloodsuckers)
			if(!istype(M) || !istype(M.current))
				continue
			var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
			if(istype(bloodsuckerdatum))
				bloodsuckerdatum.RankUp()	// Rank up! Must still be in a coffin to level!
		give_home_power()
		time_til_cycle = nighttime_duration
		warn_daylight(5,"<span class = 'cult'>Вы пережили очередной цикл. Сила растёт!</span>",\
							"<span class = 'cult'>Очередной цикл прошёл, ваш владыка стал сильнее!</span>")

// BLUEMOON ADD END

/obj/effect/sunlight/proc/warn_daylight(danger_level =0, vampwarn = "", vassalwarn = "")
	for(var/datum/mind/M in SSticker.mode.bloodsuckers)
		if(!istype(M))
			continue
		to_chat(M,vampwarn)
		if(M.current)
			if(danger_level == 1)
				M.current.playsound_local(null, 'sound/chatter/griffin_3.ogg', 50 + danger_level, 1)
			else if(danger_level == 2)
				M.current.playsound_local(null, 'sound/chatter/griffin_5.ogg', 50 + danger_level, 1)
			else if(danger_level == 3)
				M.current.playsound_local(null, 'sound/misc/alerts/alert.ogg', 75, 1)
			else if(danger_level == 4)
				M.current.playsound_local(null, 'sound/ambience/ambimystery.ogg', 100, 1)
			else if(danger_level == 5)
				M.current.playsound_local(null, 'sound/spookoween/ghosty_wind.ogg', 90, 1)

	if(vassalwarn != "")
		for(var/datum/mind/M in SSticker.mode.vassals)
			if(!istype(M))
				continue
			to_chat(M,vassalwarn)


/obj/effect/sunlight/proc/punish_vamps()
	// Cycle through all vamp antags and check if they're inside a closet.
	for(var/datum/mind/M in SSticker.mode.bloodsuckers)
		if(!istype(M) || !istype(M.current))
			continue
		var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		if(!istype(bloodsuckerdatum))
			continue
		// Closets offer SOME protection
		if(istype(M.current.loc, /obj/structure))
			// Coffins offer the BEST protection
			if(istype(M.current.loc, /obj/structure/closet/crate/coffin))
				SEND_SIGNAL(M.current, COMSIG_ADD_MOOD_EVENT, "vampsleep", /datum/mood_event/coffinsleep)
				continue
			else
				if(!bloodsuckerdatum.warn_sun_locker)
					to_chat(M, "<span class='warning'>Ваша кожа обжигается. [M.current.loc] не очень хорошо защищает от ультрафиолетового излучения.</span>")
					bloodsuckerdatum.warn_sun_locker = TRUE
				M.current.adjustFireLoss(0.5 + bloodsuckerdatum.bloodsucker_level / 2) // M.current.fireloss += 0.5 + bloodsuckerdatum.bloodsucker_level / 2  //  Do DIRECT damage. Being spaced was causing this to not occur. setFireLoss(bloodsuckerdatum.bloodsucker_level)
				M.current.updatehealth()
				SEND_SIGNAL(M.current, COMSIG_ADD_MOOD_EVENT, "vampsleep", /datum/mood_event/daylight_1)
		// Out in the Open? Buh Bye
		else
			if(!bloodsuckerdatum.warn_sun_burn)
				if(bloodsuckerdatum.bloodsucker_level > 0)
					to_chat(M, "<span class='userdanger'>Солнечные вспышки поджигают твою плоть!</span>")
				else
					to_chat(M, "<span class='userdanger'>Солнечные вспышки обожгли твою неофитовую кожу!</span>")
				bloodsuckerdatum.warn_sun_burn = TRUE
			if(M.current.fire_stacks <= 0)
				M.current.fire_stacks = 0
			if(bloodsuckerdatum.bloodsucker_level > 0)
				M.current.adjust_fire_stacks(0.2 + bloodsuckerdatum.bloodsucker_level / 10)
				M.current.IgniteMob()
			M.current.adjustFireLoss(2 + bloodsuckerdatum.bloodsucker_level) // M.current.fireloss += 2 + bloodsuckerdatum.bloodsucker_level   //  Do DIRECT damage. Being spaced was causing this to not occur.  //setFireLoss(2 + bloodsuckerdatum.bloodsucker_level)
			M.current.updatehealth()
			SEND_SIGNAL(M.current, COMSIG_ADD_MOOD_EVENT, "vampsleep", /datum/mood_event/daylight_2)

/obj/effect/sunlight/proc/give_home_power()
	// It's late...! Give the "Vanishing Act" gohome power to bloodsuckers.
	for(var/datum/mind/M in SSticker.mode.bloodsuckers)
		if(!istype(M) || !istype(M.current))
			continue
		var/datum/antagonist/bloodsucker/bloodsuckerdatum = M.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		if(istype(bloodsuckerdatum) && bloodsuckerdatum.lair && !(locate(/datum/action/cooldown/bloodsucker/gohome) in bloodsuckerdatum.powers))
			bloodsuckerdatum.BuyPower(new /datum/action/cooldown/bloodsucker/gohome)
