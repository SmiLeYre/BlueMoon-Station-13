/datum/round_event_control/anomaly/anomaly_pyro
	name = "Anomaly: Pyroclastic"
	typepath = /datum/round_event/anomaly/anomaly_pyro

	min_players = 20
	max_occurrences = 2
	weight = 25
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/anomaly_pyro
	start_when = 3
	announce_when = 10
	anomaly_path = /obj/effect/anomaly/pyro

/datum/round_event/anomaly/anomaly_pyro/announce(fake)
	priority_announce("Пирокластическая аномалия обнаружена на сканерах большой дальности. Ожидаемое место: [impact_area.name].", "Аномальная тревога", has_important_message = TRUE)
