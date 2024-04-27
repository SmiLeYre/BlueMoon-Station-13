// Лёхавеб неразрушаемые стенки
/turf/closed/indestructible/riveted/lfwb
	name = "wall"
	desc = "A metal wall."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/metalic_wall.dmi'
	icon_state = "metalic"

// Пещерные неразрушаемые стенки
/turf/closed/indestructible/riveted/lfwb/cave
	name = "cave wall"
	desc = "Не очень гладкая стена из камня."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/cave_wall.dmi'
	icon_state = "cave"

// Стенки космической станции
/turf/closed/indestructible/riveted/lfwb/leviathan
	name = "metal wall"
	desc = "A wall made of old steel."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/leviathan_wall.dmi'
	icon_state = "leviathan"

// Стенки станции душеломов
/turf/closed/indestructible/riveted/lfwb/soulbreaker
	name = "hive wall"
	desc = "A metal wall."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/soulbreaker_wall.dmi'
	icon_state = "soulbreaker"

// Окошко душеломов
/turf/closed/indestructible/riveted/lfwb/soulbreaker/fakeglass
	name = "window"
	desc = "Стекло выглядит очень крепким."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/soulbreaker_fakewindow_wall.dmi'
	icon_state = "window"
	opacity = 0

/turf/closed/indestructible/fakeglass/Initialize(mapload)
	. = ..()
	underlays += mutable_appearance('icons/turf/floors.dmi', "plating") //add the plating underlay, below the grille

// Тёмный пол
/turf/open/indestructible/lfwb
	name = "floor"
	desc = "Достаточно крепкий."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/no_smooth_turf.dmi'
	icon_state = "coding_by_sanecman"
	baseturfs = /turf/open/indestructible/lfwb
	tiled_dirt = FALSE

/turf/open/indestructible/lfwb/no_smooth
	baseturfs = /turf/open/indestructible/lfwb/no_smooth

// Рандомизация спрайта пола как на старых билдах
/turf/open/indestructible/lfwb/no_smooth/Initialize(mapload)
	. = ..()
	dir = rand(0,8)

// Пол душеломов
/turf/open/indestructible/lfwb/no_smooth/soulbreaker
	name = "floor"
	desc = "Красный пол."
	icon_state = "soul"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/soulbreaker/b

/turf/open/indestructible/lfwb/no_smooth/soulbreaker/b
	name = "floor"
	desc = "Красный повреждённый пол."
	icon_state = "soul_b"

// Немного другая версия тёмного пола
/turf/open/indestructible/lfwb/no_smooth/darkfloor
	name = "floor"
	icon_state = "darkfloor"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/darkfloor

// Узорчатый пол
/turf/open/indestructible/lfwb/no_smooth/cluster
	name = "floor"
	desc = "Красивый пол."
	icon_state = "cluster"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/cluster

// Пещерный пол
/turf/open/indestructible/lfwb/no_smooth/cave
	name = "ground"
	desc = "Выглядит скудно."
	icon_state = "cave"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/cave

// Красивый пещерный пол
/turf/open/indestructible/lfwb/no_smooth/stone
	name = "stone ground"
	desc = "Выглядит интересно."
	icon_state = "stone"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/stone

// Деревянный пол
/turf/open/indestructible/lfwb/no_smooth/wood
	name = "wood floor"
	desc = "Пахнет грибами."
	icon_state = "wood"
	baseturfs = /turf/open/indestructible/lfwb/no_smooth/wood

// Красивый ковёр
/turf/open/indestructible/lfwb/carpet
	name = "carpet"
	desc = "Красный красивый ковёр."
	icon = 'modular_bluemoon/sanecman/icons/lifeweb/turf/carpet_turf.dmi'
	icon_state = "carpet"
	smooth = SMOOTH_TRUE
	footstep = FOOTSTEP_CARPET
	baseturfs = /turf/open/indestructible/lfwb/carpet
