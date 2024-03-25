#define SENSORS_UPDATE_PERIOD 10 SECONDS

/obj/machinery/computer/crew
	luminosity = 1
	light_power = 3
	var/canalarm = FALSE
	var/obj/item/radio/radio

/obj/machinery/computer/crew/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	radio = new/obj/item/radio(src)
	radio.listening = FALSE
	radio.recalculateChannels()
	alarm()

/obj/machinery/computer/crew/proc/alarm()
	canalarm = FALSE
	var/injuredcount = 0

	for(var/tracked_mob in GLOB.suit_sensors_list)
		var/mob/living/carbon/human/mob = tracked_mob
		if(mob.z != src.z)
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
		radio.set_frequency(FREQ_MEDICAL)
		radio.talk_into(src, "[injuredcount] нуждаются в оказании срочной медицинской помощи.", RADIO_CHANNEL_MEDICAL)

#undef SENSORS_UPDATE_PERIOD
