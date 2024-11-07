/obj/item/implant/mindshield
	name = "Mindshield Implant"
	desc = "Protects against brainwashing."
	activated = 0

/obj/item/implant/mindshield/get_data()
	var/dat = {"<b>Технические характеристики Импланта Защиты Разума:</b><BR>
				<b>Название:</b> Имплантат для Защиты Разума под производством Мега-Корпорации Nanotrasen<BR>
				<b>Время Износа:</b> Десять Лет.<BR>
				<b>Дополнительные Сведения:</b> Лица, которым вводится это микро-устройство, гораздо более устойчивы к "промыванию мозгов".<BR>
				<HR>
				<b>Дополнительная информация по импланту:</b><BR>
				<b>Функционал:</b> Содержит небольшую капсулу с наноботами, что защищают психологические функции носителя от воздействия со стороны.<BR>
				<b>Дополнительные Функции:</b> Предотвращает и лечит большинство форм промывания мозгов.<BR>
				<b>Целостность:</b> Имплантат будет работать до тех пор, пока наноботы и микро-станция подзарядки остаётся в теле."}
	return dat


/obj/item/implant/mindshield/implant(mob/living/target, mob/user, silent = FALSE)
	if(..())
		if(!target.mind)
			ADD_TRAIT(target, TRAIT_MINDSHIELD, "implant")
			target.sec_hud_set_implants()
			return TRUE

		if(target.mind.has_antag_datum(/datum/antagonist/brainwashed))
			target.mind.remove_antag_datum(/datum/antagonist/brainwashed)

		if(target.mind.has_antag_datum(ANTAG_DATUM_VASSAL))
			SSticker.mode.remove_vassal(target.mind)

		if(target.mind.has_antag_datum(/datum/antagonist/rev/head) || target.mind.has_antag_datum(/datum/antagonist/cult) || target.mind.has_antag_datum(/datum/antagonist/clockcult) || (target.mind.unconvertable))
			if(!silent)
				target.visible_message("<span class='warning'>[target] сопротивляется Импланту Защиты Разума!</span>", "<span class='warning'>Вы сопротивляетесь Импланту Защиты Разума!</span>")
			var/obj/item/implanter/I = loc
			removed(target, 1)
			qdel(src)
			if(istype(I))
				I.imp = null
				I.update_icon()
			return FALSE

		var/datum/antagonist/gang/gang = target.mind.has_antag_datum(/datum/antagonist/gang)
		var/datum/antagonist/rev/rev = target.mind.has_antag_datum(/datum/antagonist/rev)
		if(rev)
			rev.remove_revolutionary(FALSE, user)
		if(gang)
			target.mind.remove_antag_datum(/datum/antagonist/gang)
		if(!silent)
			if(target.mind in SSticker.mode.cult)
				to_chat(target, "<span class='warning'>Вы сопротивляетесь Импланту Защиты Разума!</span>")
			else
				to_chat(target, "<span class='notice'>Вы ощущаете чувство покоя и безопасности. Теперь вы защищены от промывания мозгов.</span>")
		ADD_TRAIT(target, TRAIT_MINDSHIELD, "implant")
		target.sec_hud_set_implants()
		return TRUE
	return FALSE

/obj/item/implant/mindshield/removed(mob/target, silent = FALSE, special = 0)
	if(..())
		if(isliving(target))
			var/mob/living/L = target
			REMOVE_TRAIT(L, TRAIT_MINDSHIELD, "implant")
			L.sec_hud_set_implants()
		if(target.stat != DEAD && !silent)
			to_chat(target, "<span class='boldnotice'>Вы ощущаете чувство покоя и безопасности. Теперь вы защищены от промывания мозгов.</span>")
		return TRUE
	return FALSE

/obj/item/implanter/mindshield
	name = "Implanter (Mindshield)"
	imp_type = /obj/item/implant/mindshield

/obj/item/implantcase/mindshield
	name = "implant case - 'Mindshield'"
	desc = "A glass case containing a mindshield implant."
	imp_type = /obj/item/implant/mindshield
