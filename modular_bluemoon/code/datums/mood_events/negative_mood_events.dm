/*
 * ИВЕНТЫ НАСТРОЕНИЯ, СВЯЗАННЫЕ С ВАМПИРАМИ-АНТАГОНИСТАМИ
 */

/datum/mood_event/gave_blood_to_bloodsucker
	description = span_nicegreen("Я ощущаю покалывание в шеи, но это было просто прекрасно! Что бы это ни было...\n")
	mood_change = 12
	timeout = 2 MINUTES // кратковременный, но очень мощный позитивный эффект за укус

/datum/mood_event/gave_blood_to_bloodsucker/vassal // вассалы получают сниженный баф, т.к. их уже не нужно убеждать вступить и это халявный муд, по делу
	description = span_nicegreen("Вампир укусил меня! Это было прекрасно... Но уже не так, как до служения.\n")
	mood_change = 6

/datum/mood_event/drankkilled/lesser
	description = "<span class='warning'>Моя жертва умерла от потери крови. Это слишком жестоко...</span>\n"
	mood_change = -6
	timeout = 15 MINUTES

/datum/mood_event/drankkilled/minimal
	description = "<span class='danger'>Моя жертва умерла от потери крови... Неужели я действительно такое чудовище?</span>\n"
	mood_change = -3
	timeout = 5 MINUTES

