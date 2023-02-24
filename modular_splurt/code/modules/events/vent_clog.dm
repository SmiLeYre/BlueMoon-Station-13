/datum/round_event_control/vent_clog/cope_and_seethe
	name = "Copium Flood"
	typepath = /datum/round_event/vent_clog/cope_and_seethe
	max_occurrences = 0

/datum/round_event/vent_clog/cope_and_seethe/announce()
	priority_announce("Мы обнаружили высокий уровень Агрессии на станции. Для борьбы с этим мы будем использовать массовое количество копиума. Пожалуйста, держитесь подальше от вентиляционных отверстий, пока давление не выровняется.", "Центральное Командование")

/datum/round_event/vent_clog/cope_and_seethe
	saferChems = list(
		/datum/reagent/drug/copium
	)

/datum/round_event/vent_clog/cope_and_seethe/start()
	for (var/obj/machinery/atmospherics/components/unary/vent in vents)
		if (vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/drug/copium, 5)

			var/datum/effect_system/smoke_spread/chem/smoke = new
			smoke.set_up(R, 7, get_turf(vent), TRUE) // Intentionally silent. There's a fuck ton of vents.
			smoke.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/female
	name = "Clogged Vents: Girlcum"
	typepath = /datum/round_event/vent_clog/female
	max_occurrences = 1

/datum/round_event/vent_clog/female
	saferChems = list(
		/datum/reagent/consumable/semen/femcum
	)
	reagentsAmount = 100

/datum/round_event/vent_clog/female/announce()
	priority_announce("Сеть скрубберов испытывает противодавление из-за откуда-то взявшегося в них СКВИРТА. Может произойти некоторое разбрызгивание содержимого.", "Атмосферная Тревога")

/datum/round_event/vent_clog/female/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen/femcum, reagentsAmount)

			var/datum/effect_system/foam_spread/foam = new
			foam.set_up(200, get_turf(vent), R)
			foam.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/male
	name = "Clogged Vents: Semen"
	typepath = /datum/round_event/vent_clog/male
	max_occurrences = 1

/datum/round_event/vent_clog/male
	saferChems = list(
		/datum/reagent/consumable/semen
	)
	reagentsAmount = 100

/datum/round_event/vent_clog/male/announce()
	priority_announce("Сеть скрубберов испытывает противодавление из-за откуда-то взявшегося в них СЕМЕНИ. Может произойти некоторое разбрызгивание содержимого.", "Атмосферная Тревога")

/datum/round_event/vent_clog/male/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen, reagentsAmount)

			var/datum/effect_system/foam_spread/foam = new
			foam.set_up(200, get_turf(vent), R)
			foam.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/crocin
	name = "Aphrodisiac Flood"
	typepath = /datum/round_event/vent_clog/crocin
	weight = 10
	max_occurrences = 1

/datum/round_event/vent_clog/crocin
	saferChems = list(
		/datum/reagent/drug/aphrodisiac
	)
	reagentsAmount = 100
	var/reagent = /datum/reagent/drug/aphrodisiac

/datum/round_event/vent_clog/crocin/announce()
	priority_announce("Мы обнаружили снижение уровня похоти на станции. Чтобы исправить это, мы будем использовать большое количество легкого афродизиака. Пожалуйста, держитесь подальше от вентиляционных отверстий, пока розовый газ не рассеется.", "Центральное Командование")

/datum/round_event/vent_clog/crocin/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new(1000)
			R.my_atom = vent
			R.add_reagent(reagent, reagentsAmount)

			var/datum/effect_system/smoke_spread/chem/smoke = new
			smoke.set_up(R, 10, get_turf(vent), FALSE)
			smoke.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/crocin/hexacrocin
	name = "Strong Aphrodisiac Flood"
	typepath = /datum/round_event/vent_clog/crocin/hexacrocin
	max_occurrences = 0 //Only adminspawn because this one causes brain damage

/datum/round_event/vent_clog/crocin/hexacrocin
	saferChems = list(
		/datum/reagent/drug/aphrodisiacplus
	)
	reagent = /datum/reagent/drug/aphrodisiacplus

/datum/round_event/vent_clog/crocin/hexacrocin/announce()
	priority_announce("Мы обнаружили опасно низкий уровень похоти на станции. Чтобы исправить это, мы будем использовать большое количество сильных афродизиаков. Пожалуйста, не подходите к вентиляционным отверстиям, пока розовый газ не рассеется, если вы хотите избежать повреждения мозга.", "Центральное Командование")
