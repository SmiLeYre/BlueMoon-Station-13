// Слабый выстрел который станит
/obj/item/ammo_casing/energy/electrode/legax
	projectile_type = /obj/item/projectile/energy/electrode/security/hos/legax
	select_name = "weak gravpulse"
	fire_sound = 'modular_bluemoon/sanecman/sound/effects/gravpulser.ogg'
	e_cost = 25
	harmful = FALSE

/obj/item/projectile/energy/electrode/security/hos/legax
	name = "weak gravpulse"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "rune4center"
	color = COLOR_BLUE_GRAY
	hitsound = 'modular_bluemoon/sanecman/sound/effects/gravcut.ogg'
	tracer_type = null
	muzzle_type = null
	impact_type = null

// Сильный выстрел который дамажит
/obj/item/ammo_casing/energy/bolt/legax
	projectile_type = /obj/item/projectile/energy/bolt/legax
	select_name = "heavy gravpulse"
	fire_sound = 'modular_bluemoon/sanecman/sound/effects/gravpulser_alt.ogg'
	e_cost = 50

/obj/item/projectile/energy/bolt/legax
	name = "heavy gravpulse"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "rune4center"
	color = COLOR_MOSTLY_PURE_PINK
	hitsound = 'modular_bluemoon/sanecman/sound/effects/gravcut_alt.ogg'
	damage = 20
	damage_type = BRUTE
	nodamage = 0
	eyeblur = 0
	slur = 0
	knockdown = 0
	stamina = 5
	knockdown_stamoverride = 0

// Гравпульсер
// Два режима:
// heavy - Дамажит
// weak - Станит
// На лавебе heavy ломал нахуй кости а weak дамажил просто
// Тут я решил переделать чутка ибо дохуя имба когда тебя с нескольких выстрелов ломают пополам
/obj/item/gun/energy/taser/legax
	name = "Legax Gravpulser"
	desc = "An experimental handcannon with a catch."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/gravpulser/gravpulser.dmi'
	lefthand_file = 'modular_bluemoon/sanecman/icons/lifeweb/gravpulser/items_lefthand.dmi'
	righthand_file = 'modular_bluemoon/sanecman/icons/lifeweb/gravpulser/items_righthand.dmi'
	icon_state = "gravpulser"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/electrode/legax, /obj/item/ammo_casing/energy/bolt/legax)
