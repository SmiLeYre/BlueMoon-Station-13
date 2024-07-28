// /datum/quirk/nt_senior_employee
// 	name = "Специалист НаноТрейзен"
// 	desc = "Вы опытный сотрудник НаноТрейзен. Корпорация предоставляет вам ряд бонусов ввиде доплаты за смену, имплантации, фирменного бейджа и\
// 	разрешения на оружие. Помимо этого вы знаете корпоративный язык. Однако в силу тсщательной проверки со стороны службы внутренней безопасности \
// 	вы не можете быть антагонистом."
// 	value = 2
// 	mood_quirk = FALSE
// 	processing_quirk = FALSE

// /datum/quirk/nt_senior_employee/on_spawn()
// 	. = ..()

// 	quirk_holder.grant_language(/datum/language/corpspeak, TRUE, TRUE, LANGUAGE_MIND)
// 	give_item(/obj/item/clothing/accessory/badge_nt_senior, quirk_holder)
// 	var/obj/item/implant/I = new /obj/item/implant/mindshield
// 	I.implant(quirk_holder, null, TRUE)
// 	I = new /obj/item/implant/death_alert
// 	I.implant(quirk_holder, null, TRUE)

// 		// if (cybernetic_implants)
// 		// 	for (var/cybernetic_implant_type in cybernetic_implants)
// 		// 		var/obj/item/organ/C = new cybernetic_implant_type()
// 		// 		C.Insert(H)


// /datum/quirk/syndi_senior_employee
// 	name = "Специалист Синдиката"
// 	desc = "Вы опытный сотрудник Синдиката. Корпорация предоставляет вам ряд бонусов ввиде доплаты за смену, набора корпоративной формы, фирменного бейджа,\
// 	разрешения на оружие и самого оружия непосредственно. Помимо этого вы знаете кодовый язык. Однако в силу тсщательной проверки со стороны службы внутренней безопасности \
// 	вы не можете быть антагонистом."
// 	value = 2
// 	mood_quirk = FALSE
// 	processing_quirk = FALSE

// /datum/quirk/syndi_senior_employee/on_spawn()
// 	. = ..()

// 	quirk_holder.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
// 	give_item(/obj/item/storage/backpack/duffelbag/syndie/senior, quirk_holder)
