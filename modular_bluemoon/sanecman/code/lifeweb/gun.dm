// Слабый выстрел который станит
/obj/item/ammo_casing/energy/electrode/legax
	projectile_type = /obj/item/projectile/energy/electrode/security/hos/legax
	select_name = "weak gravpulse"
	fire_sound = 'modular_bluemoon/sanecman/sound/effects/gravpulser.ogg'
	e_cost = 50
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
/obj/item/ammo_casing/energy/laser/legax
	projectile_type = /obj/item/projectile/beam/laser/heavylaser/legax
	select_name = "heavy gravpulse"
	fire_sound = 'modular_bluemoon/sanecman/sound/effects/gravpulser_alt.ogg'
	e_cost = 200

/obj/item/projectile/beam/laser/heavylaser/legax
	name = "heavy gravpulse"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "rune4center"
	color = COLOR_BLUE_LIGHT
	hitsound = 'modular_bluemoon/sanecman/sound/effects/gravcut_alt.ogg'
	damage = 20
	damage_type = BRUTE
	tracer_type = null
	muzzle_type = null
	impact_type = null

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
	ammo_type = list(/obj/item/ammo_casing/energy/electrode/legax, /obj/item/projectile/beam/laser/heavylaser/legax)
