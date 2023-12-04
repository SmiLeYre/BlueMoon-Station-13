#define QAREEN_IMMUNITY	"qareen_immunity"

/datum/quirk/qareen_immunity
	name = "Иммунитет от тёмной пошлости"
	desc = "Заслышав об активной эпидемии некой тёмной пошлости, вы сделали себе привику заранее. Или же на вас наложили оберег?"
	gain_text = span_notice("Вы чувствуете что тёмная пошлость вас не тронет.")
	lose_text = span_notice("Вы больше не чувствуете что тёмная пошлость вас не тронет.")
	medical_record_text = "Пациент был привит от пошлой чумы."
	mob_trait = QAREEN_IMMUNITY
	value = 0
