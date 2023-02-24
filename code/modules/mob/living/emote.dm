/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."

/datum/emote/living/blush/run_emote(mob/user, params)
	. = ..()
	if(. && isrobotic(user))
		do_fake_sparks(5,FALSE,user)

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "поднимает руку."
	message_param = "поднимает руку при виде %t."
	restraint_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/gasp_female1.ogg', 'sound/voice/gasp_female2.ogg', 'sound/voice/gasp_female3.ogg', 'sound/voice/gasp_female4.ogg', 'sound/voice/gasp_female5.ogg', 'sound/voice/gasp_female6.ogg', 'sound/voice/gasp_female7.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/gasp_male1.ogg', 'sound/voice/gasp_male2.ogg', 'sound/voice/gasp_male3.ogg', 'sound/voice/gasp_male4.ogg', 'sound/voice/gasp_male5.ogg', 'sound/voice/gasp_male6.ogg', 'sound/voice/gasp_male7.ogg',), 50, 1)

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрещивает свои руки."
	restraint_check = TRUE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "хихикает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/chuckle/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/chuckle_f.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/chuckle_m.ogg'), 50, 1)

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "падает с ног!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/cough/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/female_cough1.ogg', 'sound/voice/female_cough2.ogg', 'sound/voice/female_cough3.ogg', 'sound/voice/female_cough4.ogg', 'sound/voice/female_cough5.ogg', 'sound/voice/female_cough6.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/male_cough1.ogg', 'sound/voice/male_cough2.ogg', 'sound/voice/male_cough3.ogg', 'sound/voice/male_cough4.ogg'), 50, 1)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "радостно танцует."
	restraint_check = TRUE

/datum/emote/living/dance/run_emote(mob/user, params)
	. = ..()
	if(.)
		user.SpinAnimation(8,4)
		user.spin(30, 1)

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "застывает и падает без сил, глаза мертвы и безжизненны..."
	message_robot = "на мгновение яростно вздрагивает, а затем падает неподвижно. Его механические глаза медленно темнеют."
	message_AI = "выпускает шквал искр. Его экран мерцает, когда его системы медленно останавливаются..."
	message_alien = "издает слабеющий гортанный крик, когда зеленая кровь пузырится из его пасти..."
	message_larva = "выпускает воздух с тошнотворным шипением и падает на пол...."
	message_monkey = "издает свой последний крик, когда последние частицы души уходят из тела и наконец-то... перестает двигаться..."
	message_simple =  "прекращает всякое движение..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
    var/mob/living/simple_animal/S = user
    if(istype(S) && S.deathmessage)
        message_simple = S.deathmessage
    . = ..()
    message_simple = initial(message_simple)
    if(. && user.deathsound)
        if(isliving(user))
            var/mob/living/L = user
            if(!L.can_speak_vocal() || L.oxyloss >= 50)
                return //stop the sound if oxyloss too high/cant speak
        playsound(user, pick(user.deathsound), 200, 0, 0)
    if(. && isalienadult(user))
        playsound(user.loc, 'sound/voice/hiss6.ogg', 80, 1, 1)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "падает без сознания."

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "хлопает крыльями."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if(H.dna.species.mutant_bodyparts["wingsopen"])
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "ГНЕВНО хлопает крыльями!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "издаёт гулкий зук."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
//bluemoon add start
/datum/emote/living/gasp/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick(
			'sound/voice/gasp_female1.ogg',
			'sound/voice/gasp_female2.ogg',
			'sound/voice/gasp_female3.ogg',
			'sound/voice/gasp_female4.ogg',
			'sound/voice/gasp_female5.ogg',
			'sound/voice/gasp_female6.ogg',
			'sound/voice/gasp_female7.ogg'),
		10, TRUE, extrarange = -13) //2 tiles around
	else
		playsound(C, pick(
			'sound/voice/gasp_male1.ogg',
			'sound/voice/gasp_male2.ogg',
			'sound/voice/gasp_male3.ogg',
			'sound/voice/gasp_male4.ogg',
			'sound/voice/gasp_male5.ogg',
			'sound/voice/gasp_male6.ogg',
			'sound/voice/gasp_male7.ogg'),
		10, TRUE, extrarange = -13) //2 tiles around
//bluemoon add end
/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "тихо хихикает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/female_giggle1.ogg', 'sound/voice/female_giggle2.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/male_giggle1.ogg', 'sound/voice/male_giggle2.ogg'), 50, 1)

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "смотрит с ненавистью."
	message_param = "смотрит с ненавистью на %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "ухмыляется."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "рычит!"
	var/sound = 'sound/voice/roar.ogg'
	message_mime = "делает вид, что рычит!"

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "гримасничает."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "отправляет воздушный поцелуй."
	message_param = "отправляет воздушный поцелуй для %t."
	emote_type = EMOTE_AUDIBLE

/* Потом как-нибудь.
/datum/emote/living/kiss/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/kiss_type = /obj/item/hand_item/kisser

	if(HAS_TRAIT(user, TRAIT_KISS_OF_DEATH))
		kiss_type = /obj/item/hand_item/kisser/death

	var/obj/item/kiss_blower = new kiss_type(user)
	if(user.put_in_hands(kiss_blower))
		to_chat(user, span_notice("You ready your kiss-blowing hand."))
	else
		qdel(kiss_blower)
		to_chat(user, span_warning("You're incapable of blowing a kiss in your current state."))

/obj/item/hand_item/kisser
	name = "kiss"
	desc = "I want you all to know, everyone and anyone, to seal it with a kiss."
	icon = 'icons/mob/simple/animal.dmi'
	icon_state = "heart"
	inhand_icon_state = "nothing"
	/// The kind of projectile this version of the kiss blower fires
	var/kiss_type = /obj/projectile/kiss
	/// TRUE if the user was aiming anywhere but the mouth when they offer the kiss, if it's offered
	var/cheek_kiss

/obj/item/hand_item/kisser/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	. |= AFTERATTACK_PROCESSED_ITEM
	if(HAS_TRAIT(user, TRAIT_GARLIC_BREATH))
		kiss_type = /obj/projectile/kiss/french

	if(HAS_TRAIT(user, TRAIT_CHEF_KISS))
		kiss_type = /obj/projectile/kiss/chef

	var/obj/projectile/blown_kiss = new kiss_type(get_turf(user))
	user.visible_message("<b>[user]</b> blows \a [blown_kiss] at [target]!", span_notice("You blow \a [blown_kiss] at [target]!"))

	//Shooting Code:
	blown_kiss.original = target
	blown_kiss.fired_from = user
	blown_kiss.firer = user // don't hit ourself that would be really annoying
	blown_kiss.impacted = list(user = TRUE) // just to make sure we don't hit the wearer
	blown_kiss.preparePixelProjectile(target, user)
	blown_kiss.fire()
	qdel(src)

/obj/item/hand_item/kisser/on_offered(mob/living/carbon/offerer, mob/living/carbon/offered)
	if(!(locate(/mob/living/carbon) in orange(1, offerer)))
		return TRUE

	cheek_kiss = (offerer.zone_selected != BODY_ZONE_PRECISE_MOUTH)
	offerer.visible_message(span_notice("[offerer] leans in slightly, offering a kiss[cheek_kiss ? " on the cheek" : ""]!"),
		span_notice("You lean in slightly, indicating you'd like to offer a kiss[cheek_kiss ? " on the cheek" : ""]!"), null, 2)
	offerer.apply_status_effect(/datum/status_effect/offering/no_item_received, src)
	return TRUE

/obj/item/hand_item/kisser/on_offer_taken(mob/living/carbon/offerer, mob/living/carbon/taker)
	var/obj/projectile/blown_kiss = new kiss_type(get_turf(offerer))
	offerer.visible_message("<b>[offerer]</b> gives [taker] \a [blown_kiss][cheek_kiss ? " on the cheek" : ""]!!", span_notice("You give [taker] \a [blown_kiss][cheek_kiss ? " on the cheek" : ""]!"), ignored_mobs = taker)
	to_chat(taker, span_nicegreen("[offerer] gives you \a [blown_kiss][cheek_kiss ? " on the cheek" : ""]!"))
	offerer.face_atom(taker)
	taker.face_atom(offerer)
	offerer.do_item_attack_animation(taker, used_item=src)
	//We're still firing a shot here because I don't want to deal with some weird edgecase where direct impacting them with the projectile causes it to freak out because there's no angle or something
	blown_kiss.original = taker
	blown_kiss.fired_from = offerer
	blown_kiss.firer = offerer // don't hit ourself that would be really annoying
	blown_kiss.impacted = list(offerer = TRUE) // just to make sure we don't hit the wearer
	blown_kiss.preparePixelProjectile(taker, offerer)
	blown_kiss.suppressed = SUPPRESSED_VERY // this also means it's a direct offer
	blown_kiss.fire()
	qdel(src)
	return TRUE // so the core offering code knows to halt

/obj/item/hand_item/kisser/death
	name = "kiss of death"
	desc = "If looks could kill, they'd be this."
	color = COLOR_BLACK
	kiss_type = /obj/projectile/kiss/death

/obj/projectile/kiss
	name = "kiss"
	icon = 'icons/mob/simple/animal.dmi'
	icon_state = "heart"
	hitsound = 'sound/effects/kiss.ogg'
	hitsound_wall = 'sound/effects/kiss.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	speed = 1.6
	damage_type = BRUTE
	damage = 0
	nodamage = TRUE // love can't actually hurt you
	armour_penetration = 100 // but if it could, it would cut through even the thickest plate

/obj/projectile/kiss/fire(angle, atom/direct_target)
	if(firer)
		name = "[name] blown by [firer]"
	return ..()

/obj/projectile/kiss/Impact(atom/A)
	if(!nodamage || !isliving(A)) // if we do damage or we hit a nonliving thing, we don't have to worry about a harmless hit because we can't wrongly do damage anyway
		return ..()

	harmless_on_hit(A)
	qdel(src)
	return FALSE

/**
 * To get around shielded modsuits & such being set off by kisses when they shouldn't, we take a page from hallucination projectiles
 * and simply fake our on hit effects. This lets kisses remain incorporeal without having to make some new trait for this one niche situation.
 * This fake hit only happens if we can deal damage and if we hit a living thing. Otherwise, we just do normal on hit effects.
 */
/obj/projectile/kiss/proc/harmless_on_hit(mob/living/living_target)
	playsound(get_turf(living_target), hitsound, 100, TRUE)
	if(!suppressed)  // direct
		living_target.visible_message(span_danger("[living_target] is hit by \a [src]."), span_userdanger("You're hit by \a [src]!"), vision_distance=COMBAT_MESSAGE_RANGE)

	living_target.add_mob_memory(/datum/memory/kissed, deuteragonist = firer)
	living_target.add_mood_event("kiss", /datum/mood_event/kiss, firer, suppressed)
	if(isliving(firer))
		var/mob/living/kisser = firer
		kisser.add_mob_memory(/datum/memory/kissed, protagonist = living_target, deuteragonist = firer)
	try_fluster(living_target)

/obj/projectile/kiss/proc/try_fluster(mob/living/living_target)
	// people with the social anxiety quirk can get flustered when hit by a kiss
	if(!HAS_TRAIT(living_target, TRAIT_ANXIOUS) || (living_target.stat > SOFT_CRIT) || living_target.is_blind())
		return
	if(HAS_TRAIT(living_target, TRAIT_FEARLESS) || prob(50)) // 50% chance for it to apply, also immune while on meds
		return

	var/other_msg
	var/self_msg
	var/roll = rand(1, 3)
	switch(roll)
		if(1)
			other_msg = "stumbles slightly, turning a bright red!"
			self_msg = "You lose control of your limbs for a moment as your blood rushes to your face, turning it bright red!"
			living_target.adjust_confusion(rand(5 SECONDS, 10 SECONDS))
		if(2)
			other_msg = "stammers softly for a moment before choking on something!"
			self_msg = "You feel your tongue disappear down your throat as you fight to remember how to make words!"
			addtimer(CALLBACK(living_target, TYPE_PROC_REF(/atom/movable, say), pick("Uhhh...", "O-oh, uhm...", "I- uhhhhh??", "You too!!", "What?")), rand(0.5 SECONDS, 1.5 SECONDS))
			living_target.adjust_stutter(rand(10 SECONDS, 30 SECONDS))
		if(3)
			other_msg = "locks up with a stunned look on [living_target.p_their()] face, staring at [firer ? firer : "the ceiling"]!"
			self_msg = "Your brain completely fails to process what just happened, leaving you rooted in place staring at [firer ? "[firer]" : "the ceiling"] for what feels like an eternity!"
			living_target.face_atom(firer)
			living_target.Stun(rand(3 SECONDS, 8 SECONDS))

	living_target.visible_message("<b>[living_target]</b> [other_msg]", span_userdanger("Whoa! [self_msg]"))

/obj/projectile/kiss/on_hit(atom/target, blocked, pierce_hit)
	def_zone = BODY_ZONE_HEAD // let's keep it PG, people
	. = ..()
	if(isliving(target))
		var/mob/living/living_target = target
		living_target.add_mood_event("kiss", /datum/mood_event/kiss, firer, suppressed)
		try_fluster(living_target)

/obj/projectile/kiss/death
	name = "kiss of death"
	nodamage = FALSE // okay i kinda lied about love not being able to hurt you
	damage = 35
	wound_bonus = 0
	sharpness = SHARP_POINTY
	color = COLOR_BLACK

/obj/projectile/kiss/death/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(!iscarbon(target))
		return
	var/mob/living/carbon/heartbreakee = target
	var/obj/item/organ/internal/heart/dont_go_breakin_my_heart = heartbreakee.getorganslot(ORGAN_SLOT_HEART)
	dont_go_breakin_my_heart.applyOrganDamage(999)


/obj/projectile/kiss/french
	name = "french kiss (is that a hint of garlic?)"
	color = "#f2e9d2" //Scientifically proven to be the colour of garlic

/obj/projectile/kiss/french/harmless_on_hit(mob/living/living_target)
	. = ..()
	//Don't stack the garlic
	if(! living_target.has_reagent(/datum/reagent/consumable/garlic) )
		//Phwoar
		living_target.reagents.add_reagent(/datum/reagent/consumable/garlic, 1)
	living_target.visible_message("[living_target] has a funny look on [living_target.p_their()] face.", "Wow, that is a strong after taste of garlic!", vision_distance=COMBAT_MESSAGE_RANGE)

/obj/projectile/kiss/chef
	name = "chef's kiss"

// If our chef's kiss hits a food item, we will improve it with love.
/obj/projectile/kiss/chef/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(!IS_EDIBLE(target) || !target.reagents)
		return
	if(!firer || !target.Adjacent(firer))
		return

	// From here on, no message
	suppressed = SUPPRESSED_VERY

	if(!HAS_TRAIT_FROM(target, TRAIT_FOOD_CHEF_MADE, REF(firer)))
		to_chat(firer, span_warning("Wait a second, you didn't make this [target.name]. How can you claim it as your own?"))
		return
	if(target.reagents.has_reagent(/datum/reagent/love))
		to_chat(firer, span_warning("You've already blessed [target.name] with your heart and soul."))
		return

	var/amount_nutriment = target.reagents.get_multiple_reagent_amounts(typesof(/datum/reagent/consumable/nutriment))
	if(amount_nutriment <= 0)
		to_chat(firer, span_warning("There's not enough nutrition in [target.name] for it to be a proper meal."))
		return

	to_chat(firer, span_green("You deliver a chef's kiss over [target], declaring it perfect."))
	target.visible_message(span_notice("[firer] delivers a chef's kiss over [target]."), ignored_mobs = firer)
	target.reagents.add_reagent(/datum/reagent/love, clamp(amount_nutriment / 4, 1, 10)) // clamped to about half of the most dense food I think we have (super bite burger)
*/

/datum/emote/living/audio_emote
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/audio_emote/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent && (!C.mind || !C.mind.miming)

/datum/emote/living/audio_emote/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеётся."
	message_mime = "тихо смеётся!"

/datum/emote/living/audio_emote/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user)) //Citadel Edit because this is hilarious
		var/mob/living/carbon/C = user
		if(iscatperson(C))	//we ask for is cat first because they're a subtype that tests true for ishumanbasic because HERESY
			playsound(C, pick('sound/voice/catpeople/nyahaha1.ogg',
			'sound/voice/catpeople/nyahaha2.ogg',
			'sound/voice/catpeople/nyaha.ogg',
			'sound/voice/catpeople/nyahehe.ogg'),
			50, 1)
			return
		else if(isinsect(C))
			playsound(C, 'sound/voice/moth/mothlaugh.ogg', 50, 1)
		else if(isjellyperson(C))
			var/mob/living/carbon/human/H = C
			if(H.dna.features["mam_ears"] == "Cat" || H.dna.features["mam_ears"] == "Cat, Big") //slime have cat ear. slime go nya.
				playsound(C, pick('sound/voice/jelly/nyahaha1.ogg',
				'sound/voice/jelly/nyahaha2.ogg',
				'sound/voice/jelly/nyaha.ogg',
				'sound/voice/jelly/nyahehe.ogg'),
				50, 1)
				return
			else if(user.gender == FEMALE)
				playsound(C, 'sound/voice/jelly/womanlaugh.ogg', 50, 1)
				return
			else
				playsound(C, pick('sound/voice/jelly/manlaugh1.ogg', 'sound/voice/jelly/manlaugh2.ogg'), 50, 1)
				return
		else if(ishumanbasic(C))
			if(user.gender == FEMALE)
				playsound(C, pick('sound/voice/human/womanlaugh.ogg', 'sound/voice/female_laugh1.ogg', 'sound/voice/female_laugh2.ogg', 'sound/voice/female_laugh3.ogg'), 50, 1)
			else
				playsound(C, pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg', 'sound/voice/laugh_m1.ogg', 'sound/voice/laugh_m2.ogg', 'sound/voice/laugh_m3.ogg'), 50, 1)

/datum/emote/living/audio_emote/chitter
	key = "chitter"
	key_third_person = "chitters"
	message = "читтерит."
	message_mime = "тихо читтерит!"

/datum/emote/living/audio_emote/chitter/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user)) //Citadel Edit because this is hilarious
		var/mob/living/carbon/C = user
		if(isinsect(C))
			playsound(C, 'sound/voice/moth/mothchitter.ogg', 50, 1)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает своей головой."
	message_param = "кивает своей головой в согласии с %t."

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='userdanger'>falling down</span> in the process!"
				H.DefaultCombatKnockdown(20)
			else
				message_param = "<span class='userdanger'>bumps [user.ru_ego()] head on the ground</span> trying to motion towards %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "дуется."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит."
	message_mime = "изображает крик!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмурится."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "качает своей головой в отрицании."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "вздрагивает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/sigh_female.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/sigh_male.ogg'), 50, 1)

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "садится."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."

/datum/emote/living/smirk
	key = "smirk"
	key_third_person = "smirks"
	message = "ухмыляется."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sneeze/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/sneezef1.ogg', 'sound/voice/sneezef2.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/sneezem1.ogg', 'sound/voice/sneezem2.ogg'), 50, 1)

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "самодовольно ухмыляется."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sniff/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/sniff_f1.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/sniff_m1.ogg'), 50, 1)

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "спит."
	message_mime = "спит со странным звуком."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пристально смотрит."
	message_param = "пристально смотрит на %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "вытягивает руки."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "печально опускает руки."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "складывает руки за голову и падает на землю, <b>ОДНОЗНАЧНО сдается!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		//Skyrat change start
		if(L.client?.prefs?.autostand)
			if(!(L.combat_flags & COMBAT_FLAG_INTENTIONALLY_RESTING))
				TOGGLE_BITFIELD(L.combat_flags, COMBAT_FLAG_INTENTIONALLY_RESTING)
		L.DefaultCombatKnockdown(300)
		L.Stun(50) //Skyrat Change
		L.set_resting(TRUE) //Skyrat change

		//L.disable_combat_mode(FALSE) //doesn't work at all
		//Skyrat change stop
/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "головокружительно раскачивается."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "дрожит от страха!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дёргается."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дёргается."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет рукой."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "изображает боль."

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слабо улыбается."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/yawn/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE)
		playsound(C, pick('sound/voice/female_yawn1.ogg', 'sound/voice/female_yawn2.ogg'), 50, 1)
	else
		playsound(C, pick('sound/voice/male_yawn1.ogg', 'sound/voice/male_yawn2.ogg'), 50, 1)


/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null
	emote_type = EMOTE_BOTH

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Custom Emote", null, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			message = custom_emote
	else
		message = params
	message = user.say_emphasis(message)
	. = ..()
	message = null

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/AISyndiHack
	key = "hack"
	key_third_person = "hacks"
	message = "в процессе взлома Синдикатом."
	sound = 'sound/machines/AISyndiHack.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human, /mob/camera/aiEye)

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "издаёт звуковые сигналы."
	message_param = "издаёт звуковые сигналы на %t."
	sound = 'sound/machines/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human, /mob/camera/aiEye)

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>Вы делаете круг пальцами своей руки.</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>У вас нет свободных рук, чтобы сделать круг..</span>")

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>Ты готовишь свою руку для пощечины.</span>")
	else
		to_chat(user, "<span class='warning'>Ты не способен на пощечины в своем нынешнем состоянии.</span>")

/datum/emote/living/audio_emote/blorble
	key = "blorble"
	key_third_person = "blorbles"
	message = "блорбл!"
	message_param = "блорбит на %t!!"

/datum/emote/living/audio_emote/blorble/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(isjellyperson(C))
			playsound(C, 'sound/effects/attackblob.ogg', 50, 1)

/datum/emote/living/audio_emote/blurp
	key = "blurp"
	key_third_person = "blurps"
	message = "блурп!"
	message_param = "блурпит прямо на %t!!"

/datum/emote/living/audio_emote/blurp/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(isjellyperson(C))
			pick(playsound(C, 'sound/effects/meatslap.ogg', 50, 1),playsound(C, 'sound/effects/gib_step.ogg', 50, 1))
