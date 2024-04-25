/obj/item/clothing/accessory/bodycamera
	name = "body camera"
	desc = "An armor vest upgrade, there's an instructions tag if you look a little closer..."
	icon = 'modular_splurt/icons/obj/clothing/bodycam.dmi'
	icon_state = "bodycamera"
	var/obj/machinery/camera/builtInCamera = null

/obj/item/clothing/accessory/bodycamera/attach(obj/item/clothing/under/U, user)
	. = ..()
	builtInCamera = new (src)
	builtInCamera.network = list("ss13")
	builtInCamera.internal_light = FALSE

	var/mob/living/carbon/human/H = user
	var/obj/item/card/id/id_card = H.wear_id?.GetID()
	var/c_tag = "Body Camera: "
	if(!id_card)
		id_card = H.wear_neck?.GetID()
	if(istype(id_card))
		c_tag += id_card.registered_name
	else
		c_tag += "Unknown"

	builtInCamera.c_tag = c_tag

	return .


/obj/item/clothing/accessory/bodycamera/detach(obj/item/clothing/under/U, user)
	. = ..()
	if(!QDELETED(builtInCamera))
		QDEL_NULL(builtInCamera)
	return .
