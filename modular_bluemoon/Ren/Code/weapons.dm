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
/obj/item/ammo_box/magazine/aa12
	name = "AA12 magazine (12g buckshot)"
	desc = "Здоровый коробчатый магазин для патрон 12 калибра"
	icon_state = "m12gb"
	icon = 'modular_bluemoon/Ren/Icons/Obj/USM.dmi'
	lefthand_file = 'modular_bluemoon/Ren/Icons/Mob/ushm_r.dmi'
	righthand_file = 'modular_bluemoon/Ren/Icons/Mob/ushm_r.dmi'
	item_state = "mag-aa-small"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 8

/obj/item/ammo_box/magazine/aa12/update_icon()
	..()
	icon_state = "mag-aa-small-[ammo_count() ? "1" : "0"]"

/obj/item/ammo_box/magazine/aa12/big
	name = "AA12 drum magazine (12g buckshot)"
	desc = "Здоровый коробчатый магазин для патрон 12 калибра"
	icon_state = "mag-aa"
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 20

/obj/item/ammo_box/magazine/aa12/big/update_icon()
	..()
	icon_state = "mag-aa-[ammo_count() ? "1" : "0"]"

/obj/item/gun/ballistic/automatic/shotgun/aa12
	name = "\improper AA12"
	desc = "Древняя, но очень грозная оружейная система. Почему то на ней отсутствует одиночный огонь."
	icon_state = "minotaur"
	item_state = "minotaur"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	recoil = 20
	mag_type = /obj/item/ammo_box/magazine/aa12
	fire_sound = 'sound/weapons/gunshotshotgunshot.ogg'
	automatic_burst_overlay = FALSE
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()

/obj/item/gun/ballistic/automatic/shotgun/aa12/update_icon_state()
	if(ammo_count() > 0)
		if(magazine)
			icon_state = "minotaur-mag"
		else
			icon_state = "minotaur-nomag"
	else
		if(magazine)
			icon_state = "minotaur-mag-e"
		else
			icon_state = "minotaur-nomag-e"

/obj/item/gun/ballistic/automatic/shotgun/aa12/afterattack()
	. = ..()
	empty_alarm()
	return

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
