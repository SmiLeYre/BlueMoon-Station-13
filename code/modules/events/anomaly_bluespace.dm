/datum/round_event_control/anomaly/anomaly_bluespace
	name = "Anomaly: Bluespace"
	typepath = /datum/round_event/anomaly/anomaly_bluespace

	max_occurrences = 5
	weight = 50
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/anomaly_bluespace
	start_when = 3
	announce_when = 10
	anomaly_path = /obj/effect/anomaly/bluespace

/datum/round_event/anomaly/anomaly_bluespace/announce(fake)
	priority_announce("Нестабильная блюспейс аномалия обнаружена на сканерах большой дальности. Ожидаемое место: [impact_area.name].", "Аномальная тревога", has_important_message = TRUE)
