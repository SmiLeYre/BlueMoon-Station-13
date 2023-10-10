/obj/item/Kovac_Kit
	name = "Kovac Gun Kit"
	desc = "A modkit for making a Enforcer Gun into a Kovac Gun."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/gun/ballistic/automatic/pistol/enforcer/steyr //what it makes
	var/list/fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold) //what it needs

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

/obj/item/auto9_kit
	name = "Auto 9 Kit"
	desc = "A modkit for making a WT-550 Gun into a Auto 9 Gun."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/gun/ballistic/automatic/wt550/auto9 //what it makes
	var/list/fromitem = list(/obj/item/gun/ballistic/automatic/wt550) //what it needs

/obj/item/auto9_kit/afterattack(obj/O, mob/user as mob)
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

/obj/item/gun/ballistic/automatic/wt550/auto9
	name = "\improper Auto 9"
	desc = "Come quitely or there will be troubles."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "auto9"
	item_state = "auto9"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/auto9_shoot.ogg'
	can_suppress = FALSE
	can_bayonet = FALSE

/obj/item/gun/ballistic/automatic/wt550/auto9/update_icon_state()
	if(magazine)
		icon_state = "auto9"
	else
		icon_state = "auto9-e"

/obj/item/m240_kit
	name = "M240 Kit"
	desc = "A modkit for making a Flamethrower into a M240."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/flamethrower/full/tank/m240 //what it makes
	var/list/fromitem = list(/obj/item/flamethrower, /obj/item/flamethrower/full, /obj/item/flamethrower/full/tank) //what it needs

/obj/item/m240_kit/afterattack(obj/O, mob/user as mob)
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

/obj/item/flamethrower/full/tank/m240
	name = "M240 Flamethrower"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "m240"
	item_state = "m240_0"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	create_with_tank = TRUE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/flamethrower.ogg'

/obj/item/flamethrower/update_icon_state()
	item_state = "m240_[lit]"

/obj/item/old_kit
	name = "H&K Luftkuss Kit"
	desc = "A modkit for making a hybrid taser into a H&K Luftkuss."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/gun/energy/e_gun/advtaser_old //what it makes
	var/list/fromitem = list(/obj/item/gun/energy/e_gun/advtaser) //what it needs

/obj/item/old_kit/afterattack(obj/O, mob/user as mob)
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

/obj/item/gun/energy/e_gun/advtaser_old
	name = "H&K Luftkuss"
	desc = "An upgraded hybrid taser gun with several stripes, manufactured by the SolFed H&K arms company."
	icon_state = "old"
	item_state = "taser"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/old, /obj/item/ammo_casing/energy/electrode/old = FALSE)
	ammo_x_offset = 0
	var/last_altfire = 0
	var/altfire_delay = CLICK_CD_RANGE

/obj/item/gun/energy/e_gun/advtaser_old/altafterattack(atom/target, mob/user, proximity_flag, params)
	. = TRUE
	if(last_altfire + altfire_delay > world.time)
		return
	var/current_index = current_firemode_index
	set_firemode_to_type(/obj/item/ammo_casing/energy/electrode/old)
	process_afterattack(target, user, proximity_flag, params)
	set_firemode_index(current_index)
	last_altfire = world.time

/obj/item/ammo_casing/energy/disabler/old
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/disabler.ogg'

/obj/item/ammo_casing/energy/electrode/old
	projectile_type = /obj/item/projectile/energy/electrode
	select_name = "stun"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/taser.ogg'
	e_cost = 200
	harmful = FALSE


////////////

/obj/item/dominator_kit
	name = "Dominator Kit"
	desc = "A modkit for making a hybrid taser into a Dominator."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/gun/energy/e_gun/advtaser/dominator //what it makes
	var/list/fromitem = list(/obj/item/gun/energy/e_gun/advtaser) //what it needs

/obj/item/dominator_kit/afterattack(obj/O, mob/user as mob)
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

/obj/item/gun/energy/e_gun/advtaser/dominator
	name = "\improper Dominator"
	icon_state = "dominator"
	item_state = "taser"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	ammo_x_offset = 0

/////////////////

/obj/item/nue_kit
	name = "Araki Nue Kit"
	desc = "A modkit for making an Enforcer into a Araki Nue."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/gun/ballistic/automatic/pistol/enforcer/nue //what it makes
	var/list/fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold) //what it needs

/obj/item/nue_kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit

/obj/item/gun/ballistic/automatic/pistol/enforcer/nue
	name = "\improper Araki Nue"
	desc = "Semi-automatic, double-action pistol that was engineered to fit any hand. The handle is decorated with orange-colored ergonomic rubber with a Vulpkanin muzzle on it. It's looks familiar."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "nue"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/nue_shoot.ogg'


//////////////////// AM4 уже есть в лодауте донатеров. Это лишь его рескин.

/obj/item/gun/ballistic/automatic/AM4B_pchelik
	name = "GFYS"
	desc = "На донк-софт оружии видна гравировка: 'Coopie'. Предназначено для нетравмирующего выкидывания существ из бара и самозащиты от приставал."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "coopie"
	item_state = "arifle-wielded"
	mag_type = /obj/item/ammo_box/magazine/toy/AM4B
	can_suppress = 0
	casing_ejector = 0
	spread = 30		//Assault Rifleeeeeee
	w_class = WEIGHT_CLASS_NORMAL
	burst_size = 1	//Shh.
	fire_delay = 15
	automatic_burst_overlay = FALSE

/////////////////////////////////////////////////////////////////////////////////////

/obj/item/stunblade_kit
	name = "Stunblade Kit"
	desc = "A modkit for making an stunbaton into a stunblade."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product = /obj/item/melee/baton/stunblade //what it makes
	var/list/fromitem = list(/obj/item/melee/baton, /obj/item/melee/baton/loaded) //what it needs

/obj/item/stunblade_kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit


/obj/item/melee/baton/stunblade
	name = "folding stunblade"
	desc = "A stunblade made of several segments collapse into each other much like a spyglass, thus it can fit inside of the handle entirely. This utility combined with its dense metal makes it perfect for defensive maneuvers."
	item_state = "stunblade"
	icon_state = "stunblade"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'

/obj/item/melee/baton/stunblade/switch_status(new_status = FALSE, silent = FALSE)
	if(turned_on != new_status)
		turned_on = new_status
		if(!silent)
			playsound(loc, 'modular_bluemoon/fluffs/sound/weapon/stunblade.ogg', 75, 1, -1)
		if(turned_on)
			START_PROCESSING(SSobj, src)
		else
			STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/melee/baton/stunblade/update_icon_state()
	if(turned_on)
		icon_state = "stunblade_active"
		item_state = "stunblade_active"
	else if(!cell)
		icon_state = "stunblade_nocell"
		item_state = "stunblade"
	else
		icon_state = "stunblade"
		item_state = "stunblade"

/obj/item/melee/baton/stunblade/get_worn_belt_overlay(icon_file)
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "-stunblade")
