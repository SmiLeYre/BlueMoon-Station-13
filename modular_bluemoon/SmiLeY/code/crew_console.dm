#define SENSORS_UPDATE_PERIOD 10 SECONDS

/obj/machinery/computer/crew
	luminosity = 1
	light_power = 3
	var/canalarm = FALSE
	var/obj/item/radio/Radio
	var/radio_key = /obj/item/encryptionkey/headset_med

/obj/machinery/computer/crew/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	Radio = new/obj/item/radio(src)
	if(radio_key)
		Radio.keyslot = new radio_key
	Radio.subspace_transmission = TRUE
	Radio.canhear_range = 0 // anything greater will have the bot broadcast the channel as if it were saying it out loud.
	Radio.recalculateChannels()
	alarm()

/obj/machinery/computer/crew/proc/alarm()
	canalarm = FALSE
	var/injuredcount = 0

	for(var/mob/living/carbon/human/mob in GLOB.suit_sensors_list) //BLUEMOON CHANGE был carbon_list, в котором были лишние мобы
		if(mob.z != src.z)
			continue
		else if(!istype(mob.w_uniform, /obj/item/clothing/under)) //BLUEMOON CHANGE проверка на существование униформы, сколько её может быть и не быть
			continue
		var/obj/item/clothing/under/uniform = mob.w_uniform
		if(uniform.sensor_mode >= SENSOR_VITALS && mob.InCritical() || mob.stat == DEAD)
			injuredcount++
			canalarm = TRUE
		else if(uniform.sensor_mode == SENSOR_LIVING && mob.stat == DEAD)
			injuredcount++
			canalarm = TRUE

	if(canalarm)
		playsound(src, 'sound/machines/twobeep.ogg', 100, TRUE)
		set_light((initial(light_range) + 3), 3, CIRCUIT_COLOR_SECURITY, TRUE)
	else
		set_light((initial(light_range)), initial(light_power), initial(light_color), TRUE)

	addtimer(CALLBACK(src, .proc/alarm), SENSORS_UPDATE_PERIOD)
	if(prob(1))
		alert_radio(canalarm, injuredcount)
	return canalarm

/obj/machinery/computer/crew/proc/alert_radio(canalarm, injuredcount)
	if(canalarm)
		Radio.talk_into(src, "Внимание. Сотрудники Космической Станции нуждаются в срочной медицинской помощи. Количество: [injuredcount]", RADIO_CHANNEL_MEDICAL, list(z))

#undef SENSORS_UPDATE_PERIOD
