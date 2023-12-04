/mob/living/ComponentInitialize()
	. = ..()
	RegisterSignal(src, SIGNAL_TRAIT(TRAIT_FLOORED), .proc/update_mobility)
	AddComponent(/datum/component/combat_mode) // BLUEMOON ADD - боевой индикатор для всех мобов
