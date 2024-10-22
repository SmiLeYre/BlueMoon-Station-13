/obj/item/pen/attack(mob/living/M, mob/user, stealth)
	if(!istype(M))
		return

	if(!force)
		if(M.can_inject(user, 1))
			if(user.a_intent == INTENT_HARM) //old poke requires harm intent.
				return ..()

			else //writing time
				var/mob/living/carbon/human/T = M
				if(!iscarbon(T)) //not carbon.
					return

				// BLUEMOON EDIT START - возможность писать на отдельных частях тела
				var/try_to_write_on_genitals = FALSE
				var/target_body_part

				target_body_part = zone2body_parts_covered_complicated(user.zone_selected)

				if(!target_body_part)
					to_chat(user, span_warning("You must choose a bodypart on your doll to write on!"))
					return

				var/list/items_on_target = list()
				items_on_target = T.get_equipped_items()

				for(var/A in items_on_target)
					var/obj/item/worn_clothes = A
					if(worn_clothes.body_parts_covered & target_body_part)
						to_chat(user, span_warning("The target body part is covered with their clothes."))
						return

				var/obj/item/G
				if(try_to_write_on_genitals && T.exposed_genitals.len)
					G = user:pick_receiving_organ(T, NONE, "Pick a genital to write on", "PRESS CANCEL to write on the targeted body part")
				// BLUEMOON ADD END

				/* BLUEMOON REMOVAL START - сверху более умная реализация по отдельным частям тела
				if(!T.is_chest_exposed())
					to_chat(user, "<span class='warning'>You cannot write on someone with their clothes on.</span>")
					return
				/ BLUEMOON REMOVAL END */

				var/obj/item/BP  = (G ? G : T.get_bodypart(user.zone_selected))

				/* BLUEMOON ADD START - перемещаем код выше
				var/obj/item/BP = (G ? G : T.get_bodypart(user.zone_selected))

				if(!BP)
					return
				/ BLUEMOON ADD END */

				var/writting = input(user, "Add writing, doesn't replace current text", "Writing on [T]")  as text|null
				if(!writting)
					return

				if(!(user==T))
					src.visible_message("<span class='notice'>[user] begins to write on [T]'s [BP:name].</span>")
				else
					to_chat(user, "<span class='notice'>You begin to write on your [BP:name].</span>")

				if(do_mob(user, T, 4 SECONDS))
					if((length(BP:writtentext))+(length(writting)) < 130) //130 character limit to stop spamming.
						BP:writtentext += html_encode(writting) //you can add to text, not remove it.
					else
						to_chat(user, "<span class='notice'>There isnt enough space to write that on [T]'s [BP:name].</span>")
						return

				if(!(user==T))
					to_chat(user, "<span class='notice'>You write on [T]'s [BP:name].</span>")
				else
					to_chat(user, "<span class='notice'>You write on your [BP:name].</span>")
	else
		. = ..()
