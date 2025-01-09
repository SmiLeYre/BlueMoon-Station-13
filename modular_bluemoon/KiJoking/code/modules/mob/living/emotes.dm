/datum/emote/sound/human/catscream1
	key = "catscream1"
	key_third_person = "catscreams1"
	message = "Silly screams like a cat!"
	sound = 'modular_bluemoon/KiJoking/sound/voice/catscream1.ogg'
	emote_cooldown = 1 SECONDS // I love felinid
	emote_pitch_variance = FALSE

/datum/emote/sound/human/catscream2
	key = "catscream2"
	key_third_person = "catscreams2"
	message = "Screams noisily like a cat!"
	sound = 'modular_bluemoon/KiJoking/sound/voice/catscream2.ogg'
	emote_cooldown = 1 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/catscream3
	key = "catscream3"
	key_third_person = "catscreams3"
	message = "Screams furiously like a cat!"
	sound = 'modular_bluemoon/KiJoking/sound/voice/catscream3.ogg'
	emote_cooldown = 1 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/catscream
	key = "catscream"
	key_third_person = "catscreams"
	message = "Screams like a cat!"
	sound = 'modular_bluemoon/KiJoking/sound/voice/catscream1.ogg'
	emote_cooldown = 1 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/sound/human/catscream/run_emote(mob/user, params)
	sound = pick('modular_bluemoon/KiJoking/sound/voice/catscream1.ogg', 'modular_bluemoon/KiJoking/sound/voice/catscream2.ogg')
	. = ..()
