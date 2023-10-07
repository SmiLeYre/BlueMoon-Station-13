/datum/quirk/awoo
	name = "Неконтролируемый вой"
	desc = "Вам иногда нравиться завывать, есть ли на то причиниа или нет. Также вы не можете удержаться перед воем других."
	value = 0
	gain_text = "<span class='notice'>Иногда так хочется повыть...</span>"
	lose_text = "<span class='notice'>Я больше не хочу выть.</span>"
	mob_trait = TRAIT_AWOO
	//var/timer	//можно через таймеры, но я бы предпочел псевдорандом
	//var/timer_trigger = 1 MINUTES
	var/last_awoo
	var/default_chance = 0.1 //десятая часть процента
	var/chance = 0.01
	processing_quirk = TRUE
	mood_quirk = TRUE

/datum/quirk/awoo/add()
	// Set timer
	//timer = addtimer(CALLBACK(src, .proc/do_awoo), timer_trigger, TIMER_STOPPABLE)
	last_awoo = world.time
	chance = default_chance

//datum/quirk/awoo/remove()
	// Remove timer
	//deltimer(timer)

/datum/quirk/awoo/on_process()
	if(prob(chance))
		if((last_awoo + 5 SECONDS) > world.time)
			return
		// Check if conscious
		if(quirk_holder.stat == CONSCIOUS)
			// Display emote
			quirk_holder.nextsoundemote = world.time - 10
			addtimer(CALLBACK(quirk_holder, TYPE_PROC_REF(/mob, emote), pick("awoo", "howl")), rand(10,30))
			chance = default_chance
	if(chance < 100)
		chance += 0.001

/datum/quirk/awoo/proc/do_awoo()
	if(quirk_holder)
		if((last_awoo + 5 SECONDS) > world.time)
			return
		// Check if conscious
		if(quirk_holder.stat == CONSCIOUS)
			// Display emote
			quirk_holder.nextsoundemote = world.time - 10
			addtimer(CALLBACK(quirk_holder, TYPE_PROC_REF(/mob, emote), pick("awoo", "howl")), rand(10,30))
			chance = default_chance
			//timer_trigger = 1 MINUTES
		//else
			//timer_trigger = 5 MINUTES
	// Remove timer
	//deltimer(timer)
	//timer = null
	// Add new timer
	//timer = addtimer(CALLBACK(src, .proc/do_awoo), timer_trigger, TIMER_STOPPABLE)
