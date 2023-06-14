/datum/round_event_control/anomaly/anomaly_flux
	name = "Anomaly: Hyper-Energetic Flux"
	typepath = /datum/round_event/anomaly/anomaly_flux

	min_players = 20
	max_occurrences = 2
	weight = 20
	category = EVENT_CATEGORY_ANOMALIES

/datum/round_event/anomaly/anomaly_flux
	start_when = 10
	announce_when = 3
	anomaly_path = /obj/effect/anomaly/flux

/datum/round_event/anomaly/anomaly_flux/announce(fake)
	priority_announce("Обнаружен гипер-энергетический поток на сканерах большой дальности. Ожидаемое место: [impact_area.name].", "Аномальная тревога", has_important_message = TRUE)

