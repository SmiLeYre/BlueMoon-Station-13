/obj/machinery/aug_manipulator
	circuit = /obj/item/circuitboard/machine/aug_manipulator

/obj/machinery/aug_manipulator/crowbar_act(mob/living/user, obj/item/tool)
	if(!default_deconstruction_crowbar(tool, TRUE))
		return
	return TOOL_ACT_TOOLTYPE_SUCCESS
