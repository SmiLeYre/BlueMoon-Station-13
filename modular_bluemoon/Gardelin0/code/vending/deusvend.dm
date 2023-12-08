/obj/machinery/vending/wardrobe/chap_wardrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/nullrod/crucifix = 3,
		/obj/item/nullrod/crucifix/silver = 3,
		/obj/item/nullrod/crucifix/wooden = 3,
		/obj/item/nullrod/crucifix/aquila = 3,
		/obj/item/nullrod/crucifix/orthodox = 3,
		/obj/item/nullrod/crucifix/orthodox/wooden = 3,
	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
