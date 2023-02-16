/obj/machinery/vending/clothing/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/under/dress/skirt/blackjumpskirt = 3,
		/obj/item/clothing/under/dress/white = 3,
		/obj/item/clothing/under/dress/gown =3,
		/obj/item/clothing/under/dress/longdress = 3,
		/obj/item/clothing/under/dress/skirt/nightie = 3,
		/obj/item/clothing/under/dress/skirt/shortdress = 3,
		/obj/item/clothing/under/dress/skirt/minidress = 3,
		/obj/item/clothing/under/dress/skirt/tightevening	= 3,
		/obj/item/clothing/under/dress/skirt/leather = 3,
		/obj/item/clothing/under/dress/skirt/short = 3,
		/obj/item/clothing/under/dress/skirt/long = 3,
		/obj/item/clothing/under/dress/skirt/pleatedmedium = 3,
		/obj/item/clothing/under/dress/skirt/pleatedshort = 3,
		/obj/item/clothing/under/dress/vintage = 3,
		/obj/item/clothing/under/dress/polychromic/evening =3,
		/obj/item/clothing/under/dress/party = 3,
		/obj/item/clothing/under/dress/skirt/transparent = 3,
		/obj/item/clothing/under/dress/skirt/toga = 3,
		/obj/item/clothing/under/dress/skirt/thin = 3,
		/obj/item/clothing/accessory/armband/polyband = 3,
		/obj/item/clothing/gloves/poly_evening = 3,
		/obj/item/clothing/gloves/transparent = 3,
		/obj/item/clothing/suit/toggle/polysuitjacket = 3,
		/obj/item/clothing/suit/polyrobes = 3,
		/obj/item/clothing/mask/transparent_mask = 3,
		/obj/item/clothing/shoes/polyflats = 3,
		/obj/item/clothing/shoes/polywhitedress = 3,
		/obj/item/clothing/shoes/polyheels = 3,
		/obj/item/clothing/shoes/polyheels_boots = 3,
		/obj/item/clothing/shoes/polyheels_boots_high = 3,
		/obj/item/clothing/shoes/sandals_fancy = 3,
		/obj/item/clothing/suit/toggle/poly_labcoat = 3,
		/obj/item/storage/backpack/pocketbook = 3,
		/obj/item/storage/backpack/pocketbook/brown = 3,
		/obj/item/storage/backpack/pocketbook/reddish = 3,
	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
