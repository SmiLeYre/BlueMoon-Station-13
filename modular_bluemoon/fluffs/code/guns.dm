/obj/item/Kovac_Kit
	name = "Kovac Gun Kit"
	desc = "A modkit for making a Enforcer Gun into a Kovac Gun."
	icon = 'icons/obj/vending_restock.dmi'
	icon_state = "refill_donksoft"
	var/product = /obj/item/gun/ballistic/automatic/pistol/enforcer/steyr //what it makes
	var/list/fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold) //what it needs

/obj/item/Kovac_Kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

/obj/item/gun/ballistic/automatic/pistol/enforcer/steyr
	name = "\improper Steyr MWS"
	desc = "An antique semi-automatic pistol, heavily modified by the MWS defence manufacturing company. Provided with a better ammo cartridge and reinforced parts, it fits perfectly for resolving various security tasks. You can also notice Kovac's family sign drawn on it's handgrip."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "steyr_m1912"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/steyr_shoot.ogg'
/*
/obj/item/gun/ballistic/automatic/pistol/steyr/update_icon_state()
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
	desc = "A storage case for a Steyr M1912. Bullets for everyone!"

/obj/item/storage/secure/briefcase/hos/steyr/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/steyr(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
	new /obj/item/ammo_box/magazine/m10mm/rubber(src)
*/
