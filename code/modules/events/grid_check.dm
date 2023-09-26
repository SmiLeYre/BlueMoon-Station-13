/datum/round_event_control/grid_check
	name = "Grid Check"
	typepath = /datum/round_event/grid_check
	weight = 25
	max_occurrences = 2
	category = EVENT_CATEGORY_ENGINEERING
	description = "Turns off all APCs for a while, or until they are manually rebooted."

/datum/round_event/grid_check
	announce_when	= 1
	start_when = 1

/datum/round_event/grid_check/announce(fake)
	priority_announce("Обнаружена аномальная активность в энергосети [station_name()]. В качестве меры предосторожности электропитание станции будет отключено на неопределенный срок.", "Критический Сбой Питания", ANNOUNCER_POWEROFF)


/datum/round_event/grid_check/start()
	power_fail(30, 120)
