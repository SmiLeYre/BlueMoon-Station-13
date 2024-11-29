/datum/quirk/ashresistance
	name = "Пепельная Устойчивость"
	desc = "Ваше тело адаптировалось к пылающим покровам пепла, которые застилают вулканические миры, но это не значит, что вы не будете уставать."
	value = 2 //Is not actually THAT good. Does not grant breathing and does stamina damage to the point you are unable to attack. Crippling on lavaland, but you'll survive. Is not a replacement for SEVA suits for this reason. Can be adjusted.
	mob_trait = TRAIT_ASHRESISTANCE
	medical_record_text = "У пациента аномально плотный эпидермис."
	gain_text = "<span class='notice'>Вы чувствуете себя устойчивее против горящей серы.</span>"
	lose_text = "<span class='notice'>Ваша плоть становится более легковоспламеняемой.</span>"

/* --FALLBACK SYSTEM INCASE THE TRAIT FAILS TO WORK. Do NOT enable this without editing ash_storm.dm to deal stamina damage with ash immunity.
/datum/quirk/ashresistance/add()
	quirk_holder.weather_immunities |= "ash"

/datum/quirk/ashresistance/remove()
	if(!quirk_holder)
		return
	quirk_holder.weather_immunities -= "ash"
*/
