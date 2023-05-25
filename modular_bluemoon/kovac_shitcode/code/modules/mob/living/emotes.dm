/datum/emote/living/vomit
	key = "vomit"
	key_third_person = "vomits"
	message = "тошнит."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/vomit/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'sound/effects/splat.ogg', 25, 1, -1)
	. = ..()

/datum/emote/living/bruv
	key = "bruv"
	key_third_person = "bruv"
	message = "испытывает неловкость."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/bruv/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'modular_bluemoon/kovac_shitcode/sound/new_emotes/bruv.ogg', 25, 1, -1)
	. = ..()

/datum/emote/living/audio/bonecrack
	key = "bonecrack"
	key_third_person = "bonecracks"
	message = "разминает суставы."
	message_mime = "делает вид, что разминает суставы."
	emote_sound = 'modular_bluemoon/kovac_shitcode/sound/new_emotes/bonecrack.ogg'
	emote_cooldown = 1.6 SECONDS

/datum/emote/living/ohyes
	key = "ohyes"
	key_third_person = "ohyes"
	message = "приятно удивлен."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/ohyes/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'modular_bluemoon/kovac_shitcode/sound/new_emotes/ohyes.ogg', 25, 1, -1)
	. = ..()

/datum/emote/living/mudak
	key = "mudak"
	key_third_person = "mudaks"
	message = "испытывает крайнюю степень недовольства."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/mudak/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'modular_bluemoon/kovac_shitcode/sound/new_emotes/mudak.ogg', 25, 1, -1)
	. = ..()
