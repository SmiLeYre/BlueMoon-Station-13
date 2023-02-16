/proc/activate_after(obj, delay)

	var/endtime = world.time + delay
	. = 1
	while (world.time < endtime)
		stoplag()

/obj/item/dildo/proc/stuffed_movement()
	var/obj/item/organ/genital/G = loc
	var/mob/living/carbon/U = G.owner

	spawn()
		while(inside)
			if(activate_after(src, rand(5,60)))
				if(!istype(loc, /obj/item/organ/genital))
					return
				if(prob(10))
					if(dildo_size == 4)
						to_chat(U, span_userdanger(pick("Огромный дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от огромного дилдо глубоко внутри!")))
						U.handle_post_sex(NORMAL_LUST, null, U)
						U.Jitter(3)
						U.Stun(5)
						U.emote("moan")
					if(prob(5) && !dildo_size == 1)
						to_chat(U, span_userdanger(pick("Дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от дилдо глубоко внутри!")))
						U.handle_post_sex(NORMAL_LUST, null, U)
						U.Jitter(3)
						U.Stun(5)
						U.emote("moan")
					else
						to_chat(U, span_love(pick("Я чувствую дилдо внутри!", "Дилдо заполняет меня изнутри!")))
						U.handle_post_sex(LOW_LUST, null, U)
						U.do_jitter_animation()
