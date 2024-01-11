/obj/effect/mob_spawn/qareen/attack_ghost(mob/user, latejoinercalling)
	if(GLOB.master_mode == "Extended")
		return . = ..()
	else
		return to_chat(user, "<span class='warning'>Игра за ЕРП-антагонистов допускается лишь в Режим Extended!</span>")

/obj/effect/mob_spawn/qareen //not grief antag u little shits
	name = "Qareen - The Horny Spirit"
	desc = "An ancient tomb designed for long-term stasis. This one has the word HORNY scratched all over the surface!"
	mob_name = "Qaaren"
	mob_type = 	/mob/living/simple_animal/qareen
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	short_desc = "Вы Карен!"
	flavour_text = "Вы Карен! Дух похоти! Для общения с другими Карен используйте :q. Ваш прежде мирской дух был запитан инопланетной энергией и преобразован в qareen. Вы не являетесь ни живым, ни мёртвым, а чем-то посередине. Вы способны взаимодействовать с обоими мирами. Вы неуязвимы и невидимы для живых, но не для призраков."
	important_info = "НЕ ГРИФЕРИТЬ, ИНАЧЕ ВАС ЗАБАНЯТ!!"
	death = FALSE
	roundstart = FALSE
	random = FALSE
	uses = 2

/obj/effect/mob_spawn/qareen/wendigo //not grief antag u little shits
	name = "Woman Wendigo - The Horny Creature"
	short_desc = "Вы Вендиго!"
	desc = "Вендиго. Озабоченный монстр-женщина."
	icon_state = "sleeper_clockwork"
	mob_name = "Wendigo-Woman"
	mob_type = /mob/living/carbon/wendigo
	flavour_text = "Вы Вендиго-Женщина."

/obj/effect/mob_spawn/qareen/wendigo_man //not grief antag u little shits
	name = "Man Wendigo - The Horny Creature"
	short_desc = "Вы Вендиго!"
	desc = "Вендиго. Озабоченный монстр-мужчина."
	icon_state = "sleeper_clockwork"
	mob_name = "Wendigo-Man"
	mob_type = /mob/living/carbon/wendigo/man
	flavour_text = "Вы Вендиго-Мужчина."
