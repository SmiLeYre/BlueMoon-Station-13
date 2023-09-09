//For big characters and such
/datum/element/bigtalk
	element_flags = ELEMENT_DETACH

/datum/element/bigtalk/Attach(datum/target, force = FALSE)
	. = ..()
	if(!(isliving(target) || (force && istype(target, /atom/movable))))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_MOB_SAY, .proc/handle_speech)

/datum/element/bigtalk/Detach(datum/source, force)
	. = ..()
	UnregisterSignal(source, COMSIG_MOB_SAY)

/datum/element/bigtalk/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER

	speech_args[SPEECH_SPANS] |= SPAN_BIG
