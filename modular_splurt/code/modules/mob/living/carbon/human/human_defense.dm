
/mob/living/carbon/human/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	. = ..()
	if(.) //To allow surgery to return properly.
		return
	if(iswendigo(user))
		var/mob/living/carbon/wendigo/M = user
		switch(M.a_intent)
			if (INTENT_HARM)
				var/damage = rand(1, 9)
				var/turf/T = get_turf(user)
				if(T.get_lumcount() < 0.2)
					damage += rand(4,10)
				if (prob(90))
					playsound(loc, "punch", 25, 1, -1)
					visible_message("<span class='danger'>[M] has punched [src]!</span>", \
							"<span class='userdanger'>[M] has punched [src]!</span>", null, COMBAT_MESSAGE_RANGE)
					var/obj/item/bodypart/affecting = get_bodypart(ran_zone(M.zone_selected))
					apply_damage(damage, BRUTE, affecting)
					log_combat(M, src, "attacked")
					M.do_attack_animation(src, ATTACK_EFFECT_PUNCH)
				else
					playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
					visible_message("<span class='danger'>[M] has attempted to punch [src]!</span>", \
						"<span class='userdanger'>[M] has attempted to punch [src]!</span>", null, COMBAT_MESSAGE_RANGE)
			if(INTENT_GRAB)
				grabbedby(M)
			if(INTENT_HELP)
				if(M == src && check_self_for_injuries())
					return
				help_shake_act(M)
			if (INTENT_DISARM)
				if (!lying)
					M.do_attack_animation(src, ATTACK_EFFECT_DISARM)
					if (prob(5))
						Unconscious(40)
						playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
						log_combat(M, src, "pushed")
						visible_message("<span class='danger'>[M] has pushed down [src]!</span>", \
							"<span class='userdanger'>[M] has pushed down [src]!</span>")
					else
						if (prob(50))
							dropItemToGround(get_active_held_item())
							playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
							visible_message("<span class='danger'>[M] has disarmed [src]!</span>", \
							"<span class='userdanger'>[M] has disarmed [src]!</span>", null, COMBAT_MESSAGE_RANGE)
						else
							playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
							visible_message("<span class='danger'>[M] has attempted to disarm [src]!</span>",\
								"<span class='userdanger'>[M] has attempted to disarm [src]!</span>", null, COMBAT_MESSAGE_RANGE)


