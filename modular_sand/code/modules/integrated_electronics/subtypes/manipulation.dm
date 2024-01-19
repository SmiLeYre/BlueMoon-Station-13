/obj/item/integrated_circuit/manipulation/activator
	name = "activator"
	desc = "Circuit which can activate things remotely!"
	icon_state = "pull_claw"
	extended_desc = "This circuit needs a reference to a thing to activate, it also needs to know who is activating said item."
	w_class = WEIGHT_CLASS_SMALL
	size = 3
	cooldown_per_use = 1
	complexity = 10
	inputs = list("target" = IC_PINTYPE_REF, "person" = IC_PINTYPE_REF)
	activators = list("pulse in" = IC_PINTYPE_PULSE_IN,"pulse out" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 50
	ext_cooldown = 1

/obj/item/integrated_circuit/manipulation/activator/do_work(ord)
	var/obj/acting_object = get_pin_data_as_type(IC_INPUT, 1, /obj/)
	var/mob/person = get_pin_data_as_type(IC_INPUT, 2, /mob/)
	acting_object.interact(person)
	activate_pin(1)


/obj/item/integrated_circuit/manipulation/advactivator
	name = "advactivator"
	desc = "Circuit which can UI elements remotely! Works with most machines."
	icon_state = "pull_claw"
	extended_desc = "This circuit needs a reference to activate, as well as action and sometimes params to pass: key - value."
	w_class = WEIGHT_CLASS_SMALL
	size = 3
	cooldown_per_use = 1
	complexity = 10

	inputs = list("target" = IC_PINTYPE_REF, "action" = IC_PINTYPE_STRING, "param_key_1" = IC_PINTYPE_STRING, "param_value_1" = IC_PINTYPE_ANY, "param_key_2" = IC_PINTYPE_STRING, "param_value_2" = IC_PINTYPE_ANY, "param_key_3" = IC_PINTYPE_STRING, "param_value_3" = IC_PINTYPE_ANY)
	activators = list(
		"pulse in" = IC_PINTYPE_PULSE_IN,
		"pulse out" = IC_PINTYPE_PULSE_OUT
		)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 50
	ext_cooldown = 1
	var/max_grab = GRAB_PASSIVE

/obj/item/integrated_circuit/manipulation/advactivator/do_work(ord)
	var/obj/acting_object = get_pin_data_as_type(IC_INPUT, 1, /obj/)
	var/action = get_pin_data(IC_INPUT, 2)
	//var/key = get_pin_data(IC_INPUT, 3)
	//var/value = get_pin_data(IC_INPUT, 4)
	var/params = list(
		"ic_advactivator" = TRUE,
		//"[key]" = value,
	)
	for(var/i=3, i<=7, i+=2)
		var/key = get_pin_data(IC_INPUT, i)
		var/value = get_pin_data(IC_INPUT, i+1)
		if(key && value)
			params["[key]"] = value
	if(acting_object)
		acting_object.ui_act(action, params)
		activate_pin(2)
