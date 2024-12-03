/datum/mod_theme/InteQ
	name = "InteQ"
	desc = "A highly advanced combat suit, decorated with a sinister-looking dark blue colors, manufactured and crafted for special operations mercenaries. "
	extended_desc = "A highly advanced combat suit, decorated with a sinister-looking dark blue colors, manufactured and crafted for special operations mercenaries. The design is a streamlined layered construction composed of molded plasteel and composite ceramics, while the undersuit is lined with lightweight kevlar and hybrid duratri weave. A small tag hangs on it that reads: Made by Fox and Ghost inc cooperation. All rights reserved, tampering with the suit's design will result in immediate suit annihilation."
	default_skin = "InteQ"
	armor = list(MELEE = 60, BULLET = 60, LASER = 50, ENERGY = 30, BOMB = 60, BIO = 100, FIRE = 100, ACID = 100, WOUND = 80, RAD = 70)
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	slowdown_inactive = 1
	slowdown_active = 0.5
	ui_theme = "inteq"
	inbuilt_modules = list()
	skins = list(
		"InteQ" = list(
			HELMET_LAYER = NECK_LAYER,
			HELMET_FLAGS = list(
				UNSEALED_CLOTHING = NONE,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|ALLOWINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
			),
		),
	)
