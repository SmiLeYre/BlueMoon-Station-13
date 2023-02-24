/*
 * # lewd_prefs_choices
 * Used for determining the possible choices for lewd prefs,
 * downstreams can modify this and i don't know,
 * remove "Ask"? or make a very confusing list of options which will make players hate you for it.
*/
GLOBAL_LIST_INIT(lewd_prefs_choices, list(
	"Yes",
	"Ask",
	"No"
	))

#define CUM_TARGET_MOUTH "рот"
#define CUM_TARGET_THROAT "глотка"
#define CUM_TARGET_VAGINA "влагалище"
#define CUM_TARGET_ANUS "анус"
#define CUM_TARGET_HAND "рука"
#define CUM_TARGET_BREASTS "грудь"
#define CUM_TARGET_FEET "ножки"
#define CUM_TARGET_PENIS "пенис"
//Weird defines go here
#define CUM_TARGET_EARS "глаз"
#define CUM_TARGET_EYES "глаза"
//
#define GRINDING_FACE_WITH_ANUS "лицо об анус"
#define GRINDING_FACE_WITH_FEET "лицо об ступню"
#define GRINDING_MOUTH_WITH_FEET "рот об ступню"
#define THIGH_SMOTHERING "бёдра"
#define NUTS_TO_FACE "яйца к лицу"

#define NORMAL_LUST 12
#define LOW_LUST 4

#define REQUIRE_NONE 0
#define REQUIRE_EXPOSED 1
#define REQUIRE_UNEXPOSED 2
#define REQUIRE_ANY 3
