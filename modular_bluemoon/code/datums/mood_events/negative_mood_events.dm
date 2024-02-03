/*
 * ИВЕНТЫ НАСТРОЕНИЯ, СВЯЗАННЫЕ С ВАМПИРАМИ-АНТАГОНИСТАМИ
 */

/datum/mood_event/drankkilled/lesser
	description = "<span class='warning'>Моя жертва умерла от потери крови. Это слишком жестоко...</span>\n"
	mood_change = -6
	timeout = 15 MINUTES

/datum/mood_event/drankkilled/minimal
	description = "<span class='danger'>Моя жертва умерла от потери крови... Неужели я действительно такое чудовище?</span>\n"
	mood_change = -3
	timeout = 5 MINUTES

