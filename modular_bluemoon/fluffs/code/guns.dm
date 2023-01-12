/obj/item/gun/ballistic/automatic/pistol/donator/bm/steyr
	name = "\improper Steyr M1912"
	desc = "Self-loading pistol manufactured by Austria-Hungary. Modified to 10mm."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "steyr_m1912"
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/pistol/donator/bm/steyr/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]][chambered ? "" : "-e"]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/projectile/bullet/c10mm/rubber
	name = "10mm rubber bullet"
	damage = 5
	stamina = 30
	armour_penetration = -30
	ricochets_max = 6
	ricochet_incidence_leeway = 70
	ricochet_chance = 130
	ricochet_decay_damage = 0.8
	shrapnel_type = NONE
	sharpness = SHARP_NONE
	embedding = null

/obj/item/ammo_casing/c10mm/rubber
	name = "10mm rubber bullet casing"
	desc = "A 10mm rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/c10mm/rubber

/obj/item/ammo_box/magazine/m10mm/rubber
	name = "pistol magazine (10mm rubber)"
	icon_state = "9x19p"
	desc = "A gun magazine. Loaded with rounds which make pain the target."
	ammo_type = /obj/item/ammo_casing/c10mm/rubber

/obj/item/storage/secure/briefcase/hos/steyr
	name = "\improper \'Steyr M1912\' gun kit"
	desc = "A storage case for a Steyr M1912. Bullets for everyone! !"

/obj/item/storage/secure/briefcase/hos/steyr/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/donator/bm/steyr(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
