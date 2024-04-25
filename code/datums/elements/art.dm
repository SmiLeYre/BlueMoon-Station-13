
#define BAD_ART 12.5
#define GOOD_ART 25
#define GREAT_ART 50

/datum/element/art
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2
	var/impressiveness = 0

/datum/element/art/Attach(datum/target, impress)
	. = ..()
	if(. == ELEMENT_INCOMPATIBLE || !isatom(target) || isarea(target))
		return ELEMENT_INCOMPATIBLE
	impressiveness = impress
	if(isobj(target))
		RegisterSignal(target, COMSIG_PARENT_EXAMINE, PROC_REF(on_obj_examine))
		if(isstructure(target))
			RegisterSignal(target, COMSIG_ATOM_ATTACK_HAND, PROC_REF(on_attack_hand))
		if(isitem(target))
			RegisterSignal(target, COMSIG_ITEM_ATTACK_SELF, PROC_REF(apply_moodlet))
	else
		RegisterSignal(target, COMSIG_PARENT_EXAMINE, PROC_REF(on_other_examine))

/datum/element/art/Detach(datum/target)
	UnregisterSignal(target, list(COMSIG_PARENT_EXAMINE, COMSIG_ATOM_ATTACK_HAND, COMSIG_ITEM_ATTACK_SELF))
	return ..()

/datum/element/art/proc/apply_moodlet(atom/source, mob/M, impress)
	SIGNAL_HANDLER

	var/msg
	switch(impress)
		if(GREAT_ART to INFINITY)
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "artgreat", /datum/mood_event/artgreat)
			msg = "Что за [pick("шедевральное", "гениальное")] произведение искусства. Какой [pick("непревзойденный", "внушающий благоговение", "завораживающий", "безупречный")] стиль!"
		if (GOOD_ART to GREAT_ART)
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "artgood", /datum/mood_event/artgood)
			msg = "Это [pick("уважаемое", "похвальное", "качественное")] произведение искусства, которое можно только увидеть."
		if (BAD_ART to GOOD_ART)
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "artok", /datum/mood_event/artok)
			msg = "Это выглядит на среднем уровне, достаточно, чтобы называться \"ИСКУССТВОМ\"."
		if (0 to BAD_ART)
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "artbad", /datum/mood_event/artbad)
			msg = "Вау, [source.ru_who()] выглядит ущербно."

	M.visible_message(span_notice("[M] останавливается и пристально смотрит на [source].") , \
	span_notice("Оцениваю [source]... [msg]"))

/datum/element/art/proc/on_other_examine(atom/source, mob/M)
	apply_moodlet(source, M, impressiveness)

/datum/element/art/proc/on_obj_examine(atom/source, mob/M)
	var/obj/O = source
	apply_moodlet(source, M, impressiveness *(O.obj_integrity/O.max_integrity))

/datum/element/art/proc/on_attack_hand(atom/source, mob/M)
	to_chat(M, "<span class='notice'>Любуюсь [source]...</span>")
	if(!do_after(M, 20, target = source))
		return
	on_obj_examine(source, M)

/datum/element/art/rev

/datum/element/art/rev/apply_moodlet(atom/source, mob/user, impress)
	var/msg
	if(user.mind?.has_antag_datum(/datum/antagonist/rev))
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "artgreat", /datum/mood_event/artgreat)
		msg = "Какое [pick("шедевральное", "гениальное")] произведение искусства. Какой [pick("разрушительный", "революционный", "объединяющий", "эгалитарный")] стиль!"
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "artbad", /datum/mood_event/artbad)
		msg = "Вау, [source.ru_who()] выглядит ущербно."

	user.visible_message(span_notice("[user] прекращает изучать [source].") , \
		span_notice("Оцениваю [source], осмотрев искусное мастерство пролетариата... [msg]"))
