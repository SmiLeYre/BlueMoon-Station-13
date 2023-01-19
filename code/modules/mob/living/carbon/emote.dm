/datum/emote/living/carbon/airguitar
	key = "airguitar"
	message = "is strumming the air and headbanging like a safari chimp."
	restraint_check = TRUE

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "blinks."

/datum/emote/living/carbon/blink_r
	key = "blink3"
	message = "blinks rapidly."

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/clap/run_emote(mob/living/user, params)
	. = ..()
	if (.)
		if (ishuman(user))
			// Need hands to clap
			if (!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
				return
			var/clap = pick('sound/misc/clap1.ogg',
							'sound/misc/clap2.ogg',
							'sound/misc/clap3.ogg',
							'sound/misc/clap4.ogg')
			playsound(user, clap, 50, 1, -1)

/datum/emote/living/carbon/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans!"
	message_mime = "appears to moan!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/carbon/roll
	key = "roll"
	key_third_person = "rolls"
	message = "rolls."
	restraint_check = TRUE

/datum/emote/living/carbon/screech
	key = "screech"
	key_third_person = "screeches"
	message = "screeches."

/datum/emote/living/carbon/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."
	restraint_check = TRUE

/datum/emote/living/carbon/sign
	key = "sign"
	key_third_person = "signs"
	message_param = "signs the number %t."
	restraint_check = TRUE

/datum/emote/living/carbon/sign/select_param(mob/user, params)
	. = ..()
	if(!isnum(text2num(params)))
		return message

/datum/emote/living/carbon/sign/signal
	key = "signal"
	key_third_person = "signals"
	message_param = "raises %t fingers."

/datum/emote/living/carbon/tail
	key = "tail"
	message = "waves their tail."

/datum/emote/living/carbon/wink
	key = "wink"
	key_third_person = "winks"
	message = "winks."

/datum/emote/living/carbon/human/dap
	key = "dap"
	key_third_person = "daps"
	message = "sadly can't find anybody to give daps to, and daps themself. Shameful."
	message_param = "give daps to %t."
	restraint_check = TRUE

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "raises an eyebrow."

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "grumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "shakes their own hands."
	message_param = "shakes hands with %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/hug
	key = "hug"
	key_third_person = "hugs"
	message = "hugs themself."
	message_param = "hugs %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/mawp
	key = "mawp"
	key_third_person = "mawps"
	message = "mawps annoyingly."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/mawp/run_emote(mob/living/user, params)
	. = ..()
	if(.)
		if(ishuman(user))
			if(prob(10))
				user.adjustEarDamage(-5, -5)

/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/lick
	key = "lick"
	key_third_person = "licks."

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "goes pale for a second."

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "raises a hand."
	restraint_check = TRUE

/datum/emote/living/carbon/lick
	key = "lick"
	key_third_person = "licks."
	restraint_check = TRUE

/datum/emote/living/carbon/lick/run_emote(mob/user)
	. = ..()
	if(user.get_active_held_item())
		to_chat(user, span_warning("Your active hand is full, and therefore you can't lick anything! Don't ask why!"))
		return
	var/obj/item/soap/tongue/organic/licky = new(user)
	if(user.put_in_active_hand(licky))
		to_chat(user, span_notice("You extend your tongue and get ready to lick something."))
	else
		qdel(licky)

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "shrugs."

/datum/emote/sound/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	emote_type = EMOTE_AUDIBLE

/datum/emote/sound/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "salutes."
	message_param = "salutes to %t."
	sound = 'sound/voice/salute.ogg'
	restraint_check = TRUE

/datum/emote/sound/human/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "buzzes."
	message_param = "buzzes at %t."
	sound = 'sound/machines/buzz-sigh.ogg'

/datum/emote/sound/human/buzz2
	key = "buzz2"
	message = "buzzes twice."
	sound = 'sound/machines/buzz-two.ogg'

/datum/emote/sound/human/ping
	key = "ping"
	key_third_person = "pings"
	message = "pings."
	message_param = "pings at %t."
	sound = 'sound/machines/ping.ogg'

/datum/emote/sound/human/chime
	key = "chime"
	key_third_person = "chimes"
	message = "chimes."
	sound = 'sound/machines/chime.ogg'

/datum/emote/sound/human/squeak
	key = "squeak"
	message = "squeaks."
	sound = 'sound/effects/mousesqueek.ogg'

/datum/emote/sound/human/shriek
	key = "shriek"
	key_third_person = "shrieks"
	message = "SHRIEKS!"
	sound = 'sound/voice/shriek1.ogg'

/datum/emote/sound/human/syndicate
	key = "syndicate"
	key_third_person = "syndicates"
	message = "offers warcrimes."
	sound = 'sound/voice/syndicate.ogg'

/datum/emote/sound/human/rawr
	key = "rawr"
	key_third_person = "rawrs"
	message = "rawrs aggressively."
	sound = 'sound/voice/rawr.ogg'

/datum/emote/sound/human/growl
	key = "growl2"
	key_third_person = "growls2"
	message = "growls aggressively."
	sound = 'sound/voice/growl2.ogg'

/datum/emote/sound/human/protect
	key = "protect"
	key_third_person = "protects"
	message = "folds his arms across his chest, forming an aquila."
	sound = 'sound/voice/emperorprotects.ogg'
