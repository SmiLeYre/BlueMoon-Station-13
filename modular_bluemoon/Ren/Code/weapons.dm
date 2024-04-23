/// USHM
/obj/item/pickaxe/drill/jackhammer/angle_grinder
	name = "USHM"
	icon = 'modular_bluemoon/Ren/Icons/Obj/USM.dmi'
	icon_state = "RSHM_vrum-vrum"
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/ushm_r.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/ushm_r.dmi'
	item_state = "ushm_r"
	w_class = WEIGHT_CLASS_BULKY
	toolspeed = 0.3 //the epitome of powertools. extremely fast mining, laughs at puny walls
	usesound = 'modular_bluemoon/Ren/Sound/USHM_hit.ogg'
	hitsound = 'modular_bluemoon/Ren/Sound/USHM_hit.ogg'
	desc = "УШМ с алмазным диском и четырёх тактовым двигателем на жидкой плазме. Что ещё может быть нужно, когда требуется взять штурмом чью то крепость? "
	force = 30
	attack_speed = CLICK_CD_MELEE * 1.5
	throwforce = 10
	wound_bonus = 40
	armour_penetration = 20
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "shredded")

/obj/item/pickaxe/drill/jackhammer/angle_grinder/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window)) //destroys windows and grilles in one hit (or more if it has a ton of health like plasmaglass)
		var/obj/structure/window/W = A
		W.take_damage(200, BRUTE, MELEE, 0)
	else if(istype(A, /obj/structure/grille))
		var/obj/structure/grille/G = A
		G.take_damage(40, BRUTE, MELEE, 0)

/obj/item/pickaxe/drill/jackhammer/angle_grinder/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/// Melter
/obj/item/gun/energy/pulse/pistol/inteq
	name = "Melter"
	desc = "<span class='danger'>Не направлять рабочую часть на живых существ</span>"
	icon = 'modular_bluemoon/Ren/Icons/Obj/guns.dmi'
	icon_state = "melter"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/melter)
	cell_type = "/obj/item/stock_parts/cell/pulse/pistol"

/obj/item/ammo_casing/energy/laser/melter
	projectile_type = /obj/item/projectile/beam/melter
	e_cost = 300
	select_name = "MELT"
	fire_sound = 'modular_bluemoon/Ren/Sound/Melter.ogg'

/obj/item/projectile/beam/melter
	icon_state = "pulse0"
	damage = 60
	light_color = "#ffff00"
	wound_bonus = 40

/obj/item/projectile/beam/melter/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!QDELETED(target) && (isturf(target) || istype(target, /obj/structure/)))
		target.ex_act(EXPLODE_HEAVY)
	var/turf/open/target_turf = get_turf(target)
	if(istype(target_turf))
		new /obj/effect/decal/cleanable/plasma(drop_location(target_turf))

/// AA12
/obj/item/ammo_box/magazine/aa12/small
	name = "AA12 magazine (12g buckshot)"
	desc = "Здоровый коробчатый магазин для патрон 12 калибра"
	icon_state = "mag-aa-small"
	icon = 'modular_bluemoon/Ren/Icons/Obj/guns.dmi'
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 8

/obj/item/ammo_box/magazine/aa12/small/update_icon()
	..()
	icon_state = "mag-aa-small-[ammo_count() ? "1" : "0"]"

/obj/item/ammo_box/magazine/aa12
	name = "AA12 drum magazine (12g buckshot)"
	desc = "Здоровый барабанный магазин для патрон 12 калибра"
	icon_state = "mag-aa"
	icon = 'modular_bluemoon/Ren/Icons/Obj/guns.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 20

/obj/item/ammo_box/magazine/aa12/update_icon()
	..()
	icon_state = "mag-aa-[ammo_count() ? "1" : "0"]"

/obj/item/gun/ballistic/automatic/shotgun/aa12
	name = "\improper AA12"
	desc = "Древняя, но очень грозная оружейная система. Почему то на ней отсутствует одиночный огонь."
	icon_state = "minotaur"
	item_state = "minotaur"
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file =  'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/guns.dmi'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	recoil = 5
	mag_type = /obj/item/ammo_box/magazine/aa12
	fire_sound = 'sound/weapons/gunshotshotgunshot.ogg'
	automatic_burst_overlay = FALSE
	can_suppress = FALSE
	fire_select = 1
	burst_size = 1
	actions_types = list()

/obj/item/gun/ballistic/automatic/shotgun/aa12/update_icon_state()
	..()
	if(magazine)
		if(magazine.ammo_count(0))
			icon_state = "minotaur-mag"
		else
			icon_state = "minotaur-mag-e"
	else
		if(magazine.ammo_count(0))
			icon_state = "minotaur-nomag-e"
		else
			icon_state = "minotaur-nomag"

/obj/item/gun/ballistic/automatic/shotgun/aa12/afterattack()
	. = ..()
	empty_alarm()
	return

//Огнемёт крутой
/obj/item/projectile/bullet/incendiary/m2a100
	name = "Fire"
	damage = 7
	fire_stacks = 10
	damage_type = BURN
	icon_state = ""
	hitsound_wall = ""
	projectile_piercing = PASSMOB
	range = 15

/obj/item/ammo_casing/energy/laser/m2a100
	projectile_type = /obj/item/projectile/bullet/incendiary/m2a100
	pellets = 6
	variance = 35
	e_cost = 50
	select_name = "Fire"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/flamethrower.ogg'

/obj/item/gun/energy/m2a100
	name = "M2A100"
	desc = "Удачная модернизация старых моделей огнемётов из солнечной системы. Совмещает в себе компактность, простоту использования и использование твёрдой плазмы в качестве топлива."
	icon_state = "m240"
	item_state = "m240_0"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/guns.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/m2a100)
	attack_verb = list("attacked", "bumped", "hited")
	force = 12
	inaccuracy_modifier = 0.25
	can_charge = 0
	var/cover_open = FALSE

/obj/item/gun/energy/m2a100/examine(mob/user)
	. = ..()
	if(cell)
		. += "<span class='notice'>[src] is [round(cell.percent())]% of fuel.</span>"

/obj/item/gun/energy/m2a100/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/energy/m2a100/update_icon_state()
	if(cell.percent() > 0)
		icon_state = "m240[cover_open ? "-open" : "-closed"]"
	else
		icon_state = "m240[cover_open ? "-open" : "-closed"]-empty"

/obj/item/gun/energy/m2a100/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/sheet/mineral/plasma) && cover_open == TRUE)
		I.use(1)
		cell.give(500)
		to_chat(user, "<span class='notice'>You insert [I] in [src], recharging it.</span>")
	else if(istype(I, /obj/item/stack/ore/plasma) && cover_open == TRUE)
		I.use(1)
		cell.give(100)
		to_chat(user, "<span class='notice'>You insert [I] in [src], recharging it.</span>")
	else
		..()

/obj/item/gun/energy/m2a100/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

///ГАРАНД
/obj/item/disk/design_disk/adv/ammo/garand
	name = "Ammo desine disk"
	desc = "Вставь в автолат, что-бы печатать крутые патроны"

/obj/item/disk/design_disk/adv/ammo/garand/Initialize(mapload)
	. = ..()
	var/datum/design/ammo_garand/A = new
	var/datum/design/ammo_garand_rubber/H = new
	blueprints[1] = A
	blueprints[2] = H

/datum/design/ammo_garand
	name = "Enbloc clip (.308)."
	desc = "An enbloc clip for a Mars Service Rifle."
	id = "ammo_garand"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 28000)
	build_path = /obj/item/ammo_box/magazine/garand
	category = list("Imported")

/datum/design/ammo_garand_rubber
	name = "Enbloc clip (.308) rubber."
	desc = "An enbloc clip for a Mars Service Rifle. Now non lethal"
	id = "ammo_garand_rubber"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 28000)
	build_path = /obj/item/ammo_box/magazine/garand/rubber
	category = list("Imported")

/obj/item/storage/backpack/guitarbag/sniper/PopulateContents()
	new /obj/item/gun/ballistic/automatic/m1garand(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/disk/design_disk/adv/ammo/garand(src)

///Sandman
/obj/item/reagent_containers/syringe/sand
	name = "Sand parasite"
	desc = "Шприц со странной чёрной жидкостью, находящейся постоянно в движении."
	amount_per_transfer_from_this = 1
	volume = 1
	list_reagents = list(/datum/reagent/sandparasite = 1)

/datum/reagent/sandparasite
	name = "Sand parasite"
	description = "Миллионы маленьких паразитов готовых съесть любую органику, до которой смогут добраться."
	color = "#000000"
	chemical_flags = REAGENT_ALL_PROCESS
	can_synth = FALSE
	taste_description = "hopelessness"
	value = REAGENT_VALUE_GLORIOUS

/datum/reagent/sandparasite/reaction_mob(mob/living/L, method=TOUCH, reac_volume)
	L.ForceContractDisease(new /datum/disease/transformation/sand(), FALSE, TRUE)

/datum/disease/transformation/sand
	name = "Sand parasite"
	cure_text = "nothing"
	cures = list(/datum/reagent/medicine/adminordrazine)
	agent = "Sand parasite"
	desc = "Рой из десятка миллионов паразитов в одной маленькой капле, готовых сожрать любую попавшуюся им органику"
	stage_prob = 20
	severity = DISEASE_SEVERITY_BIOHAZARD
	visibility_flags = 0
	stage1	= list("<span class='danger'>Ваши мышцы горят огнём.</span>")
	stage2	= list("<span class='danger'>Ваша кожа чернеет и болит так, словно её сдирают заживо.</span>")
	stage3	= list("<span class='danger'>Твой позвоночник воет от боли словно его пытаются растянуть на дыбе</span>", "<span class='danger'>похоже ты становишься выше.</span>")
	stage4	= list("<span class='danger'>Что то разрывает твою кожу на спине.</span>")
	stage5	= list("<span class='danger'>Трансформация завершается. Паразиты глубоко укоренились в теле и теперь не отделимы от него. Вы чувствуете невероятную боль, получив взамен новые возможности.<br><br>Используй Shift+Click, что бы принять вид обьекта или существа.<br>Alt+Click по вентиляции или скраберу, что бы залезть в систему труб.<br>Поедай трупы или используй медицинские нитки для востановления здоровья.<br>Ты можешь выдержать много физических повреждений, но огонь и лазеры для тебя смертельно опасны.</span>")
	new_form = /mob/living/simple_animal/hostile/morph/sandman
	infectable_biotypes = MOB_ORGANIC|MOB_MINERAL|MOB_UNDEAD

///Дорожный знак
/obj/item/spear/stop
	name = "Stop sign"
	desc = "Где вообще посреди космоса ты умудрился найти этот знак?!"
	icon_state = "stop1"
	icon_prefix = "stop"
	icon = 'modular_bluemoon/Ren/Icons/Obj/misc.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	mob_overlay_icon = 'modular_bluemoon/Ren/Icons/Mob/clothing.dmi'
	throwforce = 40
	block_chance = 50
	sharpness = SHARP_NONE
	hitsound = 'modular_bluemoon/Ren/Sound/metal.ogg'
	attack_verb = list("attacked", "slam", "jabbed", "torn", "gored")

/obj/item/spear/electrospear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=14, force_wielded=22, icon_wielded="[icon_prefix]1")

/datum/crafting_recipe/stopsign
	name = "Stop sign"
	result = /obj/item/spear/stop
	reqs = list(/obj/item/stack/cable_coil = 15,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/plasteel = 5,
				/obj/item/toy/crayon/spraycan = 1,
				/obj/item/bikehorn = 1)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	time = 100
	category = CAT_WEAPONRY
	subcategory = CAT_MELEE

///Ретекстуры
/obj/item/melee/baseball_bat/telescopic/inteq
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_l.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/inhand_r.dmi'
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'

/obj/item/storage/box/inteq_kit/revolver/PopulateContents()
	new /obj/item/gun/ballistic/revolver/inteq(src)
	new /obj/item/ammo_box/a357(src)

/obj/item/storage/box/inteq_kit/doorgoboom/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/doorCharge(src)

/obj/item/storage/backpack/duffelbag/syndie/inteq/c4/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/grenade/plastic/c4(src)

/obj/item/storage/backpack/duffelbag/syndie/inteq/x4/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/grenade/plastic/x4(src)

/obj/item/grenade/spawnergrenade/syndiesoap/inteq
	name = "Mister Scrubby"
	spawner_type = /obj/item/soap/inteq

/obj/item/grenade/clusterbuster/soap/inteq
	name = "Slipocalypse"
	payload = /obj/item/grenade/spawnergrenade/syndiesoap/inteq

/obj/item/storage/belt/sabre/karakurt
	name = "Karakurt sheath"
	desc = "Ножны со встроеным отсеком для ядом. Постоянно поддерживают элегантное оружие в подобающем виде."
	icon_state = "isheath"
	item_state = "isheath"
	force = 5
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed", "slashes", "prods", "pokes")
	fitting_swords = list(/obj/item/melee/sabre/karakurt)
	starting_sword = /obj/item/melee/sabre/karakurt

/obj/item/melee/sabre/karakurt/get_belt_overlay()
	if(istype(loc, /obj/item/storage/belt/sabre/karakurt))
		return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "karakurt")
	return ..()

/obj/item/melee/sabre/karakurt/get_worn_belt_overlay(icon_file)
	return mutable_appearance(icon_file, "-karakurt")

/obj/item/melee/sabre/karakurt
	name = "Karakurt"
	desc = "<span class='nicegreen'>Лучше не трогать это лезвие руками</span>"
	icon_state = "karakurt"
	item_state = "karakurt"
	force = 15
	throwforce = 12
	armour_penetration = 50
	block_parry_data = /datum/block_parry_data/traitor_rapier

/obj/item/melee/sabre/karakurt/attack(mob/living/target, mob/living/user)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/H = target
		H.reagents.add_reagent(/datum/reagent/toxin/pancuronium, 1)

///InteQ Uplink additions
/datum/uplink_item/inteq/angle_grinder
	name = "USHM"
	desc = "Индустриальный инструмент, предназначенный для резки армированного бетона и металлических стен. Так же отлично прорезает и “живые преграды”."
	item = /obj/item/pickaxe/drill/jackhammer/angle_grinder
	cost = 8
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/pulse_pistol
	name = "Melter"
	desc = "Генератор высокотемпературной плазмы, предназначенный для производственных нужд, но внедрения технологий NT получил возможность отправлять сгусток плазмы во полёт."
	item = /obj/item/gun/energy/pulse/pistol/inteq
	cost = 13
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/inteq/sand_parasite
	name = "Sand parasite"
	desc = "Искусственно выращенный паразит, пожирающий тело носителя и перестраивающий его в более пластичную форму. Необратимо лишает носителя человечности в обмен даруя способности к мимикрии, при этом не мешая взаимодействовать с окружением."
	item = /obj/item/reagent_containers/syringe/sand
	cost = 15
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)

/datum/uplink_item/dangerous/garand
	name = "Old, but gold rifle"
	desc = "Классическая полуавтоматическая винтовка с деревянной фурнитурой под калибр .308 winchester. Мы знаем как трудно достать в наше время сменные клипсы, по этому в комплекте идёт диск с чертежами патронов для автолата."
	item = /obj/item/storage/backpack/guitarbag/sniper
	cost = 10
	purchasable_from = (UPLINK_TRAITORS | UPLINK_NUKE_OPS)
