

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
		var/lastlusttimee = M.lastlusttime + 600
		var/lastlusttimecooldown = world.time
		var/gender = M.gender
		var/loc = M.loc

		if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
			wantsNoncon = TRUE

		if((!wantsNoncon) || (HAS_TRAIT(M, TRAIT_NEVERBONER)))
			M.apply_damage_type(-30, STAMINA)
			return
		else
			if(prob(50))
				var/aroused_message = pick("Вам немного жарко.", "Вы испытываете сильное сексуальное влечение.", "Вы чувствуете себя в хорошем настроении.", "Вы готовы напрыгнуть на кого-то.")
				to_chat(M, "<span class='userlove'>[aroused_message]</span>")
				if(gender == MALE || (gender == PLURAL && ismasculine(M)))
					playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/final_m1.ogg',
					'modular_sand/sound/interactions/final_m2.ogg',
					'modular_sand/sound/interactions/final_m3.ogg',
					'modular_sand/sound/interactions/final_m4.ogg',
					'modular_sand/sound/interactions/final_m5.ogg'), 90, 1, 0)
				else if(gender != MALE || (gender == PLURAL && isfeminine(M)))
					playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/final_f1.ogg',
					'modular_sand/sound/interactions/final_f2.ogg',
					'modular_sand/sound/interactions/final_f3.ogg'), 70, 1, 0)
			if(IS_STAMCRIT(M))
				if(lastlusttimee < lastlusttimecooldown)
					M.cum()





