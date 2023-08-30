/datum/round_event_control/electrical_storm
	name = "Electrical Storm"
	typepath = /datum/round_event/electrical_storm
	earliest_start = 15 MINUTES
	min_players = 15
	weight = 25
	max_occurrences = 2
	alert_observers = FALSE
	category = EVENT_CATEGORY_JANITORIAL

/datum/round_event/electrical_storm
	var/lightsoutAmount	= 1
	var/lightsoutRange	= 25
	announce_when	= 1

/datum/round_event/electrical_storm/announce(fake)
	if(prob(50))
		priority_announce("В вашем районе была обнаружена Электрическая Буря. Пожалуйста, устраните возможные перегрузки Осветительных Приборов.", "Предупреждение об Электрическом Шторме")
	else
		print_command_report("В вашем районе была обнаружена Электрическая Буря. Пожалуйста, устраните возможные перегрузки Осветительных Приборов.", "Предупреждение об Электрическом Шторме")

/datum/round_event/electrical_storm/start()
	var/list/epicentreList = list()

	for(var/i=1, i <= lightsoutAmount, i++)
		var/turf/T = find_safe_turf()
		if(istype(T))
			epicentreList += T

	if(!epicentreList.len)
		return

	for(var/centre in epicentreList)
		for(var/a in GLOB.apcs_list)
			var/obj/machinery/power/apc/A = a
			if(get_dist(centre, A) <= lightsoutRange)
				A.overload_lighting()

	//BLUEMOON ADD START - уничтожение противометеоритных спутников
	var/satellties_count = 0
	for(var/obj/machinery/satellite/satellite in GLOB.meteor_satellites)
		if(satellties_count >= 2)
			break
		if(satellite.active)
			satellties_count++
			satellite.malfunction()
	//BLUEMOON ADD START
