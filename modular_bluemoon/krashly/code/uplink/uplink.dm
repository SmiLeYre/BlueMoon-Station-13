/obj/item/inteq/uplink
	name = "InteQ uplink"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq-uplink.dmi'
	icon_state = "inteq-uplink"
	desc = "A basic handheld radio that communicates with local telecommunication networks. (You can turn Uplink to dust if you Alt + Click it.)"
	dog_fashion = /datum/dog_fashion/back

	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_SMALL

	var/uplink_flag = UPLINK_TRAITORS

/obj/item/inteq/uplink/Initialize(mapload, owner, tc_amount = 30)
	. = ..()
	AddComponent(/datum/component/uplink/inteq, owner, FALSE, TRUE, uplink_flag, tc_amount)

/obj/item/inteq/uplink/AltClick(mob/user)
	. = ..()
	to_chat(user, span_warning("The Uplink turns to dust in your hands."))
	qdel(src)

/obj/item/inteq/uplink/radio
	name = "InteQ Radio Uplink"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq-uplink.dmi'
	icon_state = "inteq-uplink"
	desc = "A basic handheld radio that communicates with local telecommunication networks. (You can turn Uplink to dust if you Alt + Click it.)"
	dog_fashion = /datum/dog_fashion/back

/obj/item/inteq/uplink/radio/nuclear
	name = "InteQ Radio Uplink"
	uplink_flag = UPLINK_NUKE_OPS

/obj/item/uplink/syndicate
	name = "Syndicate Uplink"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq-uplink.dmi'
	icon_state = "syndicate-uplink"
	desc = "A basic handheld radio that communicates with local telecommunication networks. (You can turn Uplink to dust if you Alt + Click it.)"
	dog_fashion = /datum/dog_fashion/back

/obj/item/uplink/syndicate/Initialize(mapload, owner, tc_amount = 30)
	. = ..()
	AddComponent(/datum/component/uplink/syndicate, owner, FALSE, TRUE, uplink_flag, tc_amount)

/obj/item/uplink/syndicate/nuclear
	name = "syndicate nuclear uplink"
	uplink_flag = UPLINK_NUKE_OPS
