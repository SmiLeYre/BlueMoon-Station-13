#define INSULTS_FILE "insult.json"

/mob
	var/nextsoundemote = 10

/datum/emote/living/insult
	key = "insult"
	key_third_person = "insults"
	message = "изрыгает оскорбления."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/insult/run_emote(mob/living/user, params)
	if(user.mind?.miming)
		message = "творчески жестикулирует."
	else if(!user.is_muzzled())
		message = pick_list_replacements(INSULTS_FILE, "insult_gen")
	else
		message = "заглушает свои же слова своей кистью."
	. = ..()

/datum/emote/living/scream/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.nextsoundemote >= world.time || user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(iscarbon(user))
		var/mob/living/carbon/c = user
		c.reindex_screams()
	if(!user.is_muzzled() && !miming)
		user.nextsoundemote = world.time + 3
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
			user.adjustOxyLoss(5)
			sound = pick('modular_citadel/sound/voice/scream_m1.ogg', 'modular_citadel/sound/voice/scream_m2.ogg')
			if(user.gender == FEMALE)
				sound = pick('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
			if(is_species(user, /datum/species/jelly))
				if(user.gender == FEMALE)
					sound = pick('modular_citadel/sound/voice/scream_jelly_f1.ogg', 'modular_citadel/sound/voice/scream_jelly_f2.ogg')
				else
					sound = pick('modular_citadel/sound/voice/scream_jelly_m1.ogg', 'modular_citadel/sound/voice/scream_jelly_m2.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/lizard))
				sound = 'modular_citadel/sound/voice/scream_lizard.ogg'
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
		message = "кричит!"
	else if(miming)
		message = "изображает громкий крик."
	else
		message = "издает очень громкий звук."
	. = ..()

/datum/emote/living/snap
	key = "snap"
	key_third_person = "snaps"
	message = "щелкает пальцами."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/snap.ogg', 50, 1, -1)

/datum/emote/living/snap2
	key = "snap2"
	key_third_person = "snaps twice"
	message = "щёлкает своими пальцами дважды."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap2/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/snap2.ogg', 50, 1, -1)

/datum/emote/living/snap3
	key = "snap3"
	key_third_person = "snaps thrice"
	message = "щёлкает своими пальцами трижды."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap3/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/snap3.ogg', 50, 1, -1)

/datum/emote/living/awoo
	key = "awoo"
	key_third_person = "lets out an awoo"
	message = "воет!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/awoo/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/awoo.ogg', 100, 1, -1)
	if (HAS_TRAIT(user, TRAIT_AWOO))
		var/datum/quirk/awoo/quirk_target = locate() in user.roundstart_quirks
		quirk_target.last_awoo = world.time
		quirk_target.chance = quirk_target.default_chance
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "to_awoo", /datum/mood_event/to_awoo)


/datum/emote/living/hiss
	key = "hiss"
	key_third_person = "hisses"
	message = "шипит!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/hiss/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/hiss.ogg', 50, 1, -1)

/datum/emote/living/meow
	key = "meow"
	key_third_person = "mrowls"
	message = "мяукает!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/meow/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/meow1.ogg', 50, 1, -1)

/datum/emote/living/purr
	key = "purr"
	key_third_person = "purrs softly"
	message = "мурлычет."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE
	stat_allowed = UNCONSCIOUS //cats can purr in their sleep

/datum/emote/living/purr/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/purr.ogg', 100, 1, -1)

/datum/emote/living/nya
	key = "nya"
	key_third_person = "lets out a nya"
	message = "выпускает из своего рта странный звук!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/nya/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/nya.ogg', 50, 1, -1)

/datum/emote/living/weh
	key = "weh"
	key_third_person = "lets out a weh"
	message = "выпускает из своего рта довольно странный звук!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/weh/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/weh.ogg', 50, 1, -1)

/datum/emote/living/peep
	key = "peep"
	key_third_person = "peeps like a bird"
	message = "чирикает словно птичка!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/peep/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/peep.ogg', 50, 1, -1)

/datum/emote/living/dab
	key = "dab"
	key_third_person = "suddenly hits a dab"
	message = "внезапно бьёт воздух двумя руками!"
	emote_type = EMOTE_AUDIBLE
	restraint_check = TRUE

/datum/emote/living/mothsqueak
	key = "msqueak"
	key_third_person = "lets out a tiny squeak"
	message = "издает тоненький писк!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/mothsqueak/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/mothsqueak.ogg', 50, 1, -1)

/datum/emote/living/merp
	key = "merp"
	key_third_person = "merps"
	message = "мёрпает!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/merp/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_citadel/sound/voice/merp.ogg', 50, 1, -1)

/datum/emote/living/bark
	key = "bark"
	key_third_person = "barks"
	message = "лает!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/bark/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	var/sound = pick('modular_citadel/sound/voice/bark1.ogg', 'modular_citadel/sound/voice/bark2.ogg')
	playsound(user, sound, 50, 1, -1)

/datum/emote/living/squish
	key = "squish"
	key_third_person = "squishes"
	message = "хлюпает!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/squish/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	var/sound = pick('sound/voice/slime_squish.ogg')
	playsound(user, sound, 50, 1, -1)

/datum/emote/living/pain
	key = "pain"
	key_third_person = "pains"
	message = "кричит от боли!"
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	restraint_check = FALSE

/datum/emote/living/pain/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	var/sound
	if(user.gender == MALE)
		sound = pick('modular_citadel/sound/voice/human_male_pain_1.ogg', 'modular_citadel/sound/voice/human_male_pain_2.ogg', 'modular_citadel/sound/voice/human_male_pain_3.ogg', 'modular_citadel/sound/voice/human_male_pain_rare.ogg', 'modular_citadel/sound/voice/human_male_scream_1.ogg', 'modular_citadel/sound/voice/human_male_scream_2.ogg', 'modular_citadel/sound/voice/human_male_scream_3.ogg', 'modular_citadel/sound/voice/human_male_scream_4.ogg')
	else
		sound = pick('modular_citadel/sound/voice/human_female_pain_1.ogg', 'modular_citadel/sound/voice/human_female_pain_2.ogg', 'modular_citadel/sound/voice/human_female_pain_3.ogg', 'modular_citadel/sound/voice/human_female_scream_2.ogg', 'modular_citadel/sound/voice/human_female_scream_3.ogg', 'modular_citadel/sound/voice/human_female_scream_4.ogg')
	playsound(user, sound, 75, 0, 0)

/datum/emote/living/clap1
	key = "clap1"
	key_third_person = "claps1"
	message = "хлопает в свои ладоши один раз."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/clap1/run_emote(mob/living/user, params)
	. = ..()
	if(!.)
		return
	playsound(user, 'modular_citadel/sound/voice/clap.ogg', 50, 1, -1)
