GLOBAL_LIST_INIT(shriek_types, list(SHRIEK_TYPE_GENERIC, SHRIEK_TYPE_GORILLA, SHRIEK_TYPE_ROAR))

/datum/preferences
	var/shriek_type = SHRIEK_TYPE_GENERIC // вид крика

/*
 * ДЕЙСТВИЕ
 */

/datum/action/cooldown/shriek
	name = "Shriek"
	desc = "Вы издаёте особо громкий крик, вызывающий неприятные ощущения у окружающих."
	icon_icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	button_icon_state = "ballgag"
	cooldown_time = 300 // КД, 30 секунд
	transparent_when_unavailable = TRUE

/datum/action/cooldown/shriek/Trigger()
	. = ..()
	if(!.) // Что-то мешает, например не прошёл КД или персонаж без сознания
		return FALSE

	var/mob/living/carbon/human/H = owner
	var/sound_type = SHRIEK_TYPE_GENERIC
	var/sound_description = "крик"
	switch(H.client?.prefs.shriek_type)
		if(SHRIEK_TYPE_GENERIC)
			sound_type = "sound/voice/shriek1.ogg"
			sound_description = "протяжный крик"
		if(SHRIEK_TYPE_ROAR)
			sound_type = "sound/creatures/space_dragon_roar.ogg"
			sound_description = "протяжный рык"
		if(SHRIEK_TYPE_GORILLA)
			sound_type = "sound/creatures/gorilla.ogg"
			sound_description = "клич гранта"

	playsound(get_turf(H), sound_type, 100)
	H.visible_message(span_boldwarning("[H] издаёт [sound_description]!"), span_notice("Вы издаёте [sound_description]!"))

	for(var/obj/machinery/light/L in view(4, get_turf(owner)))
		if(prob(50))
			L.flicker(3)
	for(var/mob/living/L in view(7, get_turf(owner)))
		if(HAS_TRAIT(L, TRAIT_BLUEMOON_SHRIEK))
			continue
		if(L.get_ear_protection() == FALSE)
			shake_camera(L, 5, 1)
			L.jitteriness += rand(2, 4)

	StartCooldown()
/*
 * КВИРК
 */

/datum/quirk/shriek
	name = BLUEMOON_TRAIT_NAME_SHRIEK
	desc = "Вы способны издавать особо громкий крик, мешающий работе систем освящения и вызыващий неприятные ощущения у всех, кто его услышит без защиты. \
	Такие же крикуны не почувствуют эффекта на себе. (Для настройки крика, используйте параметр Тип Крика в заголовке окна)"
	value = 1
	mob_trait = TRAIT_BLUEMOON_SHRIEK

/datum/quirk/shriek/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(!H)
		return
	var/datum/action/cooldown/shriek/C = new
	C.Grant(H)

/datum/quirk/shriek/remove()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/cooldown/shriek/C = locate() in H.actions
	C.Remove(H)
	. = ..()
