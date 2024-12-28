/datum/quirk/flimsy
	name = "Хрупкость"
	desc = "Ваше тело слабее, чем у большинства, здоровье уменьшено на 20%."
	value = -2
	medical_record_text = "У пациента чрезвычайно низкая устойчивость к травмам."
	gain_text = span_notice("Вы чувствуете, что вас могли бы снести с одного удара.")
	lose_text = span_notice("Вы чувствуете себя крепче.")

/datum/quirk/flimsy/add()
	quirk_holder.maxHealth *= 0.8

/datum/quirk/flimsy/remove() //how do admins even remove traits?
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 1.25
