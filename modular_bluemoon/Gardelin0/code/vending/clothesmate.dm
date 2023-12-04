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
		/obj/item/clothing/accessory/armband/polyband = 9,
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
		/obj/item/clothing/ears/earring/stud = 3,
		/obj/item/clothing/ears/earring/stud/glass = 3,
		/obj/item/clothing/ears/earring/stud/wood = 3,
		/obj/item/clothing/ears/earring/stud/iron = 3,
		/obj/item/clothing/ears/earring/stud/steel = 3,
		/obj/item/clothing/ears/earring/stud/silver = 3,
		/obj/item/clothing/ears/earring/stud/gold = 3,
		/obj/item/clothing/ears/earring/stud/platinum = 3,
		/obj/item/clothing/ears/earring/stud/onyx = 3,
		/obj/item/clothing/ears/earring/stud/emerald = 3,
		/obj/item/clothing/ears/earring/stud/amber = 3,
		/obj/item/clothing/ears/earring/stud/amethyst = 3,
		/obj/item/clothing/ears/earring/stud/ruby = 3,
		/obj/item/clothing/ears/earring/stud/sapphire = 3,
		/obj/item/clothing/ears/earring/stud/diamond = 3,
		/obj/item/clothing/ears/earring/dangle = 3,
		/obj/item/clothing/ears/earring/dangle/glass = 3,
		/obj/item/clothing/ears/earring/dangle/wood = 3,
		/obj/item/clothing/ears/earring/dangle/iron = 3,
		/obj/item/clothing/ears/earring/dangle/steel = 3,
		/obj/item/clothing/ears/earring/dangle/silver = 3,
		/obj/item/clothing/ears/earring/dangle/gold = 3,
		/obj/item/clothing/ears/earring/dangle/platinum = 3,
		/obj/item/clothing/ears/earring/dangle/onyx = 3,
		/obj/item/clothing/ears/earring/dangle/emerald = 3,
		/obj/item/clothing/ears/earring/dangle/amber = 3,
		/obj/item/clothing/ears/earring/dangle/amethyst = 3,
		/obj/item/clothing/ears/earring/dangle/ruby = 3,
		/obj/item/clothing/ears/earring/dangle/sapphire = 3,
		/obj/item/clothing/ears/earring/dangle/diamond = 3,
		/obj/item/clothing/ears/earring/single/stud = 3,
		/obj/item/clothing/ears/earring/single/stud/glass = 3,
		/obj/item/clothing/ears/earring/single/stud/wood = 3,
		/obj/item/clothing/ears/earring/single/stud/iron = 3,
		/obj/item/clothing/ears/earring/single/stud/steel = 3,
		/obj/item/clothing/ears/earring/single/stud/silver = 3,
		/obj/item/clothing/ears/earring/single/stud/gold = 3,
		/obj/item/clothing/ears/earring/single/stud/platinum = 3,
		/obj/item/clothing/ears/earring/single/stud/onyx = 3,
		/obj/item/clothing/ears/earring/single/stud/emerald = 3,
		/obj/item/clothing/ears/earring/single/stud/amber = 3,
		/obj/item/clothing/ears/earring/single/stud/amethyst = 3,
		/obj/item/clothing/ears/earring/single/stud/ruby = 3,
		/obj/item/clothing/ears/earring/single/stud/sapphire = 3,
		/obj/item/clothing/ears/earring/single/stud/diamond = 3,
		/obj/item/clothing/ears/earring/single/dangle = 3,
		/obj/item/clothing/ears/earring/single/dangle/glass = 3,
		/obj/item/clothing/ears/earring/single/dangle/wood = 3,
		/obj/item/clothing/ears/earring/single/dangle/iron = 3,
		/obj/item/clothing/ears/earring/single/dangle/steel = 3,
		/obj/item/clothing/ears/earring/single/dangle/silver = 3,
		/obj/item/clothing/ears/earring/single/dangle/gold = 3,
		/obj/item/clothing/ears/earring/single/dangle/platinum = 3,
		/obj/item/clothing/ears/earring/single/dangle/onyx = 3,
		/obj/item/clothing/ears/earring/single/dangle/emerald = 3,
		/obj/item/clothing/ears/earring/single/dangle/amber = 3,
		/obj/item/clothing/ears/earring/single/dangle/amethyst = 3,
		/obj/item/clothing/ears/earring/single/dangle/ruby = 3,
		/obj/item/clothing/ears/earring/single/dangle/sapphire = 3,
		/obj/item/clothing/ears/earring/single/dangle/diamond = 3,
	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
