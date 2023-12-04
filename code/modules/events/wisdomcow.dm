/datum/round_event_control/wisdomcow
	name = "Wisdom cow"
	typepath = /datum/round_event/wisdomcow
	max_occurrences = 2
	weight = 50
	category = EVENT_CATEGORY_FRIENDLY

/datum/round_event/wisdomcow/announce(fake)
	priority_announce("В этом районе была замечена мудрая корова. Обязательно спросите у нее совета.", "Агентство NanoTrasen по Разведению Коров")

/datum/round_event/wisdomcow/start()
	var/turf/targetloc = get_safe_random_station_turf() //BLUEMOON CHANGES (WAS - get_random_station_turf)
	new /mob/living/simple_animal/cow/wisdom(targetloc)
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(1, targetloc)
	smoke.start()
