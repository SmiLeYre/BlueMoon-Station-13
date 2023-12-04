/datum/mood_event/lewd_headpat
	description = span_nicegreen("Я так люблю поглаживания!\n")
	mood_change = 3
	timeout = 2 MINUTES
/datum/mood_event/qareen_bliss
	description = span_umbra("Все вокруг такие пошлые...\n")
	mood_change = 5

/datum/mood_event/qareen_bliss/add_effects()
	description = span_umbra("Нужно.. сношаться. , [pick("Н-р-р", "Не могу.. думать.", "Так хорошо.", "Хочу.. ебаться.")]...\n") // Ещё один налет испанского стыда, баляяя

/datum/mood_event/masked_mook
	description = span_nicegreen("В противогазе мне намного лучше.\n")
	mood_change = 1

/datum/mood_event/cloth_eaten
	description = "<span class='nicegreen'>Этот костюм определенно был вкусным!\n"
	mood_change = 3
	timeout = 2400

/datum/mood_event/cloth_eaten/add_effects(obj/item/clothing/eaten)
	description = "<span class='nicegreen'>Определенно это был [pick("вкусный","хороший","ворсистый","чудесный")] [eaten.name]!\n"

/datum/mood_event/nudist_positive
	description = span_nicegreen("Чудесно, что меня не сковывает одежда.\n")
	mood_change = 1

/datum/mood_event/dorsualiphobic_mood_positive
	description = span_nicegreen("Никто не узнает, ношу я рюкзак или нет.\n")
	mood_change = 1

/datum/mood_event/drank_cursed_good
	description = span_nicegreen("Мною была испита кровь другого носителя проклятия.\n")
	mood_change = 1
	timeout = 2 MINUTES

/datum/mood_event/drank_exotic_matched
	description = span_nicegreen("Мною была испита родственная кровь!\n")
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/brainwashed
	description = span_mind_control("Путь для меня был предначертан, и ему необходимо следовать!\n")
	mood_change = 1
	hidden = TRUE
