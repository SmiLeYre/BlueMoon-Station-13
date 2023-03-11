/obj/machinery/vending/brigdoc_vendomat
	name = "\improper SecMedDrobe"
	desc = "Stay alive until the end. Dispenses stuff for brig physicians."
	icon_state = "brigdoc"
	product_ads = "А вы знаете, что такое Женевская конвенция?; Синдикат ведь не будет стрелять в офицеров с красным крестом, правда?;Иди и спаси чью-то жизнь!"
	vend_reply = "Медицинское снаряжение выдано. Удачной службы."
	req_access = list(ACCESS_MEDICAL)
	products = list(/obj/item/storage/belt/medical = 2,
					/obj/item/clothing/gloves/color/latex/nitrile = 2,
					/obj/item/clothing/mask/surgical = 3,
					/obj/item/storage/ifak = 3,
					/obj/item/pinpointer/crew = 2,
					/obj/item/sensor_device = 2,
					/obj/item/reagent_containers/syringe = 2,
					/obj/item/stack/medical/suture = 2,
					/obj/item/stack/medical/ointment = 2,
					/obj/item/reagent_containers/pill/salbutamol = 2,
					/obj/item/reagent_containers/glass/bottle/charcoal = 1,
					/obj/item/reagent_containers/glass/bottle/morphine = 1,
					/obj/item/storage/hypospraykit/fire = 1,
					/obj/item/storage/hypospraykit/toxin = 1,
					/obj/item/storage/hypospraykit/o2 = 1,
					/obj/item/storage/hypospraykit/brute = 1)
	refill_canister = /obj/item/vending_refill/brigdoc_vendomat
	payment_department = ACCOUNT_SEC
/obj/item/vending_refill/brigdoc_vendomat
	machine_name = "SecMedDrobe"