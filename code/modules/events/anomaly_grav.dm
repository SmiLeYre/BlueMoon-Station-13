/datum/round_event_control/anomaly/anomaly_grav
	name = "Anomaly: Gravitational"
	typepath = /datum/round_event/anomaly/anomaly_grav

	max_occurrences = 5
	weight = 25
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/anomaly_grav
	start_when = 3
	announce_when = 20
	anomaly_path = /obj/effect/anomaly/grav

/datum/round_event/anomaly/anomaly_grav/announce(fake)
	priority_announce("Гравитационная аномалия обнаружена на сканерах большой дальности. Ожидаемое место: [impact_area.name].", "Аномальная тревога", has_important_message = TRUE)
