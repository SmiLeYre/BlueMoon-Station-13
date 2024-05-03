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
	var/default_chance = 0.01 //одна сотая процента
	var/chance = 0.01
	processing_quirk = TRUE
	mood_quirk = TRUE

/datum/quirk/awoo/add()
	// Set timer
	//timer = addtimer(CALLBACK(src, PROC_REF(do_awoo), timer_trigger, TIMER_STOPPABLE)
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
		if((last_awoo + 10 SECONDS) > world.time)
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
	//timer = addtimer(CALLBACK(src, PROC_REF(do_awoo), timer_trigger, TIMER_STOPPABLE)

/datum/quirk/light
	name = "Лёгкий"
	desc = "Вы в разы легче того, чем вы выглядите! Хотя и размеры теперь не особо помогают в выживании."
	value = 0
	mob_trait = TRAIT_BLUEMOON_LIGHT
	gain_text = "<span class='notice'>Вы ощущаете себя легче пёрышка!</span>"
	lose_text = "<span class='danger'>Вы ощёщаете себя тяжелее.</span>"
	medical_record_text = "Пациент имеет аномально низкий вес."
	antag_removal_text // Text will be given to the quirk holder if they get an antag that has it blacklisted.
