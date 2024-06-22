/datum/language/modular_bluemoon/demonic
	name = LANGUAGE_DEMONIC
	desc = "The native language of many out-worlded beings. Often can be heard from someone a human could describe as a demon, fiend or anyone inbetween. (Используйте русскую букву для префикса)."
	icon = 'modular_bluemoon/icons/misc/language.dmi'
	icon_state = "demonic"
	speech_verb = "proclaims"
	ask_verb = "queries"
	exclaim_verb = "declares"
	whisper_verb = "hushes"
	key = "д"
	space_chance = 65
	syllables = list( // буквально латинские корни
		"ann", "acu", "audi", "bene", "bi", "bibl", "cent", "circum", "civ",
		"clar", "cred", "dict", "ex", "fract", "inter", "jur", "lax", "liber",
		"lumin", "magn", "mal", "migr", "multi", "neg", "non", "nov", "ov",
		"pre", "prim", "proxim", "ques", "re", "retro", "san", "sci", "scrib",
		"semi", "sens", "soci", "sol", "sub", "surg", "temp", "tes", "trans",
		"vac", "vag", "ver", "vid", "uni"
	)
	default_priority = 92
	restricted = FALSE
