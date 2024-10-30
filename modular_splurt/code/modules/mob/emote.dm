/mob/emote(act, m_type, message, intentional)
	. = ..()
	//SPLURT added signal sending in /mob/proc/emote (emote.dm)
	//SEND_SIGNAL(src, COMSIG_MOB_EMOTE, args)
