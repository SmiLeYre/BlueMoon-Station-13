/proc/activate_after(obj, delay)

	var/endtime = world.time + delay
	. = 1
	while (world.time < endtime)
		stoplag()

//Dildo
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

//Tentacle Panties
/obj/item/clothing/underwear/briefs/tentacle/proc/tentacle_panties(mob/living/carbon/human/M, slot)
	if(!istype(src, M.w_underwear))
		return
	while(istype(src, M.w_underwear))
		if(tired == TRUE)
			if(activate_after(src, rand(300,500)))
				tired = FALSE

		if(activate_after(src, rand(25 ,50)) && tired == FALSE)
			if(prob(15))
				if(M.has_penis())
					to_chat(M, span_userdanger(pick("Движения в уретре сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена!")))
				if(M.has_vagina())
					to_chat(M, span_userdanger(pick("Сильные фрикции внутри сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своих дырочек!")))
				M.handle_post_sex(NORMAL_LUST*2, null, M)
				M.Jitter(3)
				M.Stun(30)
				M.emote("moan")
			else
				if(M.has_penis())
					to_chat(M, span_love(pick("Я чувствую что-то у своего члена!", "Оно обсасывает мой член!")))
				if(M.has_vagina())
					to_chat(M, span_love(pick("Я чувствую что-то внутри!", "Оно движется внутри меня!", "Я ощущаю фрикции в своих дырочках!")))
				M.handle_post_sex(NORMAL_LUST, null, M)
				M.do_jitter_animation()
			lust += 10
			playsound(loc, 'modular_sand/sound/lewd/champ_fingering.ogg', 25, 1, -1)

			if(prob(50) && lust >= 200)
				tired = TRUE
				to_chat(M, span_love(pick("Оно меня обкончало!")))
				visible_message("<font color=purple><b>\The [src]</b> Вязкая жидкость стекает по бедрам [M]!</font>")
				M.reagents.add_reagent(/datum/reagent/consumable/semen, 10)
				M.reagents.add_reagent(/datum/reagent/drug/aphrodisiacplus, 5) //Cum contains hexocrocin
				new /obj/effect/decal/cleanable/semen(loc)
