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

//   Converter
//   https://www.rapidtables.com/convert/number/ascii-hex-bin-dec-converter.html

/datum/accent/lizard
	var/map_accent = list(
		"115" = list("ss", "sss","ssss"),	// s
		"83" = list("SS", "SSS","SSSS"),	// S
		"99" = list("cc", "ccc","cccc"),	// c
		"67" = list("СС", "ССС","СССС"),	// C
		"1095" = list("щщ", "щщщщ", "щщщщ"),// ч
		"1063" = list("ЩЩ", "ЩЩЩ", "ЩЩЩЩ"),	// Ч
		"1078" = list("шш", "шшш","шшшш"),	// ж
		"1046" = list("ШШ", "ШШШ","ШШШШ"),	// Ж
		"1089" = list("сс", "ссс","сссс"),	// с
		"1057" = list("СС", "ССС","СССС"),	// С
		"1096" = list("шш", "шшш","шшшш"),	// ш
		"1064" = list("ШШ", "ШШШ","ШШШШ"),	// Ш
		"1097" = list("щщ", "щщщ","щщщщ"),	// щ
		"1065" = list("ЩЩ", "ЩЩЩ","ЩЩЩЩ"),	// Щ
		"1079" = list("сс", "ссс","сссс"),	// з
		"1047" = list("СС", "ССС","СССС"),	// З
		"1093" = list("хх", "ххх"),			// х
		"1061" = list("ХХ", "ХХХ"),			// Х
	)

/datum/accent/lizard/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/canine
	var/map_accent = list(
		"114" = list("r","rr", "rrr","rrrr"),	// r
		"82" = list("R","RR", "RRR","RRRR"),	// R
		"1088" = list("р","рр", "ррр","рррр"),	// р
		"1056" = list("Р","РР", "РРР","РРРР"),	// Р
	)

/datum/accent/canine/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/feline
	var/map_accent = list(
		"114" = list("rr", "rrr"),	// r
		"82" = list("RR", "RRR"),	// R
		"1088" = list("рр", "ррр"),	// р
		"1056" = list("РР", "РРР"),	// Р
		"1089" = list("с", "сс"),	// с
		"1057" = list("С", "СС"),	// С
	)

/datum/accent/feline/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/bird
	var/map_accent = list(
		"107" = list("k", "kk", "kik"),	// k
		"75" = list("K", "KK", "KKK"),	// K
		"1095" = list("ч", "чч", "чич"),// ч
		"1063" = list("Ч", "ЧЧ", "ЧЧЧ"),// Ч
		"1082" = list("к", "кк", "кик"),// к
		"1050" = list("К", "КК", "КИК"),// К
	)

/datum/accent/bird/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		speech_args[SPEECH_MESSAGE] = add_accent(speech_args[SPEECH_MESSAGE], map_accent)
	return speech_args

/datum/accent/fly
	var/map_accent = list(
		"122" = list("z","zz", "zzz","zzzz"),	// z
		"90" = list("Z","ZZ", "ZZZ","ZZZZ"),	// Z
		"1079" = list("з","зз", "ззз","зззз"),	// з
		"1047" = list("З","ЗЗ", "ЗЗЗ","ЗЗЗЗ"),	// З
		"1078" = list("ж","жж", "жжж", "жжжж"),	// ж
		"1046" = list("Ж","ЖЖ", "ЖЖЖ", "ЖЖЖЖ"),	// Ж
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
