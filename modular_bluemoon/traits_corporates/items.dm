//regular
/obj/item/clothing/accessory/badge_nt
	name = "NT specialist badge"
	desc = "A regular badge given to NT employees"
	icon_state = "badge_nt"
	icon = 'modular_bluemoon/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/badge_syndi
	name = "Syndicate specialist badge"
	desc = "A regular badge given to NT employees"
	icon_state = "badge_syndi"
	icon = 'modular_bluemoon/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/accessories.dmi'

//advanced
/obj/item/clothing/accessory/badge_nt_senior
	name = "NT senior specialist badge"
	desc = "A badge given to NT veterans, has built-in weak protective field generator"
	icon_state = "badge_nt_senior"
	armor = list(MELEE = 5, BULLET = 0, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	restricted_accessory = TRUE // BLUEMOON EDIT - изменение аксессуаров
	icon = 'modular_bluemoon/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/accessories.dmi'

/obj/item/clothing/accessory/badge_syndi_senior
	name = "Syndicate senior specialist badge"
	desc = "A badge given to Syndicate veterans, has built-in weak protective field generator"
	icon_state = "badge_syndi_senior"
	armor = list(MELEE = 5, BULLET = 5, LASER = 0, ENERGY = 0, BOMB = 5, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	restricted_accessory = TRUE // BLUEMOON EDIT - изменение аксессуаров
	icon = 'modular_bluemoon/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/accessories.dmi'

//permits

/obj/item/clothing/accessory/permit/special/nt
	name = "NanoTrasen employee weapons permit"
	desc = "Порой деньги решают не всё."
	permitted_weapons = "Нелетальное неконтрабандное энергетическое оружие"
	notes = "Будучи проверенным сотрудником корпорации вы имеете право использовать оружие для самозащиты."

/obj/item/clothing/accessory/permit/special/syndi
	name = "Syndicate employee weapons permit"
	desc = "Время проделать в ком ни будь пару дырок!"
	permitted_weapons = "Неконтрабандное огнестрельное оружие"
	notes = "Будучи проверенным сотрудником корпорации вы имеете право использовать оружие для самозащиты."

//boxes

/obj/item/storage/box/syndi_revolver_kit
	name = "Your best friend"
	icon_state = "syndiebox"

/obj/item/storage/box/syndi_revolver_kit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/revolver/r22lr(src)
	new /obj/item/ammo_box/c22lr(src)
	new /obj/item/ammo_box/c22lr/rubber(src)


//kits

/obj/item/storage/backpack/duffelbag/syndie/senior
	name = "syndicate duffel bag"
	desc = "A large duffel bag for holding extra supplies"

/obj/item/storage/backpack/duffelbag/syndie/senior/PopulateContents()
	new /obj/item/clothing/accessory/badge_syndi_senior(src)
	new /obj/item/clothing/shoes/combat/swat/knife(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)
	new /obj/item/clothing/under/syndicate/combat/ert(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/clothing/accessory/permit/special/syndi(src)
	new /obj/item/storage/box/syndi_revolver_kit(src)
