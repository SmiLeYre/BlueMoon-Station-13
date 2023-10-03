/datum/mood_event/handcuffed
	description = "<span class='warning'>Похоже, мои выходки привели к печальным последствиям...</span>\n"
	mood_change = -1

/datum/mood_event/broken_vow //Used for when mimes break their vow of silence
	description = "<span class='boldwarning'>I have brought shame upon my name, and betrayed my fellow mimes by breaking our sacred vow...</span>\n"
	mood_change = -8

/datum/mood_event/on_fire
	description = "<span class='boldwarning'>Я ГОРЮ!!!</span>\n"
	mood_change = -8

/datum/mood_event/suffocation
	description = "<span class='boldwarning'>НЕ МОГУ... ДЫШАТЬ...</span>\n"
	mood_change = -6

/datum/mood_event/burnt_thumb
	description = "<span class='warning'>Играть с огнём было плохой идеей...</span>\n"
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/cold
	description = "<span class='warning'>Здесь становится холодно.</span>\n"
	mood_change = -2

/datum/mood_event/hot
	description = "<span class='warning'>Здесь становится жарковато.</span>\n"
	mood_change = -2

/datum/mood_event/creampie
	description = "<span class='warning'>Меня обдали сгущёнкой. По вкусу напоминает пирог..</span>\n"
	mood_change = -2
	timeout = 3 MINUTES

/datum/mood_event/slipped
	mood_change = -2
	timeout = 3 MINUTES

/datum/mood_event/slipped/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Я подскользну[owner_mob.ru_sya()]. В следующий раз стоит быть аккуратнее...</span>\n"

/datum/mood_event/eye_stab
	description = "<span class='boldwarning'>Раньше меня тоже вела дорога приключений, а потом у меня в глазу оказалась отвертка...</span>\n"
	mood_change = -4
	timeout = 3 MINUTES

/datum/mood_event/delam //SM delamination
	description = "<span class='boldwarning'>Эти чертовы инженеры вообще ничего умеют...</span>\n"
	mood_change = -2
	timeout = 2400

/datum/mood_event/depression
	description = "<span class='warning'>Мне грустно безо всякой причины.</span>\n"
	mood_change = -9
	timeout = 2 MINUTES

/datum/mood_event/shameful_suicide //suicide_acts that return SHAME, like sord
	description = "<span class='boldwarning'>Я даже не могу нормально закончить всё это!</span>\n"
	mood_change = -10
	timeout = 1 MINUTES

/datum/mood_event/dismembered
	description = "<span class='boldwarning'>АХ! ЭТО ЖЕ МОЯ КОНЕЧНОСТЬ!</span>\n"
	mood_change = -8
	timeout = 2400

/datum/mood_event/noshoes
	description = "<span class='warning'>Я везде ломаю комедию!</span>\n"
	mood_change = -5

/datum/mood_event/tased
	description = "<span class='warning'>Что неприятно может обозначать буква \"т\" в слове \"тазер\"? Это ток!</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/embedded
	description = "<span class='boldwarning'>Вытащи это!</span>\n"
	mood_change = -7

/datum/mood_event/table_limbsmash
	description = "<span class='warning'>Долбанный стол. Это, чёрт возьми, больно...</span>\n"
	mood_change = -3
	timeout = 3 MINUTES

/datum/mood_event/table_limbsmash/add_effects(obj/item/bodypart/banged_limb)
	if(banged_limb)
		description = "<span class='warning'>Моя грёбанная конечность, [banged_limb.ru_name]! Чёрт возьми, это больно...</span>\n"

/datum/mood_event/table/add_effects()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(iscatperson(H))
			H.dna.species.start_wagging_tail(H)
			addtimer(CALLBACK(H.dna.species, /datum/species.proc/stop_wagging_tail, H), 30)
			description =  "<span class='nicegreen'>Они хотят поиграть на столе!</span>\n"
			mood_change = 2

/datum/mood_event/brain_damage
	mood_change = -3

/datum/mood_event/brain_damage/add_effects()
	var/damage_message = pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage")
	description = "<span class='warning'>Хр-р-р р-р-р... [damage_message]</span>\n"

/datum/mood_event/hulk //Entire duration of having the hulk mutation
	description = "<span class='warning'>ХАЛК КРУШИТЬ!</span>\n"
	mood_change = -4

/datum/mood_event/epilepsy //Only when the mutation causes a seizure
	description = "<span class='warning'>Следует ответственее относиться к предупреждениям об эпилепсии.</span>\n"
	mood_change = -3
	timeout = 3000

/datum/mood_event/nyctophobia
	description = "<span class='warning'>Вокруг довольно темно...</span>\n"
	mood_change = -3

/datum/mood_event/brightlight
	description = "<span class='warning'>Свет вокруг становится невыносимым...</span>\n"
	mood_change = -3

/datum/mood_event/family_heirloom_missing
	description = "<span class='warning'>Я скучаю по своей семейной реликвии...</span>\n"
	mood_change = -8

/datum/mood_event/healsbadman
	description = "<span class='warning'>Чувствую себя намного лучше, но неприятный осадок ещё остался.</span>\n"
	mood_change = -4
	timeout = 2 MINUTES

/datum/mood_event/jittery
	description = "<span class='warning'>Я на грани нервного срыва и больше так не могу!!</span>\n"
	mood_change = -2

/datum/mood_event/vomit
	mood_change = -2
	timeout = 2 MINUTES

/datum/mood_event/vomit/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Я только что вырвал[owner_mob.ru_a()]. Неприятно.</span>\n"

/datum/mood_event/vomitself
	mood_change = -4
	timeout = 3 MINUTES

/datum/mood_event/vomitself/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Я только что вырвал[owner_mob.ru_a()] на себя. Мерзость.</span>\n"

/datum/mood_event/painful_medicine
	description = "<span class='warning'>Лекарства делают свои дело, но боль ещё не успела затихнуть.</span>\n"
	mood_change = -5
	timeout = 1 MINUTES

/datum/mood_event/painful_limb_regrowth
	description = "<span class='warning'>Прекрасно вернуть себе конечности, но боль все ещё никуда не ушла.</span>\n"
	mood_change = -5
	timeout = 1 MINUTES

/datum/mood_event/loud_gong
	description = "<span class='warning'>Этот громкий звук вдарил по моим ушам!</span>\n"
	mood_change = -3
	timeout = 1200

/datum/mood_event/spooked
	description = "<span class='warning'>Постукивания этих костей...все ещё меня напрягают.</span>\n"
	mood_change = -4
	timeout = 2400

/datum/mood_event/graverobbing
	mood_change = -8
	timeout = 3 MINUTES

/datum/mood_event/graverobbing/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description ="<span class='boldwarning'>Я осквернил[owner_mob.ru_a()] чью-то могилу... Не могу поверить, что я это сделал[owner_mob.ru_a()]...</span>\n"

/datum/mood_event/gates_of_mansus
	description = "<span class='boldwarning'>ПЕРЕД МОИМИ ГЛАЗАМИ ПРОМЕЛЬКНУЛ УЖАС ЗА ГРАНЬЮ ЭТОГО МИРА! РЕАЛЬНОСТЬ ВЫВЕРНУЛАСЬ БУДТО НАИЗНАНКУ!</span>\n"
	mood_change = -25
	timeout = 4 MINUTES

//These are unused so far but I want to remember them to use them later

/datum/mood_event/cloned_corpse
	mood_change = -6

/datum/mood_event/cloned_corpse/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description ="<span class='boldwarning'>Я только что увидел[owner_mob.ru_a()] собственный труп...</span>\n"

/datum/mood_event/surgery
	description = "<span class='boldwarning'>МЕНЯ КТО-ТО РЕЖЕТ!!</span>\n"
	mood_change = -8

//End unused

/datum/mood_event/sad_empath
	description = "<span class='warning'>Кто-то рядом расстроен... это удручает...</span>\n"
	mood_change = -2
	timeout = 600

/datum/mood_event/sad_empath/add_effects(mob/sadtarget)
	description = "<span class='warning'>[sadtarget.name] выглядит расстроенным... это удручает...</span>\n"

/datum/mood_event/revenant_blight
	description = "<span class='umbra'>Просто сдайся, хонк...</span>\n"
	mood_change = -5

/datum/mood_event/revenant_blight/add_effects()
	description = "<span class='umbra'>Просто сдайся, [pick("ты никому не нужен", "ты бесполезен", "даже клоун полезнее тебя", "имеет ли это значение, в конце-концов?")]...</span>\n"

/datum/mood_event/plushjack
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/plushjack/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='warning'>Я только что выпотрошил[owner_mob.ru_a()] плюшевую игрушку.</span>\n"

/datum/mood_event/plush_nostuffing
	description = "<span class='warning'>В плюшевой игрушке не было наполнителя...</span>\n"
	mood_change = -1
	timeout = 2 MINUTES

/datum/mood_event/plush_bite
	description = "<span class='warning'>ОНО МЕНЯ УКУСИЛО!! АЙ!</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

//Cursed stuff below

/datum/mood_event/emptypred
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/emptypred/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='nicegreen'>Я позволил[owner_mob.ru_a()] кому-то уйти.</span>\n"

/datum/mood_event/emptyprey
	description = "<span class='nicegreen'>Здесь прохладно.</span>\n"
	mood_change = -2
	timeout = 1 MINUTES

//Cursed stuff end.

/datum/mood_event/vampcandle
	description = "<span class='umbra'>Что-то заставляет вас мыслить... потерянно...</span>\n"
	mood_change = -15
	timeout = 1 MINUTES

/datum/mood_event/drankblood_bad
	mood_change = -4
	timeout = 8 MINUTES

/datum/mood_event/drankblood_bad/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='boldwarning'>Я выпил[owner_mob.ru_a()] кровь низшего существа. Мерзость.</span>\n"

/datum/mood_event/drankblood_dead
	mood_change = -7
	timeout = 10 MINUTES

/datum/mood_event/drankblood_dead/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='boldwarning'>Я выпил[owner_mob.ru_a()] кровь мертвеца. Нужно быть выше этого.</span>\n"

/datum/mood_event/drankblood_synth
	mood_change = -7
	timeout = 15 MINUTES

/datum/mood_event/drankblood_synth/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='boldwarning'>Я выпил[owner_mob.ru_a()] синтетическую кровь. Да что со мной не так?</span>\n"

/datum/mood_event/drankkilled
	description = "<span class='boldwarning'>Моя жертва умерла от потери крови. Ощущаю себя...не очень гуманно.</span>\n"
	mood_change = -12
	timeout = 25 MINUTES

/datum/mood_event/madevamp
	description = "<span class='boldwarning'>Чья-то душа оказалась обречена стать нежитью из-за меня.</span>\n"
	mood_change = -10
	timeout = 30 MINUTES

/datum/mood_event/vampatefood
	description = "<span class='boldwarning'>Пища смертных более меня не насыщает. Чувствую себя плохо.</span>\n"
	mood_change = -6
	timeout = 10 MINUTES

/datum/mood_event/daylight_1
	description = "<span class='boldwarning'>В самодельном гробу плохо спится, особенно днём.</span>\n"
	mood_change = -3
	timeout = 10 MINUTES

/datum/mood_event/daylight_2
	description = "<span class='boldwarning'>Лучи Солнца обожгли моё тело.</span>\n"
	mood_change = -6
	timeout = 15 MINUTES

/datum/mood_event/bloodsucker_disgust
	description = "<span class='boldwarning'>Недавняя моя пища была отвратительной.</span>\n"
	mood_change = -5
	timeout = 5 MINUTES

/datum/mood_event/nanite_sadness
	description = "<span class='warning robot'>+++++++ПОДАВЛЕНИЕ СЧАСТЬЯ+++++++</span>\n"
	mood_change = -7

/datum/mood_event/nanite_sadness/add_effects(message)
	description = "<span class='warning robot'>+++++++[message]+++++++</span>\n"

/datum/mood_event/artbad
	description = "<span class='warning'>Можно было бы сделать и лучше, чем это рукожопие.</span>\n"
	mood_change = -2
	timeout = 1200

/datum/mood_event/tripped
	description = "<span class='boldwarning'>Не могу поверить, что меня повели этим старым как мир трюком!</span>\n"
	mood_change = -6
	timeout = 2 MINUTES

/datum/mood_event/untied
	description = "<span class='boldwarning'>Ненавижу, когда моя обувь развязана!</span>\n"
	mood_change = -3
	timeout = 1 MINUTES

/datum/mood_event/high_five_alone
	description = "<span class='boldwarning'>Какая жалость, никто не дал мне пять!</span>\n"
	mood_change = -2
	timeout = 1 MINUTES

/datum/mood_event/high_five_full_hand
	description = "<span class='boldwarning'>Господи, даже не знаю как правильно дать пять...</span>\n"
	mood_change = -1
	timeout = 45 SECONDS

/datum/mood_event/left_hanging
	description = "<span class='boldwarning'>Но ведь все любят давать пять! Может окружающие попросту... ненавидят меня?</span>\n"
	mood_change = -2
	timeout = 1.5 MINUTES

/datum/mood_event/too_slow
	description = "<span class='boldwarning'>НЕТ! ПОЧЕМУ ВСЕ ВОКРУГ.... ТАКОЕ МЕДЛЕННОЕ???</span>\n"
	mood_change = -2 // multiplied by how many people saw it happen, up to 8, so potentially massive. the ULTIMATE prank carries a lot of weight
	timeout = 2 MINUTES

/datum/mood_event/too_slow/add_effects(param)
	var/people_laughing_at_you = 1 // start with 1 in case they're on the same tile or something
	for(var/mob/living/carbon/iter_carbon in oview(owner, 7))
		if(iter_carbon.stat == CONSCIOUS)
			people_laughing_at_you++
			if(people_laughing_at_you > 7)
				break

	mood_change *= people_laughing_at_you
	return ..()

/datum/mood_event/sacrifice_bad
	description = "<span class='warning'>Проклятые дикари!</span>\n"
	mood_change = -5
	timeout = 2 MINUTES
