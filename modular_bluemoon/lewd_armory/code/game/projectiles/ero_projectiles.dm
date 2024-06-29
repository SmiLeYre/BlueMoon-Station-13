

/obj/item/projectile/beam/erodisabler
	name = "ero disabler beam"
	icon = 'modular_bluemoon/lewd_armory/icons/obj/effect/projectiles/projectile_lewd.dmi'
	icon_state = "omnilewd"
	damage = 30
	damage_type = STAMINA
	flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	eyeblur = 0
	pixels_per_second = TILES_TO_PIXELS(16.667)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/lewd_disabler/lewd
	light_color = LIGHT_COLOR_PINK
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler
	var/message = ""


/obj/item/projectile/beam/erodisabler/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		var/wantsNoncon = FALSE
		var/lastlusttime = M.lastlusttime

		if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
			wantsNoncon = TRUE

		if((!wantsNoncon) || (HAS_TRAIT(M, TRAIT_NEVERBONER)))
			M.apply_damage_type(-30, STAMINA)
			return
		else
			if(prob(50))
				var/aroused_message = pick("Вам немного жарко.", "Вы испытываете сильное сексуальное влечение.", "Вы чувствуете себя в хорошем настроении.", "Вы готовы напрыгнуть на кого-то.")
				to_chat(M, "<span class='userlove'>[aroused_message]</span>")
				if(!M.is_muzzled())
					visible_message(message = span_lewd("<B>[src]</B> [pick("постанывает", "стонет в удовольствии")]."))
				if(M.is_muzzled())
					audible_message(span_lewd("<B>[src]</B> [pick("имитирует приятный стон", "бесшумно постанывает")]."))
			if((lastlusttime < (world.time + 60)) || IS_STAMCRIT(M))
				M.cum()





