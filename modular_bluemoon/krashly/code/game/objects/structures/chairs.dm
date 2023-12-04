/obj/structure/chair/comfy/barber_chair
	name = "barber softchair"
	icon = 'modular_bluemoon/krashly/icons/obj/chairs.dmi'
	icon_state = "barber_chair"

/obj/structure/chair/comfy/barber_chair/GetArmrest()
	return mutable_appearance('modular_bluemoon/krashly/icons/obj/chairs.dmi', "barber_chair_armrest")
