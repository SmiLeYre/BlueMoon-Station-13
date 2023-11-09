#define LOADOUT_SUBCATEGORIES_DON01 "Snacksman"
#define LOADOUT_SUBCATEGORIES_DON02 "Reaper"
#define LOADOUT_SUBCATEGORIES_DON03 "Zarshef"
#define LOADOUT_SUBCATEGORIES_DON04 "Gastonix"
#define LOADOUT_SUBCATEGORIES_DON05 "Weirdbutton"
#define LOADOUT_SUBCATEGORIES_DON06 "leony24"
#define LOADOUT_SUBCATEGORIES_DON07 "Rainbowkurwa"
#define LOADOUT_SUBCATEGORIES_DON08 "Lakomkin0911"
#define LOADOUT_SUBCATEGORIES_DON09 "Noterravija"
#define LOADOUT_SUBCATEGORIES_DON10 "Krashly"
#define LOADOUT_SUBCATEGORIES_DON11 "XDinka"
#define LOADOUT_SUBCATEGORIES_DON12 "Contributors" // Раздел для разработчиков, мапперов и спрайтеров, вносящих вклад в проект
#define LOADOUT_SUBCATEGORIES_DON13 "Friskis"
#define LOADOUT_SUBCATEGORIES_DON14 "Rarslt"
#define LOADOUT_SUBCATEGORIES_DON15 "PhenyaMomota"
#define LOADOUT_SUBCATEGORIES_DON16 "Dolbajob"
#define LOADOUT_SUBCATEGORIES_DON17 "VulpShiro"
#define LOADOUT_SUBCATEGORIES_DON18 "TrollAndrew"
#define LOADOUT_SUBCATEGORIES_DON19 "Shalun228"
#define LOADOUT_SUBCATEGORIES_DON20 "Noonar"
#define LOADOUT_SUBCATEGORIES_DON21 "Kalifa"

GLOBAL_LIST_INIT(loadout_categories, list(
	LOADOUT_CATEGORY_BACKPACK = list(LOADOUT_SUBCATEGORY_BACKPACK_GENERAL, LOADOUT_SUBCATEGORY_BACKPACK_TOYS),
	LOADOUT_CATEGORY_NECK = list(LOADOUT_SUBCATEGORY_NECK_GENERAL, LOADOUT_SUBCATEGORY_NECK_TIE, LOADOUT_SUBCATEGORY_NECK_SCARVES),
	LOADOUT_CATEGORY_MASK = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_HANDS = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_UNIFORM = list(LOADOUT_SUBCATEGORY_UNIFORM_GENERAL, LOADOUT_SUBCATEGORY_UNIFORM_JOBS, LOADOUT_SUBCATEGORY_UNIFORM_SUITS, LOADOUT_SUBCATEGORY_UNIFORM_SKIRTS, LOADOUT_SUBCATEGORY_UNIFORM_DRESSES, LOADOUT_SUBCATEGORY_UNIFORM_SWEATERS, LOADOUT_SUBCATEGORY_UNIFORM_PANTS, LOADOUT_SUBCATEGORY_UNIFORM_SHORTS),
	LOADOUT_CATEGORY_ACCESSORY = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_SUIT = list(LOADOUT_SUBCATEGORY_SUIT_GENERAL, LOADOUT_SUBCATEGORY_SUIT_COATS, LOADOUT_SUBCATEGORY_SUIT_JACKETS, LOADOUT_SUBCATEGORY_SUIT_JOBS),
	LOADOUT_CATEGORY_HEAD = list(LOADOUT_SUBCATEGORY_HEAD_GENERAL, LOADOUT_SUBCATEGORY_HEAD_JOBS),
	LOADOUT_CATEGORY_SHOES = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_GLOVES = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_GLASSES = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_DONATOR = list(LOADOUT_SUBCATEGORY_NONE, LOADOUT_SUBCATEGORIES_DON01, LOADOUT_SUBCATEGORIES_DON02, LOADOUT_SUBCATEGORIES_DON03, LOADOUT_SUBCATEGORIES_DON04, LOADOUT_SUBCATEGORIES_DON05, LOADOUT_SUBCATEGORIES_DON06, LOADOUT_SUBCATEGORIES_DON07, LOADOUT_SUBCATEGORIES_DON08, LOADOUT_SUBCATEGORIES_DON09, LOADOUT_SUBCATEGORIES_DON10, LOADOUT_SUBCATEGORIES_DON11, LOADOUT_SUBCATEGORIES_DON12, LOADOUT_SUBCATEGORIES_DON13, LOADOUT_SUBCATEGORIES_DON14, LOADOUT_SUBCATEGORIES_DON15, LOADOUT_SUBCATEGORIES_DON16, LOADOUT_SUBCATEGORIES_DON17, LOADOUT_SUBCATEGORIES_DON18, LOADOUT_SUBCATEGORIES_DON19, LOADOUT_SUBCATEGORIES_DON20, LOADOUT_SUBCATEGORIES_DON21),
	LOADOUT_CATEGORY_UNLOCKABLE = LOADOUT_SUBCATEGORIES_NONE,
	LOADOUT_CATEGORY_GENERAL_UNDER = list(LOADOUT_SUBCATEGORY_UNDERWEAR, LOADOUT_SUBCATEGORY_SHIRT, LOADOUT_SUBCATEGORY_SOCKS),
	LOADOUT_CATEGORY_WRISTS = list(LOADOUT_SUBCATEGORY_WATCHES, LOADOUT_SUBCATEGORY_NONE), //DIDN'T NOTICE THIS
	LOADOUT_CATEGORY_ERROR = LOADOUT_SUBCATEGORIES_NONE
))
