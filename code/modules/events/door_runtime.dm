/datum/round_event_control/door_runtime
	name = "Door Runtime"
	typepath = /datum/round_event/door_runtime
	max_occurrences = 1
	min_players = 10
	weight = 50
	category = EVENT_CATEGORY_AI

/datum/round_event/door_runtime

/datum/round_event/door_runtime/announce()
	priority_announce("Вредоносное программное обеспечение обнаружено в системе контроля шл+юзов. Задействованы протоколы изоляции. Пожалуйста, сохраняйте спокойствие.", "ВНИМАНИЕ: УЯЗВИМОСТЬ СЕТИ.")

/datum/round_event/door_runtime/start()
	for(var/obj/machinery/door/D in GLOB.airlocks)
		if(!is_station_level(D.z))
			continue
		INVOKE_ASYNC(D, TYPE_PROC_REF(/obj/machinery/door, hostile_lockdown))
		addtimer(CALLBACK(D, TYPE_PROC_REF(/obj/machinery/door, disable_lockdown)), 90 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(reboot)), 90 SECONDS)
	var/obj/machinery/computer/communications/C = locate() in GLOB.machines
	if(C)
		C.post_status("alert", "lockdown")

/datum/round_event/door_runtime/proc/reboot()
	priority_announce("Автоматическая перезагрузка системы завершена. Хорошего вам дня.","ПЕРЕЗАГРУЗКА СЕТИ:")
