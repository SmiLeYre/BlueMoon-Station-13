/datum/accent

/datum/accent/proc/modify_speech(list/speech_args, datum/source, mob/living/carbon/owner) //transforms the message in some way
	return speech_args

/datum/accent/lizard/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	var/static/regex/lizard_hiss = new("s+", "g")
	var/static/regex/lizard_hiSS = new("S+", "g")
	var/static/regex/lizard_hicc = new("с+", "g")
	var/static/regex/lizard_hiCC = new("С+", "g")
	var/static/regex/lizard_hich = new("ч+", "g")
	var/static/regex/lizard_hiCH = new("ч+", "g")
	if(message[1] != "*")
		message = lizard_hiss.Replace_char(message, "[pick("ss", "sss")]")
		message = lizard_hiSS.Replace_char(message, "[pick("SS", "SSS")]")
		message = lizard_hicc.Replace_char(message, "[pick("сс", "ссс")]")
		message = lizard_hiCC.Replace_char(message, "[pick("СС", "ССС")]")
		message = lizard_hich.Replace_char(message, "[pick("щщ", "щщщ")]")
		message = lizard_hiCH.Replace_char(message, "[pick("ЩЩ", "ЩЩЩ")]")
	speech_args[SPEECH_MESSAGE] = message
	return speech_args

/datum/accent/canine/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	var/static/regex/Dog_rawrs = new("r+", "g")
	var/static/regex/Dog_RAWRs = new("R+", "g")
	var/static/regex/Dog_crawrs = new("р+", "g")
	var/static/regex/Dog_cRAWRs = new("Р+", "g")
	if(message[1] != "*")
		message = Dog_rawrs.Replace_char(message, "[pick("rr", "RRR")]")
		message = Dog_RAWRs.Replace_char(message, "[pick("RR", "RRR")]")
		message = Dog_crawrs.Replace_char(message, "[pick("рр", "ррр")]")
		message = Dog_cRAWRs.Replace_char(message, "[pick("РР", "РРР")]")
	speech_args[SPEECH_MESSAGE] = message
	return speech_args

/datum/accent/fly/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	var/static/regex/fly_buzz = new("z+", "g")
	var/static/regex/fly_buZZ = new("Z+", "g")
	var/static/regex/fly_buzzc = new("з+", "g")
	var/static/regex/fly_buZZc = new("З+", "g")
	var/static/regex/fly_bujj = new("ж+", "g")
	var/static/regex/fly_buJJ = new("Ж+", "g")
	if(message[1] != "*")
		message = fly_buzz.Replace_char(message, "[pick("zz", "zzz")]")
		message = fly_buZZ.Replace_char(message, "[pick("ZZ", "ZZZ")]")
		message = fly_buzzc.Replace_char(message, "[pick("зз", "ззз")]")
		message = fly_buZZc.Replace_char(message, "[pick("ЗЗ", "ЗЗЗ")]")
		message = fly_bujj.Replace_char(message, "[pick("жж", "жжж")]")
		message = fly_buJJ.Replace_char(message, "[pick("ЖЖ", "ЖЖЖ")]")
	speech_args[SPEECH_MESSAGE] = message
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

/datum/accent/fluffy/modify_speech(list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = replacetext(message, "ne", "nye")
		message = replacetext(message, "nu", "nyu")
		message = replacetext(message, "na", "nya")
		message = replacetext(message, "no", "nyo")
		message = replacetext(message, "ove", "uv")
		message = replacetext(message, "l", "w")
		message = replacetext(message, "r", "w")
	speech_args[SPEECH_MESSAGE] = lowertext(message)
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
