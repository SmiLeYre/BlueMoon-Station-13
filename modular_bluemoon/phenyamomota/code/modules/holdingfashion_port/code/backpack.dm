/obj/item/BoH_inert
	name = "inert bag of nothing"
	desc = "What is currently a just an unwieldly block of metal with without slot ready to accept a bluespace anomaly core."
	icon = 'modular_bluemoon/phenyamomota/code/modules/holdingfashion_port/icons/items.dmi'
	icon_state = "bag-inert"

/obj/item/BoH_inert/bag
	name = "inert bag of holding"

/obj/item/BoH_inert/satchel
	name = "inert satchel of holding"
	icon_state = "satchel-inert"

/obj/item/BoH_inert/duffel
	name = "inert duffel bag of holding"
	icon_state = "duff-inert"

/obj/item/storage/backpack/holding
	var/second_chance = TRUE
	verb_say = "states"

/obj/item/storage/backpack/holding/Initialize(mapload)
	. = ..()
	desc += "<br>Can be recalibrated on solid surface with anomaly neutralizer."

/obj/item/storage/backpack/holding/examine()
	. = ..()
	var/stability = round(obj_integrity/max_integrity, 0.01) * 100
	. += "<br>Core [stability]% stable."

/obj/item/storage/backpack/holding/proc/teleport_damage(tele_damage, force_destruction = FALSE)
	obj_integrity = max(0, obj_integrity - tele_damage)
	var/stability = round(obj_integrity/max_integrity, 0.01) * 100
	if(stability == 0 && second_chance && !force_destruction)
		second_chance = FALSE
		obj_integrity = max_integrity * 0.01
		stability = 1

	switch(stability)
		if(0)
			say("Внимание, стабильность конструкции изменена и составляет 0%. Разрушение оболочки неизбежно.")
			SEND_SIGNAL(src, COMSIG_TRY_STORAGE_QUICK_EMPTY)
			new /obj/effect/anomaly/bluespace(get_turf(src))
			qdel(src)
		if(1 to 25)
			say("Внимание, стабильность конструкции изменена и составляет [stability]%. Требуется срочная рекалибровка.")
		if(26 to 50)
			say("Cтабильность конструкции изменена и составляет [stability]%. Крайне рекомендуется рекалибровка.")
		if(51 to 75)
			say("Cтабильность конструкции изменена и составляет [stability]%. Рекомендуется рекалибровка.")
		if(76 to 100)
			say("Cтабильность конструкции изменена и составляет [stability]%.")

/obj/item/storage/backpack/holding/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/anomaly_neutralizer) && !(user.a_intent == INTENT_HELP) && loc != user)
		to_chat(user, "<span class='notice'>You starts recalibrate [src] using [I].</span>")
		if(do_after(user, 20 SECONDS, src))
			to_chat(user, "<span class='notice'>The circuitry of [I] fries from the strain of recalibrating [src]!</span>")
			obj_integrity = max_integrity
			say("Рекалибровка конструкции завершена. Целостность составляет 100%.")
			qdel(I)
			return

	return ..()
