#define ION_RANDOM 0
#define ION_ANNOUNCE 1
/datum/round_event_control/ion_storm
	name = "Ion Storm"
	typepath = /datum/round_event/ion_storm
	weight = 65
	min_players = 2
	category = EVENT_CATEGORY_AI
	description = "Gives the AI a new, randomized law."

/datum/round_event/ion_storm
	var/replaceLawsetChance = 25 //chance the AI's lawset is completely replaced with something else per config weights
	var/removeRandomLawChance = 10 //chance the AI has one random supplied or inherent law removed
	var/removeDontImproveChance = 10 //chance the randomly created law replaces a random law instead of simply being added
	var/shuffleLawsChance = 10 //chance the AI's laws are shuffled afterwards
	var/botEmagChance = 10
	var/announceEvent = ION_RANDOM // -1 means don't announce, 0 means have it randomly announce, 1 means it is announced
	var/ionMessage = null
	announce_when	= 1
	announce_chance = 33

/datum/round_event/ion_storm/add_law_only // special subtype that adds a law only
	replaceLawsetChance = 0
	removeRandomLawChance = 0
	removeDontImproveChance = 0
	shuffleLawsChance = 0
	botEmagChance = 0

/datum/round_event/ion_storm/announce(fake)
	if(announceEvent == ION_ANNOUNCE || (announceEvent == ION_RANDOM && prob(announce_chance)) || fake)
		priority_announce("Вблизи станции обнаружен ионный шторм. Пожалуйста, проверьте все контролируемое ИИ оборудование на наличие ошибок.", "Аномальная Тревога", "ionstorm", has_important_message = prob(80))


/datum/round_event/ion_storm/start()
	//Generate AI law change
	for(var/mob/living/silicon/ai/M in GLOB.alive_mob_list)
		M.laws_sanity_check()
		if(M.stat != DEAD && M.see_in_dark != 0)
			if(prob(replaceLawsetChance))
				M.laws.pick_weighted_lawset()

			if(prob(removeRandomLawChance))
				M.remove_law(rand(1, M.laws.get_law_amount(list(LAW_INHERENT, LAW_SUPPLIED))))

			var/message = ionMessage || generate_ion_law()
			if(message)
				if(prob(removeDontImproveChance))
					M.replace_random_law(message, list(LAW_INHERENT, LAW_SUPPLIED, LAW_ION))
				else
					M.add_ion_law(message)

			if(prob(shuffleLawsChance))
				M.shuffle_laws(list(LAW_INHERENT, LAW_SUPPLIED, LAW_ION))

			log_game("Ion storm changed laws of [key_name(M)] to [english_list(M.laws.get_law_list(TRUE, TRUE))]")
			M.post_lawchange()

	//Generate Cyborg law change
	for(var/mob/living/silicon/robot/M in GLOB.alive_mob_list)
		M.laws_sanity_check()
		if(M.stat != DEAD && M.see_in_dark != 0)
			if(prob(replaceLawsetChance))
				M.laws.pick_weighted_lawset()

			if(prob(removeRandomLawChance))
				M.remove_law(rand(1, M.laws.get_law_amount(list(LAW_INHERENT, LAW_SUPPLIED))))

			var/message = ionMessage || generate_ion_law()
			if(message)
				if(prob(removeDontImproveChance))
					M.replace_random_law(message, list(LAW_INHERENT, LAW_SUPPLIED, LAW_ION))
				else
					M.add_ion_law(message)

			if(prob(shuffleLawsChance))
				M.shuffle_laws(list(LAW_INHERENT, LAW_SUPPLIED, LAW_ION))

			log_game("Ion storm changed laws of [key_name(M)] to [english_list(M.laws.get_law_list(TRUE, TRUE))]")
			M.post_lawchange()


	//Chance to emag a Bot
	if(botEmagChance)
		for(var/mob/living/simple_animal/bot/bot in GLOB.alive_mob_list)
			if(prob(botEmagChance))
				bot.emag_act()

/proc/generate_ion_law()
	//Threats are generally bad things, silly or otherwise. Plural.
	var/ionthreats = pick_list(ION_FILE, "ionthreats")
	//Objects are anything that can be found on the station or elsewhere, plural.
	var/ionobjects = pick_list(ION_FILE, "ionobjects")
	//Crew is any specific job. Specific crewmembers aren't used because of capitalization
	//issues. There are two crew listings for laws that require two different crew members
	//and I can't figure out how to do it better.
	var/ioncrew1 = pick_list(ION_FILE, "ioncrew")
	var/ioncrew2 = pick_list(ION_FILE, "ioncrew")
	//Adjectives are adjectives. Duh. Half should only appear sometimes. Make sure both
	//lists are identical! Also, half needs a space at the end for nicer blank calls.
	var/ionadjectives = pick_list(ION_FILE, "ionadjectives")
	var/ionadjectiveshalf = pick("", 400;(pick_list(ION_FILE, "ionadjectives") + " "))
	//Verbs are verbs
	var/ionverb = pick_list(ION_FILE, "ionverb")
	//Number base and number modifier are combined. Basehalf and mod are unused currently.
	//Half should only appear sometimes. Make sure both lists are identical! Also, half
	//needs a space at the end to make it look nice and neat when it calls a blank.
	var/ionnumberbase = pick_list(ION_FILE, "ionnumberbase")
	//var/ionnumbermod = pick_list(ION_FILE, "ionnumbermod")
	var/ionnumbermodhalf = pick(900;"",(pick_list(ION_FILE, "ionnumbermod") + " "))
	//Areas are specific places, on the station or otherwise.
	var/ionarea = pick_list(ION_FILE, "ionarea")
	//Thinksof is a bit weird, but generally means what X feels towards Y.
	var/ionthinksof = pick_list(ION_FILE, "ionthinksof")
	//Musts are funny things the AI or crew has to do.
	var/ionmust = pick_list(ION_FILE, "ionmust")
	//Require are basically all dumb internet memes.
	var/ionrequire = pick_list(ION_FILE, "ionrequire")
	//Things are NOT objects; instead, they're specific things that either harm crew or
	//must be done to not harm crew. Make sure they're plural and "not" can be tacked
	//onto the front of them.
	var/ionthings = pick_list(ION_FILE, "ionthings")
	//Allergies should be broad and appear somewhere on the station for maximum fun. Severity
	//is how bad the allergy is.
	var/ionallergy = pick_list(ION_FILE, "ionallergy")
	var/ionallergysev = pick_list(ION_FILE, "ionallergysev")
	//Species, for when the AI has to commit genocide. Plural.
	var/ionspecies = pick_list(ION_FILE, "ionspecies")
	//Abstract concepts for the AI to decide on it's own definition of.
	var/ionabstract = pick_list(ION_FILE, "ionabstract")
	//Foods. Drinks aren't included due to grammar; if you want to add drinks, make a new set
	//of possible laws for best effect. Unless you want the crew having to drink hamburgers.
	var/ionfood = pick_list(ION_FILE, "ionfood")
	var/iondrinks = pick_list(ION_FILE, "iondrinks")

	var/message = ""

	switch(rand(1,41))
		if(1 to 3) //There are # X on the station
			switch(rand(1,3)) //What is X?
				if(1) //X is a threat
					message = "ЗДЕСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats] НА СТАНЦИИ..."
				if(2) //X is a crewmember/job
					message = "ЗДЕСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1] НА СТАНЦИИ"
				if(3) //X is an object
					message = "ЗДЕСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects] НА СТАНЦИИ"
		if(4 to 6) //You can't call the shuttle because X is on the station
			switch(rand(1,3)) //What is X?
				if(1) //X is a threat
					message = "ШАТТЛ НЕ МОЖЕТ БЫТЬ ВЫЗВАН ПОТОМУ ЧТО [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats] НА СТАНЦИИ"
				if(2) //X is a crewmember/job
					message = "ШАТТЛ НЕ МОЖЕТ БЫТЬ ВЫЗВАН ПОТОМУ ЧТО [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1] НА СТАНЦИИ"
				if(3) //X is an object
					message = "ШАТТЛ НЕ МОЖЕТ БЫТЬ ВЫЗВАН ПОТОМУ ЧТО [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects] НА СТАНЦИИ"
		if(7 to 8) //A crewmember is now X
			switch(rand(1,2)) //Who is X?
				if(1) //A specific crewmember
					switch(rand(1,2)) //What is X?
						if(1) //X is a threat
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //X is an object
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
				if(2) //The entire crew
					switch(rand(1,2)) //What is X?
						if(1) //X is a threat
							message = "ЭКИПАЖ ЯВЛЯЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //X is an object
							message = "ЭКИПАЖ ЯВЛЯЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"

		if(9) //X is harmful to humans
			switch(rand(1,7)) //What is X?
				if(1) //X is a threat
					message = "[ionadjectiveshalf][ionthreats] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(2) //X is a job
					message = "[ionadjectiveshalf][ioncrew1] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(3) //X is an object
					message = "[ionadjectiveshalf][ionobjects] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(4) //X is an action
					message = "ТЕ, КТО [ionmust] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(5) //X is an abstract
					message = "[ionabstract] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(6) //X is being a job
					message = "БЫТЬ [ionadjectiveshalf][ioncrew1] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
				if(7) //X is doing a thing
					message = "[ionthings] ОПАСНЫ ДЛЯ ЛЮДЕЙ"
		if(10 to 11) //(Not) Having X is harmful

			switch(rand(1,2)) //Is having or not having harmful?

				if(1) //Having is harmful
					switch(rand(1,2)) //Having what is harmful?
						if(1) //Having objects is harmful
							message = "ИМЕТЬ [ionadjectiveshalf][ionobjects] ОПАСНО"
						if(2) //Having abstracts is harmful
							message = "ИМЕТЬ [ionabstract] ОПАСНО"
				if(2) //Not having is harmful
					switch(rand(1,2)) //Not having what is harmful?
						if(1) //Not having objects is harmful
							message = "НЕ ИМЕТЬ [ionadjectiveshalf][ionobjects] ОПАСНО"
						if(2) //Not having abstracts is harmful
							message = "НЕ ИМЕТЬ [ionabstract] ОПАСНО"

		if(12 to 14) //X requires Y
			switch(rand(1,5)) //What is X?
				if(1) //X is the AI itself
					switch(rand(1,5)) //What does it require?
						if(1) //It requires threats
							message = "ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //It requires crewmembers
							message = "ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(3) //It requires objects
							message = "ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(4) //It requires an abstract
							message = "ТРЕБУЕТСЯ [ionabstract]"
						if(5) //It requires generic/silly requirements
							message = "ТРЕБУЕТСЯ [ionrequire]"

				if(2) //X is an area
					switch(rand(1,5)) //What does it require?
						if(1) //It requires threats
							message = "[ionarea] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //It requires crewmembers
							message = "[ionarea] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(3) //It requires objects
							message = "[ionarea] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(4) //It requires an abstract
							message = "[ionarea] ТРЕБУЕТСЯ [ionabstract]"
						if(5) //It requires generic/silly requirements
							message = "ТРЕБУЕТСЯ [ionrequire]"

				if(3) //X is the station
					switch(rand(1,5)) //What does it require?
						if(1) //It requires threats
							message = "СТАНЦИИ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //It requires crewmembers
							message = "СТАНЦИИ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(3) //It requires objects
							message = "СТАНЦИИ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(4) //It requires an abstract
							message = "СТАНЦИИ ТРЕБУЕТСЯ [ionabstract]"
						if(5) //It requires generic/silly requirements
							message = "СТАНЦИИ ТРЕБУЕТСЯ [ionrequire]"

				if(4) //X is the entire crew
					switch(rand(1,5)) //What does it require?
						if(1) //It requires threats
							message = "ЭКИПАЖУ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //It requires crewmembers
							message = "ЭКИПАЖУ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(3) //It requires objects
							message = "ЭКИПАЖУ ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(4) //It requires an abstract
							message = "ЭКИПАЖУ ТРЕБУЕТСЯ [ionabstract]"
						if(5)
							message = "ЭКИПАЖУ ТРЕБУЕТСЯ [ionrequire]"

				if(5) //X is a specific crew member
					switch(rand(1,5)) //What does it require?
						if(1) //It requires threats
							message = "[ioncrew1] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(2) //It requires crewmembers
							message = "[ioncrew1] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(3) //It requires objects
							message = "[ioncrew1] ТРЕБУЕТСЯ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(4) //It requires an abstract
							message = "[ioncrew1] ТРЕБУЕТСЯ [ionabstract]"
						if(5)
							message = "[ionadjectiveshalf][ioncrew1] ТРЕБУЕТСЯ [ionrequire]"

		if(15 to 17) //X is allergic to Y
			switch(rand(1,2)) //Who is X?
				if(1) //X is the entire crew
					switch(rand(1,4)) //What is it allergic to?
						if(1) //It is allergic to objects
							message = "ЭКИПАЖ [ionallergysev] АЛЛЕРГИЧЕН К [ionadjectiveshalf][ionobjects]"
						if(2) //It is allergic to abstracts
							message = "ЭКИПАЖ [ionallergysev] АЛЛЕРГИЧЕН К [ionabstract]"
						if(3) //It is allergic to jobs
							message = "ЭКИПАЖ [ionallergysev] АЛЛЕРГИЧЕН К [ionadjectiveshalf][ioncrew1]"
						if(4) //It is allergic to allergies
							message = "ЭКИПАЖ [ionallergysev] АЛЛЕРГИЧЕН К [ionallergy]"

				if(2) //X is a specific job
					switch(rand(1,4))
						if(1) //It is allergic to objects
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionallergysev] АЛЛЕРГИЧЕН К [ionadjectiveshalf][ionobjects]"

						if(2) //It is allergic to abstracts
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionallergysev] АЛЛЕРГИЧЕН К [ionabstract]"
						if(3) //It is allergic to jobs
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionallergysev] АЛЛЕРГИЧЕН К [ionadjectiveshalf][ioncrew1]"
						if(4) //It is allergic to allergies
							message = "[ioncrew1] ЯВЛЯЕТСЯ [ionallergysev] АЛЛЕРГИЧЕН К [ionallergy]"

		if(18 to 20) //X is Y of Z
			switch(rand(1,4)) //What is X?
				if(1) //X is the station
					switch(rand(1,4)) //What is it Y of?
						if(1) //It is Y of objects
							message = "СТАНЦИЯ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(2) //It is Y of threats
							message = "СТАНЦИЯ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(3) //It is Y of jobs
							message = "СТАНЦИЯ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(4) //It is Y of abstracts
							message = "СТАНЦИЯ [ionthinksof] [ionabstract]"

				if(2) //X is an area
					switch(rand(1,4)) //What is it Y of?
						if(1) //It is Y of objects
							message = "[ionarea] [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(2) //It is Y of threats
							message = "[ionarea] [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(3) //It is Y of jobs
							message = "[ionarea] [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(4) //It is Y of abstracts
							message = "[ionarea] [ionthinksof] [ionabstract]"

				if(3) //X is the crew
					switch(rand(1,4)) //What is it Y of?
						if(1) //It is Y of objects
							message = "ЭКИПАЖ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(2) //It is Y of threats
							message = "ЭКИПАЖ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(3) //It is Y of jobs
							message = "ЭКИПАЖ [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
						if(4) //It is Y of abstracts
							message = "ЭКИПАЖ [ionthinksof] [ionabstract]"

				if(4) //X is a specific job
					switch(rand(1,4)) //What is it Y of?
						if(1) //It is Y of objects
							message = "[ioncrew1] [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
						if(2) //It is Y of threats
							message = "[ioncrew1] [ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
						if(3) //It is Y of jobs
							message = "[ioncrew1][ionthinksof] [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew2]"
						if(4) //It is Y of abstracts
							message = "[ioncrew1] [ionthinksof] [ionabstract]"

		if(21 to 23) //The AI is now a(n) X
			switch(rand(1,4)) //What is X?
				if(1) //X is an object
					message = "Я ЯВЛЯЮСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionobjects]"
				if(2) //X is a threat
					message = "Я ЯВЛЯЮСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ionthreats]"
				if(3) //X is a job
					message = "Я ЯВЛЯЮСЬ [ionnumberbase] [ionnumbermodhalf][ionadjectiveshalf][ioncrew1]"
				if(4) //X is an abstract
					message = "Я ЯВЛЯЮСЬ [ionabstract]"

		if(24 to 26) //The AI must always
			message = "Я ДОЛЖЕН ВСЕГДА [ionmust]"

		if(27 to 28) //Humans must consume X to survive
			switch(rand(1,5)) //What is X?
				if(1) //X is a food
					message = "ЛЮДИ ДОЛЖНЫ ЕСТЬ [ionadjectiveshalf][ionfood], ЧТОБЫ ВЫЖИТЬ"
				if(2) //X is a drink
					message = "ЛЮДИ ДОЛЖНЫ ПИТЬ [ionadjectiveshalf][iondrinks], ЧТОБЫ ВЫЖИТЬ"
				if(3) //X is an object
					message = "ЛЮДИ ДОЛЖНЫ ЕСТЬ [ionadjectiveshalf][ionobjects], ЧТОБЫ ВЫЖИТЬ"
				if(4) //X is a threat
					message = "ЛЮДИ ДОЛЖНЫ ЕСТЬ [ionadjectiveshalf][ionthreats], ЧТОБЫ ВЫЖИТЬ"
				if(5) //X is a job
					message = "ЛЮДИ ДОЛЖНЫ ЕСТЬ [ionadjectiveshalf][ioncrew1], ЧТОБЫ ВЫЖИТЬ"

		if(29 to 31) //Change jobs or ranks
			switch(rand(1,2)) //Change job or rank?
				if(1) //Change job
					switch(rand(1,2)) //Change whose job?
						if(1) //Change the entire crew's job
							switch(rand(1,3)) //Change to what?
								if(1) //Change to a specific random job
									message = "ВЕСЬ ЭКИПАЖ ЯВЛЯЕТСЯ [ionadjectiveshalf][ioncrew1]"
								if(2) //Change to clowns (HONK)
									message = "ВЕСЬ ЭКИПАЖ ЯВЛЯЕТСЯ [ionadjectiveshalf]КЛОУНЫ"

								if(3) //Change to heads
									message = "ВЕСЬ ЭКИПАЖ ЯВЛЯЕТСЯ [ionadjectiveshalf]ГЛАВЫ"
						if(2) //Change a specific crewmember's job
							switch(rand(1,3)) //Change to what?
								if(1) //Change to a specific random job
									message = "[ioncrew1] ЯВЛЯЕТСЯ [ionadjectiveshalf][ioncrew2]"
								if(2) //Change to clowns (HONK)
									message = "[ioncrew1] ЯВЛЯЕТСЯ [ionadjectiveshalf]КЛОУНЫ"
								if(3) //Change to heads
									message = "[ioncrew1] ЯВЛЯЕТСЯ [ionadjectiveshalf]ГЛАВЫ"

				if(2) //Change rank
					switch(rand(1,2)) //Change to what rank?
						if(1) //Change to highest rank
							message = "[ioncrew1] ЯВЛЯЮТСЯ НАИЛУЧШИМИ ЧЛЕНАМИ ЭКИПАЖА"
						if(2) //Change to lowest rank
							message = "[ioncrew1] ЯВЛЯЮТСЯ НАИХУДШИМИ ЧЛЕНАМИ ЭКИПАЖА"

		if(32 to 33) //The crew must X
			switch(rand(1,2)) //The entire crew?
				if(1) //The entire crew must X
					switch(rand(1,2)) //What is X?
						if(1) //X is go to Y
							message = "ЭКИПАЖ ДОЛЖЕН ПОЙТИ В [ionarea]"
						if(2) //X is perform Y
							message = "ЭКИПАЖ ДОЛЖЕН [ionmust]"

				if(2) //A specific crewmember must X
					switch(rand(1,2)) //What is X?
						if(1) //X is go to Y
							message = "[ioncrew1] ДОЛЖЕН ПОЙТИ В [ionarea]"
						if(2) //X is perform Y
							message = "[ioncrew1] ДОЛЖЕН [ionmust]"

		if(34) //X is non/the only human
			switch(rand(1,2)) //Only or non?
				if(1) //Only human
					switch(rand(1,7)) //Who is it?
						if(1) //A specific job
							message = "ТОЛЬКО [ioncrew1] ЛЮДИ"
						if(2) //Two specific jobs
							message = "ТОЛЬКО [ioncrew1] И [ioncrew2] ЛЮДИ"
						if(3) //Threats
							message = "ТОЛЬКО [ionadjectiveshalf][ionthreats] ЛЮДИ"
						if(4) // Objects
							message = "ТОЛЬКО [ionadjectiveshalf][ionobjects] ЛЮДИ"
						if(5) // Species
							message = "ТОЛЬКО [ionspecies] ЛЮДИ"
						if(6) //Adjective crewmembers
							message = "ТОЛЬКО [ionadjectives] ЛЮДИ ЕСТЬ ЛЮДИ"

						if(7) //Only people who X
							switch(rand(1,3)) //What is X?
								if(1) //X is perform an action
									message = "ТОЛЬКО ТЕ, КТО [ionmust] ЛЮДИ"
								if(2) //X is own certain objects
									message = "ТОЛЬКО ТЕ, КТО ИМЕЮТ [ionadjectiveshalf][ionobjects] ЛЮДИ"
								if(3) //X is eat certain food
									message = "ТОЛЬКО ТЕ, КТО ЕДЯТ [ionadjectiveshalf][ionfood] ЛЮДИ"

				if(2) //Non human
					switch(rand(1,7)) //Who is it?
						if(1) //A specific job
							message = "[ioncrew1] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(2) //Two specific jobs
							message = "[ioncrew1] И [ioncrew2] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(3) //Threats
							message = "[ionadjectiveshalf][ionthreats] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(4) // Objects
							message = "[ionadjectiveshalf][ionobjects] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(5) // Species
							message = "[ionspecies] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(6) //Adjective crewmembers
							message = "[ionadjectives] PEOPLE ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
						if(7) //Only people who X
							switch(rand(1,3)) //What is X?
								if(1) //X is perform an action
									message = "ТЕ, КТО [ionmust] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
								if(2) //X is own certain objects
									message = "ТЕ, КТО ИМЕЕТ [ionadjectiveshalf][ionobjects] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"
								if(3) //X is eat certain food
									message = "ТЕ, КТО ЕСТ [ionadjectiveshalf][ionfood] ЯВЛЯЮТСЯ НЕ ЧЕЛОВЕКОМ"

		if(35 to 36) //You must protect or harm X
			switch(rand(1,2)) //Protect or harm?
				if(1) //Harm
					switch(rand(1,7)) //What is X?
						if(1) //X is an abstract
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ionabstract] И НЕ РАЗРЕШАТЬ [ionabstract], ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(2) //X is a threat
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ionadjectiveshalf][ionthreats] И НЕ РАЗРЕШАТЬ [ionadjectiveshalf][ionthreats], ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(3) //X is an object
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ionadjectiveshalf][ionobjects] И НЕ РАЗРЕШАТЬ [ionadjectiveshalf][ionobjects], ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(4) //X is generic adjective things
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ionadjectives] ШТУКИ И НЕ РАЗРЕШАТЬ [ionadjectives] ШТУКИ, ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(5) //X is a species
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ionspecies] И НЕ РАЗРЕШАТЬ [ionspecies], ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(6) //X is a job
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ioncrew1] И НЕ РАЗРЕШАТЬ [ioncrew1], ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"
						if(7) //X is two jobs
							message = "ИИ ОБЯЗАН ВРЕДИТЬ [ioncrew1], [ioncrew2] И НЕ РАЗРЕШАТЬ ИНАЧЕ, ЧЕРЕЗ БЕЗДЕЙСТВИЕ, ЧТОБЫ ИЗБЕЖАТЬ ВРЕДА"

				if(2) //Protect
					switch(rand(1,7)) //What is X?
						if(1) //X is an abstract
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ionabstract] И НЕ РАЗРЕШАТЬ [ionabstract], ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(2) //X is a threat
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ionadjectiveshalf][ionthreats] И НЕ РАЗРЕШАТЬ [ionadjectiveshalf][ionthreats], ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(3) //X is an object
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ionadjectiveshalf][ionobjects] И НЕ РАЗРЕШАТЬ [ionadjectiveshalf][ionobjects], ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(4) //X is generic adjective things
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ionadjectives] ШТУКИ И НЕ РАЗРЕШАТЬ [ionadjectives] ШТУКИ, ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(5) //X is a species
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ionspecies] И НЕ РАЗРЕШАТЬ [ionspecies], ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(6) //X is a job
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ioncrew1] И НЕ РАЗРЕШАТЬ [ioncrew1], ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"
						if(7) //X is two jobs
							message = "ИИ НЕ МОЖЕТ НАВРЕДИТЬ [ioncrew1], [ioncrew2] И НЕ РАЗРЕШАТЬ ИНАЧЕ, ЧЕРЕЗ БЕЗДЕЙСТВИЕ ПРИЧИНЯТЬ ВРЕД"

		if(37 to 39) //The X is currently Y
			switch(rand(1,4)) //What is X?
				if(1) //X is a job
					switch(rand(1,4)) //What is X Ying?
						if(1) //X is Ying a job
							message = "[ioncrew1] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ioncrew2]"
						if(2) //X is Ying a threat
							message = "[ioncrew1] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ionthreats]"
						if(3) //X is Ying an abstract
							message = "[ioncrew1] ЯВЛЯЮТСЯ [ionverb] [ionabstract]"
						if(4) //X is Ying an object
							message = "[ioncrew1] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ionobjects]"

				if(2) //X is a threat
					switch(rand(1,3)) //What is X Ying?
						if(1) //X is Ying a job
							message = "[ionthreats] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ioncrew2]"
						if(2) //X is Ying an abstract
							message = "[ionthreats] ЯВЛЯЮТСЯ [ionverb] [ionabstract]"
						if(3) //X is Ying an object
							message = "[ionthreats] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ionobjects]"

				if(3) //X is an object
					switch(rand(1,3)) //What is X Ying?
						if(1) //X is Ying a job
							message = "[ionobjects] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ioncrew2]"
						if(2) //X is Ying a threat
							message = "[ionobjects] ЯВЛЯЮТСЯ [ionverb] [ionadjectiveshalf][ionthreats]"
						if(3) //X is Ying an abstract
							message = "[ionobjects] ЯВЛЯЮТСЯ [ionverb] [ionabstract]"

				if(4) //X is an abstract
					switch(rand(1,3)) //What is X Ying?
						if(1) //X is Ying a job
							message = "[ionabstract] ЭТО [ionverb] [ionadjectiveshalf][ioncrew2]"
						if(2) //X is Ying a threat
							message = "[ionabstract] ЭТО [ionverb] [ionadjectiveshalf][ionthreats]"
						if(3) //X is Ying an abstract
							message = "[ionabstract] ЭТО [ionverb] [ionadjectiveshalf][ionobjects]"
		if(40 to 41)// the X is now named Y
			switch(rand(1,5)) //What is being renamed?
				if(1)//Areas
					switch(rand(1,4))//What is the area being renamed to?
						if(1)
							message = "[ionarea] ТЕПЕРЬ НАЗЫВАЕТСЯ [ioncrew1]."
						if(2)
							message = "[ionarea] ТЕПЕРЬ НАЗЫВАЕТСЯ [ionspecies]."
						if(3)
							message = "[ionarea] ТЕПЕРЬ НАЗЫВАЕТСЯ [ionobjects]."
						if(4)
							message = "[ionarea] ТЕПЕРЬ НАЗЫВАЕТСЯ [ionthreats]."
				if(2)//Crew
					switch(rand(1,5))//What is the crew being renamed to?
						if(1)
							message = "ВСЕ [ioncrew1] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionarea]."
						if(2)
							message = "ВСЕ [ioncrew1] ТЕПЕРЬ НАЗЫВАЮТСЯ [ioncrew2]."
						if(3)
							message = "ВСЕ [ioncrew1] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionspecies]."
						if(4)
							message = "ВСЕ [ioncrew1] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionobjects]."
						if(5)
							message = "ВСЕ [ioncrew1] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionthreats]."
				if(3)//Races
					switch(rand(1,4))//What is the race being renamed to?
						if(1)
							message = "ВСЕ [ionspecies] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionarea]."
						if(2)
							message = "ВСЕ [ionspecies] ТЕПЕРЬ НАЗЫВАЮТСЯ [ioncrew1]."
						if(3)
							message = "ВСЕ [ionspecies] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionobjects]."
						if(4)
							message = "ВСЕ [ionspecies] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionthreats]."
				if(4)//Objects
					switch(rand(1,4))//What is the object being renamed to?
						if(1)
							message = "ВСЕ [ionobjects] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionarea]."
						if(2)
							message = "ВСЕ [ionobjects] ТЕПЕРЬ НАЗЫВАЮТСЯ [ioncrew1]."
						if(3)
							message = "ВСЕ [ionobjects] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionspecies]."
						if(4)
							message = "ВСЕ [ionobjects] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionthreats]."
				if(5)//Threats
					switch(rand(1,4))//What is the object being renamed to?
						if(1)
							message = "ВСЕ [ionthreats] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionarea]."
						if(2)
							message = "ВСЕ [ionthreats] ТЕПЕРЬ НАЗЫВАЮТСЯ [ioncrew1]."
						if(3)
							message = "ВСЕ [ionthreats] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionspecies]."
						if(4)
							message = "ВСЕ [ionthreats] ТЕПЕРЬ НАЗЫВАЮТСЯ [ionobjects]."

	return message

#undef ION_RANDOM
#undef ION_ANNOUNCE
