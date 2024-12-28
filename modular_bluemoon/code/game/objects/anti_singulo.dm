/obj/item/storage/lockbox/anti_singulo
	name = "Singularity Buster Kit"
	desc = "Lockbox containing experimental rocket launcher to deal with little problems."
	req_access = list(ACCESS_CE)

/obj/item/storage/lockbox/anti_singulo/PopulateContents()
	. = ..()
	for (var/i in 1 to 3)
		new /obj/item/ammo_casing/caseless/rocket/anti_singulo (src)
	new /obj/item/gun/ballistic/rocketlauncher/anti_singulo (src)

/obj/item/ammo_casing/caseless/rocket/anti_singulo
	name = "AS rocket shell"
	desc = "Ракета особого типа, предназначенная для разрушения гравитационных сингулярностей с помощью манипуляций с блюспейс-пространством."
	icon_state = "rocket-as"
	projectile_type = /obj/item/projectile/bullet/anti_singulo
	caliber = "rocket_as"

/obj/item/projectile/bullet/anti_singulo
	name = "singularity buster charge"
	icon_state = "ice_1"
	light_color = "#00ffff"
	light_power = 2
	light_range = 2
	damage = 60
	damage_type = BURN

/obj/item/projectile/bullet/anti_singulo/on_hit(atom/target, blocked = 0)
	..()

	if(istype(target, /obj/singularity/narsie))
		return

	if(istype(target, /obj/singularity))
		empulse(target.loc, 4, 10)
		explosion(target.loc, 1, 2, 3, 6)
		if(!QDELETED(target))
			qdel(target)
		return

	return BULLET_ACT_HIT

/obj/item/gun/ballistic/rocketlauncher/anti_singulo
	name = "XASL Mk.2 Singularity Buster"
	desc = "Эксперементальная Анти-Сингулярная пусковая установка. В случае чрезвычайной ситуации вам следует направить ее на сверхмассивную чёрную дыру, приближающуюся к вам."
	icon_state = "anti-singulo"
	item_state = "anti-singulo"
	mag_type = /obj/item/ammo_box/magazine/internal/anti_singulo
	pin = /obj/item/firing_pin
	fire_sound = 'sound/weapons/emitter2.ogg'

/obj/item/ammo_box/magazine/internal/anti_singulo
	name = "bazooka internal magazine"
	desc = "Этого даже не существует!"
	ammo_type = /obj/item/ammo_casing/caseless/rocket/anti_singulo
	caliber = "rocket_as"
	max_ammo = 1
	multiload = 0
