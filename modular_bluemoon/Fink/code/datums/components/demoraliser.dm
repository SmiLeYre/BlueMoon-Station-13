/*
 * Applies a role-based mood if you can see the parent.
 *
 * - Applies a mood to people who are in visible range of the item.
 * - Does not re-apply mood to people who already have it.
 * - Sends a signal if a mood is successfully applied.
 */
/datum/proximity_monitor/advanced/demoraliser
	var/next_check = 0
	var/next_scare = 0


/datum/proximity_monitor/advanced/demoraliser/New(atom/_host, range, _ignore_if_not_on_turf = TRUE)
	. = ..()
	RegisterSignal(_host, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))

/datum/proximity_monitor/advanced/demoraliser/proc/on_examine(datum/source, mob/examiner)
	SIGNAL_HANDLER
	if (ishuman(examiner))
		pugach(examiner)

/datum/proximity_monitor/advanced/demoraliser/proc/pugach(mob/living/carbon/human/viewer)
	var/message = pick("spooks you to the bone", "shakes you up", "terrifies you", "sends you into a panic", "sends chills down your spine")

	if (viewer.stat != CONSCIOUS)
		return
	if(viewer.is_blind())
		return
	if(!ishuman(viewer))
		return
	if(HAS_TRAIT(viewer, TRAIT_FEARLESS))
		return
	if(IS_INTEQ(viewer))
		return
	if(viewer.mind && (viewer.mind?.antag_datums)) // все антажки
		return
	else
		to_chat(viewer, "<span class='userdanger'>Seeing propagand of Inteq [message]!</span>")
		var/reaction = rand(1,5)
		switch(reaction)
			if(1)
				to_chat(viewer, "<span class='warning'>You are paralyzed with fear!</span>")
				viewer.Stun(70)
				viewer.Jitter(8)
			if(2)
				viewer.emote("scream")
				viewer.Jitter(5)
				viewer.say("AAAAH!!", forced = "phobia")
				viewer.pointed(src)
			if(3)
				viewer.emote("realagony")
				viewer.Jitter(5)
				viewer.say("AAAAH!!", forced = "phobia")
				viewer.pointed(src)
			if(4)
				to_chat(viewer, "<span class='warning'>You shut your eyes in terror!</span>")
				viewer.Jitter(5)
				viewer.blind_eyes(10)
			if(5)
				viewer.dizziness += 10
				viewer.confused += 10
				viewer.Jitter(10)
				viewer.stuttering += 10

