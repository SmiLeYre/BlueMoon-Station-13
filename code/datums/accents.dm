/datum/accent

/datum/accent/proc/modify_speech(list/speech_args, datum/source, mob/living/carbon/owner) //transforms the message in some way
	return speech_args

/datum/accent/proc/add_accent(message, var/map_accent)
	var/message_length // Длинна текущего сообщения
	var/current_char // Текущий символ обрабатываемой строки
	var/current_char_ascii // HTML код символа
	var/accented_message // Сообщение с акцентом

	message_length = length(message)

	for(var/i = 1, i <= message_length, i += length(current_char))
		current_char = message[i]
		current_char_ascii = num2text(text2ascii(message[i]))

		if (current_char_ascii in map_accent)
			accented_message += pick(map_accent[current_char_ascii])
		else
			accented_message += current_char

	return accented_message

/datum/accent/lizard
	var/map_accent = list(
		"115" = list("ss", "sss","ssss"),
		"83" = list("Ss", "Sss","Ssss"),
		"99" = list("cc", "ccc","cccc"),
		"67" = list("Cc", "Ccc","Cccc"),
		"1095" = list("щщ", "щщщщ", "щщщщ"),
		"1063" = list("Щщ", "Щщщ", "Щщщщ"),
		"1078" = list("шш", "шшш","шшшш"),
		"1046" = list("Шш", "Шшш","Шшшш"),
		"1089" = list("сс", "ссс","сссс"),
		"1057" = list("Сс", "Ссс","Сссс"),
		"1096" = list("шш", "шшш","шшшш"),
		"1064" = list("Шш", "Шшш","Шшшш"),
		"1097" = list("щщ", "щщщ","щщщщ"),
		"1065" = list("Щщ", "Щщщ","Щщщщ"),
		"1079" = list("сс", "ссс","сссс"),
		"1047" = list("Сс", "Ссс","Сссс"),
		"1093" = list("хх", "ххх"),
		"1061" = list("Хх", "Ххх"),
	)

/datum/accent/lizard/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/canine
	var/map_accent = list(
		"114" = list("r","rr", "rrr","rrrr"),
		"82" = list("R","Rr", "Rrr","Rrrr"),
		"1088" = list("р","рр", "ррр","рррр"),
		"1056" = list("Р","Рр", "Ррр","Рррр"),
	)

/datum/accent/canine/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/feline
	var/map_accent = list(
		"114" = list("rr", "rrr"),
		"85" = list("Rr", "Rrr"),
		"1088" = list("рр", "ррр"),
		"1056" = list("Рр", "Ррр"),
		"1089" = list("с", "сс"),
		"1057" = list("С", "Сс"),
	)

/datum/accent/feline/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/bird
	var/map_accent = list(
		"ch" = list("ch", "chch", "chich"),
		"107" = list("k", "kk", "kik"),
		"75" = list("K", "Kk", "Kik"),
		"1095" = list("ч", "чч", "чич"),
		"1063" = list("Ч", "Чч", "Чич"),
		"1082" = list("к", "кк", "кик"),
		"1050" = list("К", "Кк", "Кик"),
	)

/datum/accent/bird/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/fly
	var/map_accent = list(
		"122" = list("z","zz", "zzz","zzzz"),
		"90" = list("Z","Zz", "Zzz","Zzzz"),
		"1079" = list("з","зз", "ззз","зззз"),
		"1047" = list("З","Зз", "Ззз","Зззз"),
		"1078" = list("ж","жж", "жжж", "жжжж"),
		"1046" = list("Ж","Жж", "Жжж", "Жжжж"),
	)

/datum/accent/fly/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/abductor/modify_speech(list/speech_args, datum/source)
	var/message = speech_args[SPEECH_MESSAGE]
	var/mob/living/carbon/user = source
	var/obj/item/organ/tongue/abductor/A = user.getorgan(/obj/item/organ/tongue/abductor)
	var/rendered = "<span class='abductor'><b>[user.name]:</b> [message]</span>"
	user.log_talk(message, LOG_SAY, tag="abductor")
	for(var/mob/living/carbon/C in GLOB.alive_mob_list)
		var/obj/item/organ/tongue/abductor/T = C.getorgan(/obj/item/organ/tongue/abductor)
		if(!T || T.mothership != A.mothership)
			continue
		to_chat(C, rendered)
	for(var/mob/M in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(M, user)
		to_chat(M, "[link] [rendered]")
	speech_args[SPEECH_MESSAGE] = ""
	return speech_args

/datum/accent/zombie/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	var/list/message_list = splittext(message, " ")
	var/maxchanges = max(round(message_list.len / 1.5), 2)

	for(var/i = rand(maxchanges / 2, maxchanges), i > 0, i--)
		var/insertpos = rand(1, message_list.len - 1)
		var/inserttext = message_list[insertpos]

		if(!(copytext(inserttext, -3) == "..."))//3 == length("...")
			message_list[insertpos] = inserttext + "..."

		if(prob(20) && message_list.len > 3)
			message_list.Insert(insertpos, "[pick("МОЗГИ", "Мозги", "Мооозгиии", "МООЗГИИИ")]...")

	speech_args[SPEECH_MESSAGE] = jointext(message_list, " ")
	return speech_args

/datum/accent/alien/modify_speech(list/speech_args, datum/source)
	playsound(source, "hiss", 25, 1, 1)
	return speech_args

/datum/accent/fluffy
	var/map_accent = list(
		"ne" = list("nye"),
		"nu" = list("nyu"),
		"na" = list("nya"),
		"no" = list("nyo"),
		"ove" = list("uv"),
		"l" = list("w"),
		"r" = list("w"),

		"не" = list("ня"),
		"ну" = list("ню"),
		"на" = list("ня"),
		"но" = list("ню"),
		"ов" = list("ув"),
		"р" = list("ря"),
		"мо" = list("мя"),
	)

/datum/accent/fluffy/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]

	if(message[1] != "*")

		speech_args[SPEECH_MESSAGE] = lowertext(message)

		message = replacetext(message, "ne", "nye")
		message = replacetext(message, "nu", "nyu")
		message = replacetext(message, "na", "nya")
		message = replacetext(message, "no", "nyo")
		message = replacetext(message, "ove", "uv")
		message = replacetext(message, "l", "w")
		message = replacetext(message, "r", "w")

		message = replacetext(message, "не", "ня")
		message = replacetext(message, "ну", "ню")
		message = replacetext(message, "на", "ня")
		message = replacetext(message, "но", "ню")
		message = replacetext(message, "ов", "ув")
		message = replacetext(message, "р", "ря")
		message = replacetext(message, "мо", "мя")

	speech_args[SPEECH_MESSAGE] = message
	return speech_args

/datum/accent/span
	var/span_flag

/datum/accent/span/modify_speech(list/speech_args)
	speech_args[SPEECH_SPANS] |= span_flag
	return speech_args

//bone tongues either have the sans accent or the papyrus accent
/datum/accent/span/sans
	span_flag = SPAN_SANS

/datum/accent/span/papyrus
	span_flag = SPAN_PAPYRUS

/datum/accent/span/robot
	span_flag = SPAN_ROBOT

/datum/accent/dullahan/modify_speech(list/speech_args, datum/source, mob/living/carbon/owner)
	if(owner)
		var/datum/component/dullahan/dullahan = owner.GetComponent(/datum/component/dullahan)
		if(dullahan)
			if(dullahan.dullahan_head)
				dullahan.dullahan_head.say(speech_args[SPEECH_MESSAGE])
	speech_args[SPEECH_MESSAGE] = ""
	return speech_args
