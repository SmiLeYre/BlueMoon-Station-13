/datum/round_event_control/bureaucratic_error
	name = "Bureaucratic Error"
	typepath = /datum/round_event/bureaucratic_error
	max_occurrences = 2
	weight = 45
	category = EVENT_CATEGORY_BUREAUCRATIC

/datum/round_event/bureaucratic_error
	announce_when = 1

/datum/round_event/bureaucratic_error/announce(fake)
	priority_announce("Недавняя бюрократическая ошибка в Департаменте Органических Ресурсов может привести к кадровой нехватке в одних департаментах и избыточному укомплектованию штатов в других.", "Бюрократическая Тревога")

/datum/round_event/bureaucratic_error/start()
	SSjob.set_overflow_role(pick(get_all_jobs()))
