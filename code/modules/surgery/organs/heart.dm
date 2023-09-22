/obj/item/organ/heart
	name = "heart"
	ru_name = "сердце"
	ru_name_capital = "Сердце"
	desc = "Мне жаль бессердечного ублюдка, который потерял это."
	icon_state = "heart-on"
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_HEART

	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = 2 * STANDARD_ORGAN_DECAY

	low_threshold_passed = span_info("Колющая боль появляется и исчезает в груди...")
	high_threshold_passed = span_warning("Что-то в груди болит, и боль не утихает. Ох, я дышу намного быстрее, чем раньше.")
	now_fixed = span_info("Сердце снова начинает биться.")
	high_threshold_cleared = span_info("Боль в груди утихла и дыхание стало более расслабленным.")

	// Heart attack code is in code/modules/mob/living/carbon/human/life.dm
	var/beating = 1
	var/no_pump = FALSE
	var/icon_base = "heart"
	attack_verb = list("beat", "thumped")
	var/beat = BEAT_NONE//is this mob having a heatbeat sound played? if so, which?

	var/failed = FALSE		//to prevent constantly running failing code
	var/operated = FALSE	//whether the heart's been operated on to fix some of its damages
	var/key_for_dreamer = null

/obj/item/organ/heart/update_icon_state()
	if(beating)
		icon_state = "[icon_base]-on"
	else
		icon_state = "[icon_base]-off"

/obj/item/organ/heart/Remove(special = FALSE)
	if(!special)
		addtimer(CALLBACK(src, .proc/stop_if_unowned), 12 SECONDS)
	return ..()

/obj/item/organ/heart/proc/stop_if_unowned()
	if(!owner)
		Stop()

/obj/item/organ/heart/attack_self(mob/user)
	..()
	if(!beating)
		user.visible_message("<span class='notice'>[user] squeezes [src] to \
			make it beat again!</span>","<span class='notice'>You squeeze [src] to make it beat again!</span>")
		Restart()
		addtimer(CALLBACK(src, .proc/stop_if_unowned), 80)

/obj/item/organ/heart/proc/Stop()
	beating = 0
	update_icon()
	return 1

/obj/item/organ/heart/proc/Restart()
	beating = 1
	update_icon()
	return 1

/obj/item/organ/heart/proc/HeartStrengthMessage()
	if(beating)
		return "a healthy"
	return "<span class='danger'>an unstable</span>"

/obj/item/organ/heart/OnEatFrom(eater, feeder)
	. = ..()
	beating = FALSE
	update_icon()

/obj/item/organ/heart/on_life()
	. = ..()
	if(!owner || no_pump)
		return
	if(owner.client && beating)
		failed = FALSE
		var/sound/slowbeat = sound('sound/health/slowbeat.ogg', repeat = TRUE)
		var/sound/fastbeat = sound('sound/health/fastbeat.ogg', repeat = TRUE)

		if(owner.health <= owner.crit_threshold && beat != BEAT_SLOW)
			beat = BEAT_SLOW
			owner.playsound_local(get_turf(owner), slowbeat,40,0, channel = CHANNEL_HEARTBEAT)
			to_chat(owner, "<span class = 'notice'>Стук вашего сердца замедляется...</span>")
		if(beat == BEAT_SLOW && owner.health > owner.crit_threshold)
			owner.stop_sound_channel(CHANNEL_HEARTBEAT)
			beat = BEAT_NONE

		if(owner.jitteriness)
			if(owner.health > HEALTH_THRESHOLD_FULLCRIT && (!beat || beat == BEAT_SLOW))
				owner.playsound_local(get_turf(owner),fastbeat,40,0, channel = CHANNEL_HEARTBEAT)
				beat = BEAT_FAST
		else if(beat == BEAT_FAST)
			owner.stop_sound_channel(CHANNEL_HEARTBEAT)
			beat = BEAT_NONE

	if(organ_flags & ORGAN_FAILING)	//heart broke, stopped beating, death imminent
		if(owner.stat == CONSCIOUS)
			owner.visible_message("<span class='userdanger'>[owner] clutches at [owner.ru_ego()] chest as if [owner.ru_ego()] heart is stopping!</span>")
		owner.set_heartattack(TRUE)
		failed = TRUE

/obj/item/organ/heart/slime
	name = "mitochondria"
	desc = "The powerhouse of the cell. Or in this case, the hearty organelle of a slimeperson."
	icon_state = "heart-s-on"
	icon_base = "heart-s"

/obj/item/organ/heart/cursed
	name = "cursed heart"
	desc = "A heart that, when inserted, will force you to pump it manually."
	icon_state = "cursedheart-off"
	icon_base = "cursedheart"
	decay_factor = 0
	no_pump = TRUE
	actions_types = list(/datum/action/item_action/organ_action/cursed_heart)
	var/last_pump = 0
	var/add_colour = TRUE //So we're not constantly recreating colour datums
	var/pump_delay = 30 //you can pump 1 second early, for lag, but no more (otherwise you could spam heal)
	var/blood_loss = 50 //600 blood is human default, so 5 failures (below 122 blood is where humans die because reasons?)

	//How much to heal per pump, negative numbers would HURT the player
	var/heal_brute = 0
	var/heal_burn = 0
	var/heal_oxy = 0


/obj/item/organ/heart/cursed/attack(mob/living/carbon/human/H, mob/living/carbon/human/user, obj/target)

	if(H == user && istype(H))
		if(NOBLOOD in H.dna.species.species_traits)
			to_chat(user, "<span class='danger'>[src] refuses to become one with [H]")
			return
		playsound(user,'sound/effects/singlebeat.ogg',40,1)
		user.temporarilyRemoveItemFromInventory(src, TRUE)
		Insert(user)
	else
		return ..()

/obj/item/organ/heart/cursed/on_life()
	. = ..()
	if(!owner)
		return
	if(world.time > (last_pump + pump_delay))
		if(ishuman(owner) && owner.client) //While this entire item exists to make people suffer, they can't control disconnects.
			var/mob/living/carbon/human/H = owner
			if(NOBLOOD in H.dna.species.species_traits) //Otherwise people without will be eternally stuck red
				return
			if(H.dna && !(NOBLOOD in H.dna.species.species_traits))
				H.blood_volume = max(H.blood_volume - blood_loss, 0)
				to_chat(H, "<span class = 'userdanger'>You have to keep pumping your blood!</span>")
				if(add_colour)
					H.add_client_colour(/datum/client_colour/cursed_heart_blood) //bloody screen so real
					add_colour = FALSE
		else
			last_pump = world.time //lets be extra fair *sigh*

/obj/item/organ/heart/cursed/Insert(mob/living/carbon/M, special = 0, drop_if_replaced = TRUE)
	..()
	if(owner)
		to_chat(owner, "<span class ='userdanger'>Your heart has been replaced with a cursed one, you have to pump this one manually otherwise you'll die!</span>")

/obj/item/organ/heart/cursed/Remove(special = FALSE)
	owner.remove_client_colour(/datum/client_colour/cursed_heart_blood)
	return ..()

/datum/action/item_action/organ_action/cursed_heart
	check_flags = AB_CHECK_ALIVE //We wanna be able to do this always, else thisll just stupidly kill whoever has it
	required_mobility_flags = NONE
	name = "Pump your blood"

//You are now brea- pumping blood manually
/datum/action/item_action/organ_action/cursed_heart/Trigger()
	. = ..()
	if(. && istype(target, /obj/item/organ/heart/cursed))
		var/obj/item/organ/heart/cursed/cursed_heart = target

		if(world.time < (cursed_heart.last_pump + (cursed_heart.pump_delay-10))) //no spam
			to_chat(owner, "<span class='userdanger'>Too soon!</span>")
			return

		cursed_heart.last_pump = world.time
		playsound(owner,'sound/effects/singlebeat.ogg',40,1)
		to_chat(owner, "<span class = 'notice'>Your heart beats.</span>")

		var/mob/living/carbon/human/H = owner
		if(istype(H))
			if(H.dna && !(NOBLOOD in H.dna.species.species_traits))
				if(H.blood_volume < BLOOD_VOLUME_NORMAL) //We don't need to go too high, otherwise we get annoying messages.
					H.blood_volume = min(H.blood_volume + cursed_heart.blood_loss * 0.5, BLOOD_VOLUME_MAXIMUM)
				H.remove_client_colour(/datum/client_colour/cursed_heart_blood)
				cursed_heart.add_colour = TRUE
				H.adjustBruteLoss(-cursed_heart.heal_brute)
				H.adjustFireLoss(-cursed_heart.heal_burn)
				H.adjustOxyLoss(-cursed_heart.heal_oxy)


/datum/client_colour/cursed_heart_blood
	priority = 100 //it's an indicator you're dying, so it's very high priority
	colour = "red"

/obj/item/organ/heart/cybernetic
	name = "basic cybernetic heart"
	desc = "A basic electronic device designed to mimic the functions of an organic human heart."
	icon_state = "heart-c"
	organ_flags = ORGAN_SYNTHETIC
	maxHealth = STANDARD_ORGAN_THRESHOLD*0.75 //This also hits defib timer, so a bit higher than its less important counterparts

	var/dose_available = FALSE
	var/rid = /datum/reagent/medicine/epinephrine
	var/ramount = 10
	var/emp_vulnerability = 1 //The value the severity of emps are divided by to determine the likelihood of permanent damage.

/obj/item/organ/heart/cybernetic/tier2
	name = "cybernetic heart"
	desc = "An electronic device designed to mimic the functions of an organic human heart. Also holds an emergency dose of epinephrine, used automatically after facing severe trauma."
	icon_state = "heart-c-u"
	maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
	dose_available = TRUE
	emp_vulnerability = 2

/obj/item/organ/heart/cybernetic/tier3
	name = "upgraded cybernetic heart"
	desc = "An electronic device designed to mimic the functions of an organic human heart. Also holds an emergency dose of epinephrine, used automatically after facing severe trauma. This upgraded model can regenerate its dose after use."
	icon_state = "heart-c-u2"
	maxHealth = 2 * STANDARD_ORGAN_THRESHOLD
	dose_available = TRUE
	rid = /datum/reagent/medicine/atropine
	ramount = 5
	emp_vulnerability = 3

/obj/item/organ/heart/cybernetic/emp_act(severity)
	. = ..()

	// If the owner doesn't need a heart, we don't need to do anything with it.
	if(!owner.needs_heart())
		return

	if(. & EMP_PROTECT_SELF)
		return
	if(!COOLDOWN_FINISHED(src, severe_cooldown)) //So we cant just spam emp to kill people.
		owner.Dizzy(10)
		owner.losebreath += 10
		COOLDOWN_START(src, severe_cooldown, 20 SECONDS)
	if(prob(severity/emp_vulnerability)) //Chance of permanent effects
		organ_flags |= ORGAN_SYNTHETIC_EMP //Starts organ faliure - gonna need replacing soon.
		Stop()
		owner.visible_message("<span class='danger'>[owner] clutches at [owner.ru_ego()] chest as if [owner.ru_ego()] heart is stopping!</span>", \
						"<span class='userdanger'>You feel a terrible pain in your chest, as if your heart has stopped!</span>")
		addtimer(CALLBACK(src, .proc/Restart), 10 SECONDS)

/obj/item/organ/heart/cybernetic/on_life(delta_time, times_fired)
	. = ..()
	if(dose_available && owner.health <= owner.crit_threshold && !owner.reagents.has_reagent(rid))
		used_dose()

/obj/item/organ/heart/cybernetic/proc/used_dose()
	owner.reagents.add_reagent(rid, ramount)
	dose_available = FALSE

/obj/item/organ/heart/cybernetic/tier3/used_dose()
	. = ..()
	addtimer(VARSET_CALLBACK(src, dose_available, TRUE), 5 MINUTES)

/obj/item/organ/heart/ipc
	name = "IPC heart"
	desc = "An electronic pump that regulates hydraulic functions, the electronics have EMP shielding."
	icon_state = "heart-c"

/obj/item/organ/heart/freedom
	name = "heart of freedom"
	desc = "This heart pumps with the passion to give... something freedom."
	organ_flags = ORGAN_SYNTHETIC //the power of freedom prevents heart attacks
	var/min_next_adrenaline = 0

/obj/item/organ/heart/freedom/on_life()
	. = ..()
	if(. && owner.health < 5 && world.time > min_next_adrenaline)
		min_next_adrenaline = world.time + rand(250, 600) //anywhere from 4.5 to 10 minutes
		to_chat(owner, "<span class='userdanger'>You feel yourself dying, but you refuse to give up!</span>")
		owner.heal_overall_damage(15, 15)
		if(owner.reagents.get_reagent_amount(/datum/reagent/medicine/ephedrine) < 20)
			owner.reagents.add_reagent(/datum/reagent/medicine/ephedrine, 10)
