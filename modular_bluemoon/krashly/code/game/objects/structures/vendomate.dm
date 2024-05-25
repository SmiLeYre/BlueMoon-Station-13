/obj/machinery/vending/inteq_vendomat
	name = "\improper InteDrobe"
	desc = "Spend your hard earned credits!"
	icon = 'modular_bluemoon/krashly/icons/obj/structures.dmi'
	icon_state = "intedrobe"
	product_slogans = "Почти не пачкается кровью!;Потрать свои тяжело заработанные кредиты!;Новые поставки от наших клиентов!"
	vend_reply = "Удачных контрактов, наёмник!"
	req_access = list(ACCESS_SYNDICATE)
	products = list(
		/obj/item/clothing/under/inteq = 3,
		/obj/item/clothing/under/inteq/skirt = 3,
		/obj/item/clothing/under/inteq/eng = 3,
		/obj/item/clothing/under/inteq/eng_skirt = 3,
		/obj/item/clothing/under/inteq/med = 3,
		/obj/item/clothing/under/inteq/med_skirt = 3, //////////////////////////////
		/obj/item/clothing/under/inteq/maid = 3,
		/obj/item/clothing/gloves/combat/maid/inteq = 3,
		/obj/item/clothing/head/maid/syndicate/inteq = 3, //////////////////
		/obj/item/clothing/head/helmet/swat/inteq = 2,
		/obj/item/clothing/suit/armor/inteq = 2,
		/obj/item/clothing/shoes/combat = 2,
		/obj/item/clothing/mask/balaclava/breath/inteq = 2,
		/obj/item/clothing/mask/gas/inteq = 3,
		/obj/item/clothing/neck/cloak/inteq = 3,
		/obj/item/clothing/neck/cloak/diver = 3,
		/obj/item/clothing/suit/hooded/wintercoat/syndicate/inteq = 2,
		/obj/item/clothing/suit/armor/inteq/labcoat = 3,
		/obj/item/clothing/head/soft/inteq = 3,
		/obj/item/clothing/head/soft/inteq_med = 3,
		/obj/item/storage/fancy/cigarettes/cigpack_inteq = 3,
		/obj/item/reagent_containers/food/snacks/intecookies = 5,
	)
	contraband = list(
		/obj/item/kitchen/knife/combat = 2,
		/obj/item/clothing/glasses/hud/security/sunglasses/inteq = 2,
		/obj/item/clothing/shoes/combat/coldres = 1,
	)
	premium = list(
		/obj/item/lighter = 5,
		/obj/item/clothing/gloves/combat = 2,
		/obj/item/clothing/head/HoS/inteq_vanguard = 1,
		/obj/item/clothing/suit/armor/inteq/vanguard = 1,
		/obj/item/storage/backpack/duffelbag/syndie/inteq = 4,
	)
	refill_canister = /obj/item/vending_refill/inteq_vendomat
	light_color = COLOR_DARK_ORANGE

/obj/item/vending_refill/inteq_vendomat
	machine_name = "InteDrobe"

/obj/machinery/vending/kink
	light_mask = "kink-light-mask"
