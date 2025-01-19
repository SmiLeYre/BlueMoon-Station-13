/obj/machinery/pdapainter
	circuit = /obj/item/circuitboard/machine/pdapainter

/obj/machinery/pdapainter/crowbar_act(mob/living/user, obj/item/tool)
	if(!default_deconstruction_crowbar(tool, TRUE))
		return
	return TOOL_ACT_TOOLTYPE_SUCCESS
