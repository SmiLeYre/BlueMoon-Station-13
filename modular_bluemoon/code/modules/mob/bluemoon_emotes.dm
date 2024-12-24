/datum/emote/sound/human/growl
	key = "growl"
	key_third_person = "growl"
	message = "growl!"
	message_mime = "growl."
	sound = 'sound/voice/growl.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/sound/human/wurble
	key = "wurble"
	key_third_person = "wurble"
	message = "wurble!"
	message_mime = "wurble."
	sound = 'sound/voice/wurble.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/sound/human/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warble!"
	message_mime = "warble."
	sound = 'sound/voice/warbles.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/sound/human/trills
	key = "trills"
	key_third_person = "trills"
	message = "trills!"
	message_mime = "trills."
	sound = 'sound/voice/trills.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/sound/human/woof
	key = "woof"
	key_third_person = "woofs"
	message = "lets out a woof."
	message_mime = "lets out a woof."
	sound = 'sound/voice/woof.ogg'

/datum/emote/sound/human/cloaker1
	key = "cloaker"
	key_third_person = "cloaker"
	message = "aggressively approaching."
	message_mime = null
	sound = 'sound/voice/cloaker1.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cloaker2
	key = "cloaker2"
	key_third_person = "cloaker2"
	message = "clearly demands to stop beating yourself."
	message_mime = null
	sound = 'sound/voice/cloaker2.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cloaker3
	key = "cloaker3"
	key_third_person = "cloaker3"
	message = "explains the reason for the detention."
	message_mime = null
	sound = 'sound/voice/cloaker3.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cloaker4
	key = "cloaker4"
	key_third_person = "cloaker4"
	message = "approves the Safe Word."
	message_mime = null
	sound = 'sound/voice/cloaker4.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cluwne
	key = "cluwne"
	key_third_person = "cluwnes"
	message = "clowning around; laughs terribly..."
	message_mime = null
	sound = 'sound/voice/cluwnelaugh1.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cluwne/run_emote(mob/user, params)
	// Set random emote sound
	sound = pick('sound/voice/cluwnelaugh1.ogg', 'sound/voice/cluwnelaugh2.ogg', 'sound/voice/cluwnelaugh3.ogg')

	// Return normally
	. = ..()

/datum/emote/sound/human/suka1
	key = "suka"
	key_third_person = "suka"
	message = "seems to be very angry."
	message_mime = null
	sound = 'sound/voice/human/bear_fight.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/suka2
	key = "suka2"
	key_third_person = "suka2"
	message = "seems to be very angry."
	message_mime = null
	sound = 'sound/voice/bear_fight2.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/jacket1
	key = "jacket"
	key_third_person = "jacket"
	message = "speaking: <b>'Help Is On The Way!'</b>"
	message_mime = null
	sound = 'sound/voice/jacket1.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/jacket2
	key = "jacket2"
	key_third_person = "jacket2"
	message = "speaking: <b>'Help Is On The Way!'</b>"
	message_mime = null
	sound = 'sound/voice/jacket2.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/bulldozer1
	key = "bulldozer"
	key_third_person = "bulldozer"
	message = "yelling: <b>'You're up against the wall and I am the fucking wall!'</b>"
	message_mime = null
	sound = 'sound/voice/bulldozer1.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/bulldozer2
	key = "bulldozer2"
	key_third_person = "bulldozer2"
	message = "yelling: <b>'Please, stay alive a little bit longer, so I can kill you myself!!'</b>"
	message_mime = null
	sound = 'sound/voice/bulldozer2.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/cheekybreeky
	key = "cheekybreeky"
	key_third_person = "cheekybreeky"
	message = "yells: <b>'Cheeky Breeky and v Damke!'</b>"
	message_mime = null
	sound = 'sound/voice/human/cheekibreeki.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/sound/human/anyo
	key = "anyo"
	key_third_person = "anyo"
	message = "lets out a <b>anyo!</b>"
	message_mime = null
	sound = 'sound/voice/anyo.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/sound/human/ura1
	key = "ura"
	key_third_person = "ura"
	message = "lets out a <b>ura!</b>"
	message_mime = null
	sound = 'sound/voice/ura1.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/sound/human/ura2
	key = "ura2"
	key_third_person = "ura2"
	message = "lets out a <b>mega-ura!</b>"
	message_mime = null
	sound = 'sound/voice/ura2.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/sound/human/ura3
	key = "ura3"
	key_third_person = "ura3"
	message = "lets out a <b>mega-ultra-URAAAAAAAAAA!</b>"
	message_mime = null
	sound = 'sound/voice/ura3.ogg'
	emote_cooldown = 15 SECONDS

/datum/emote/sound/human/uwu
	key = "uwu"
	key_third_person = "uwu"
	message = "lets out an <b>~UwU~</b>"
	message_mime = null
	sound = 'sound/voice/uwu1.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/sound/human/uwu/run_emote(mob/user, params)
	sound = pick('sound/voice/uwu1.ogg','sound/voice/uwu2.ogg')
	. = ..()

/datum/emote/sound/human/real_agony
	key = "realagony"
	key_third_person = "realagony"
	message = "кричит в агонии!"
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 5 SECONDS

/datum/emote/sound/human/real_agony/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(iscarbon(user))
		var/mob/living/carbon/c = user
		c.reindex_screams()
	if(!user.is_muzzled() && !miming)
		if(issilicon(user))
			sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(iscyborg(user))
				var/mob/living/silicon/robot/S = user
				if(S.cell?.charge < 20)
					to_chat(S, "<span class='warning'>Модуль крика деактивирован. Пожалуйста, перезарядитесь.</span>")
					return
				S.cell.use(200)
		if(ismonkey(user))
			sound = 'modular_citadel/sound/voice/scream_monkey.ogg'
		if(istype(user, /mob/living/simple_animal/hostile/gorilla))
			sound = 'sound/creatures/gorilla.ogg'
		if(ishuman(user))
			user.adjustOxyLoss(10)
			if(user.gender != FEMALE && !(user.gender == PLURAL && isfeminine(user)))
				sound = pick('modular_bluemoon/smiley/sounds/emotes/agony_male_1.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_2.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_3.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_4.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_5.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_6.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_7.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_8.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_9.ogg')
			else
				sound = pick('modular_bluemoon/smiley/sounds/emotes/agony_female_1.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_female_2.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_female_3.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/skeleton))
				sound = 'modular_citadel/sound/voice/scream_skeleton.ogg'
			if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
				sound = 'modular_citadel/sound/voice/scream_moth.ogg'
			if(is_species(user, /datum/species/mammal/vox))
				sound = 'modular_bluemoon/kovac_shitcode/sound/species/voxscream.ogg'
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		LAZYINITLIST(user.alternate_screams)
		if(LAZYLEN(user.alternate_screams))
			sound = pick(user.alternate_screams)
		playsound(user.loc, sound, 75, 1, 4, 1.2)
		message = "кричит в агонии!"
	else if(miming)
		message = "изображает крик агонии."
	else
		message = "издает крайне громкий звук."
	. = ..()

/datum/emote/sound/human/rawr2
	key = "rawr2"
	key_third_person = "rawr2"
	message = "издаёт звук - <b>RAWR!</b>"
	message_mime = "строит грозную мину!"
	sound = 'sound/voice/rawr2.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/rocking
	key = "rocking"
	key_third_person = "rocking"
	message = "издаёт звук - <b>LIGHT WEIGHT BABY!</b>"
	message_mime = "строит грозную мину!"
	sound = 'sound/voice/light_weight_baby.ogg'
	emote_cooldown = 15 SECONDS

/datum/emote/sound/human/affirmative
	key = "affirmative"
	key_third_person = "affirmative"
	message = "испускает <b>утвердительный</b> сигнал"
	message_mime = "быстро кивает"
	sound = 'sound/machines/synth_yes.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/negative
	key = "negative"
	key_third_person = "negative"
	message = "испускает <b>отрицательный</b> сигнал"
	message_mime = "быстро мотает головой"
	sound = 'sound/machines/synth_no.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/cat_snores
	key = "catsnore"
	key_third_person = "catsnores"
	message = "храпит."
	message_mime = "храпит с необычным звуком."
	sound = 'sound/voice/snore_mimimimimimi.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/cp_laugh
	key = "cplaugh"
	key_third_person = "cplaught"
	message = "издаёт вокодерский смех."
	message_mime = "издаёт вокодерский смех."
	sound = 'sound/voice/cp_laugh.ogg'
	emote_cooldown = 0.25 SECONDS

/datum/emote/sound/human/oink1
	key = "oink1"
	key_third_person = "oink1"
	message = "хрюкает."
	message_mime = "кажется, хрюкает."
	sound = 'modular_bluemoon/sound/emotes/oink1.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/oink2
	key = "oink2"
	key_third_person = "oink2"
	message = "хрюкает."
	message_mime = "кажется, хрюкает."
	sound = 'modular_bluemoon/sound/emotes/oink2.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/oink3
	key = "oink3"
	key_third_person = "oink3"
	message = "хрюкает."
	message_mime = "кажется, хрюкает."
	sound = 'modular_bluemoon/sound/emotes/oink3.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/sound/human/mrrp3
	key = "mrrp3"
	key_third_person = "mrrp3"
	message = "mrrp's."
	message_mime = "silently mrrp's."
	sound = 'modular_bluemoon/sound/emotes/mrrps3.ogg'
	emote_cooldown = 0.5 SECONDS

/datum/emote/sound/human/squeal
	key = "squeal"
	key_third_person = "squeal"
	message = "squeals."
	message_mime = "silently squeals."
	sound = 'modular_bluemoon/sound/emotes/squeal.ogg'
	emote_cooldown = 0.75 SECONDS

/datum/emote/sound/human/purr
	stat_allowed = UNCONSCIOUS
	emote_volume = 10
	emote_falloff_exponent = 4

/datum/emote/sound/human/meow4
	key = "meow4"
	key_third_person = "meow4"
	message = "meows."
	message_mime = "silently meows."
	sound = 'modular_bluemoon/sound/emotes/meow4.ogg'
	emote_cooldown = 0.5 SECONDS

/datum/emote/sound/human/meow5
	key = "meow5"
	key_third_person = "meow5"
	message = "meows."
	message_mime = "silently meows."
	sound = 'modular_bluemoon/sound/emotes/meow5.ogg'
	emote_cooldown = 0.5 SECONDS

/datum/emote/sound/human/meow6
	key = "meow6"
	key_third_person = "meow6"
	message = "meows."
	message_mime = "silently meows."
	sound = 'modular_bluemoon/sound/emotes/meow6.ogg'
	emote_cooldown = 0.5 SECONDS
