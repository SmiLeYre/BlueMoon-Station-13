//9x39 bullet

/obj/item/projectile/bullet/a9x39
	name = "9x39 bullet"
	damage = 20
	wound_bonus = -10

/obj/item/ammo_casing/a9x39
	name = "9x39 bullet casing"
	desc = "A 9x39 bullet casing."
	icon_state = "s-casing"
	caliber = "9x39"
	projectile_type = /obj/item/projectile/bullet/a9x39

/obj/item/ammo_box/a9x39
	name = "ammo box (9x39)"
	icon_state = "10mmbox"
	ammo_type = /obj/item/ammo_casing/a9x39
	max_ammo = 20
