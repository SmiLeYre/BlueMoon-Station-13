/obj/item/ammo_box/magazine/internal/cylinder/rus357/lewd
	name = "\improper Lewd Russian revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357/lewd
	caliber = list("lewd357")

/obj/item/ammo_casing/a357/lewd
	name = "Lewd .357 bullet casing"
	desc = "A lewd .357 bullet casing."
	caliber = "lewd357"
	projectile_type = /obj/item/projectile/bullet/a357/lewd

/obj/item/projectile/bullet/a357/lewd
	name = "Lewd .357 bullet"
	damage = 0
	wound_bonus = 0

/obj/item/gun/ballistic/revolver/russian/lewd
	name = "\improper  Lewd russian revolver"
	desc = "A Russian-made revolver for cumming games. Uses .357 ammo, and has a mechanism requiring you to spin the chamber before each trigger pull. Prepare for the embarrasment."
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rus357/lewd

/obj/item/gun/ballistic/revolver/russian/lewd/afterattack(atom/target, mob/living/user, flag, params)
	. = ..(null, user, flag, params)

	if(flag)
		if(!(target in user.contents) && ismob(target))
			if(user.a_intent == INTENT_HARM) // Flogging action
				return

	if(isliving(user))
		if(!can_trigger_gun(user))
			return
	if(target != user)
		if(ismob(target))
			to_chat(user, "<span class='warning'>Don't be a pussy, be a </span> <h3>MAN</h3>")
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!spun)
			to_chat(user, "<span class='warning'>You need to spin \the [src]'s chamber first!</span>")
			return

		spun = FALSE

		if(chambered)
			var/obj/item/ammo_casing/AC = chambered
			if(AC.fire_casing(user, user))
				playsound(user, fire_sound, 50, 1)
				H.moan()
				H.cum()
				chambered = null
				user.visible_message("<span class='danger'>How about this. Rather than waste my time trying to salvage this nonsense, we just make [user.name] cum? Yeah. Fuck it. Said the coder, extremely confused.</span>")
				return

		user.visible_message("<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)
