/mob/living/ComponentInitialize()
	. = ..()
	RegisterSignal(src, SIGNAL_TRAIT(TRAIT_FLOORED), PROC_REF(update_mobility))
	AddComponent(/datum/component/combat_mode) // BLUEMOON ADD - боевой индикатор для всех мобов
