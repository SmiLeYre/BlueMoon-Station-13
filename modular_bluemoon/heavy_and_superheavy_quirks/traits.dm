/*
КВИРКИ
*/

/datum/quirk/bluemoon_heavy
	name = "Тяжёлый"
	desc = "Вы весите \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Ослабление скорости до уровня, как будто персонаж ростом 120% (если рост уже не 120% или больше). \
	Даже шагом перемещение громкое. \
	Другим сложнее куда-то тянуть Вас. \
	Вас сложнее отправить в полёт, но и последствия будут серьезнее. \
	Если вы наступите на кого-то меньше вас ростом, то это будет ещё болезненнее. \
	'>заметно больше в сравнении со среднестатистическим космонавтом.</font> \
	(Не берите вместе с особенностью \"Сверхтяжёлый\", может привести к настакиванию замедления)."

	value = 0
	mob_trait = TRAIT_BLUEMOON_HEAVY
	gain_text = span_notice("Вы явно набрали в весе... Не то, чтобы это сильно мешало.")
	lose_text = span_danger("Сбросить 3-4 десятка киллограмм за одну смену - это достижение. И вы его открыли.")
	medical_record_text = "Вес пациента выше среднего для космонавтов."

/datum/quirk/bluemoon_heavy/proc/update_size_movespeed()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = 0.2 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 120%
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		H.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.throw_range = 4
	H.throw_speed = 1
	update_size_movespeed()

/datum/quirk/bluemoon_heavy_super
	name = "Сверхтяжёлый"

	desc = "Ваш вес можно сравнивать с \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Ослабление скорости до уровня, как будто персонаж ростом 170% (если рост уже не 170% или больше). \
	Вас могут тянуть только киборги, мехи (толкать), такие же сверхтяжёлые персонажи и экипаж в МОДах, оснащённых гидравлическими клешнями (в дальнейшем - \"ОСОБЫЕ\"). \
	Даже шагом, вы перемещаетесь громко. \
	Предметы (и персонажи) при попытке сесть на них будут ломаться. \
	Другие не могут по своей инициативе поменяться с вами местами. \
	'>крупным животным, автомобилем или малым промышленным шагоходом.</font> \
	Драка с вами в ближнем бою \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Только киборги, халки и другие сверхтяжёлые персонажи могут толкать Вас и также опрокидывать на стол. \
	Вы причиняете (и получаете) больше повреждений при полёте. \
	При наступании на кого-то, эффекты в два раза хуже для цели. \
	Если вы подскользнетесь, то будет в два раза хуже. \
	Вставать с пола в два раза затратнее по выносливости. \
	Удар бутылкой о голову, а также битой, не имеют эффекта опрокидывания/отбрасывания. \
	Вас нельзя нести на плече или метнуть с рук. \
	'>менее эффективна.</font> \
	При этом, вам намного \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Бонус за местоположения тела при операции всегда считаются, как если бы Вы находились на обычном столе (даже если персонаж на хирургическом столе или на полу). \
	Только ОСОБЫЕ персонажи могут помочь вам встать обратно на ноги.                            \
	У всех, кто пытается вас переместить, скорее всего, НЕ БУДЕТ нужного снаряжения или особенностей для этого. Будьте готовы, что вас могут убить \
	из-за невозможности переместить или не станут доставлять в медбей/помогать прямо на месте смерти. \
	'>сложнее помочь.</font> \
	Оглушающее оружие \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Шоковые дубинки, телескопические и т.п. не роняют на пол, а также наносят в два раза меньше урона по стамине. \
	Оглушающие снаряды (например, лучи дизейблера) наносят в два раза меньше урона по стамине. \
	'>действует на вас слабее.</font>"

	value = 0
	mob_trait = TRAIT_BLUEMOON_HEAVY_SUPER
	gain_text = span_warning("Плитка под вашими ногами может треснуть от неосторожного шага.")
	lose_text = span_notice("Вы явно стали весить намного меньше. Сверхтяжёлый танк больше не кузен.")
	medical_record_text = "Вес пациента намного выше среднестастистической для космонавтов. Перемещение привычными средствами посторонними лицами невозможно."

/datum/quirk/bluemoon_heavy_super/proc/update_size_movespeed()
	if(!isliving(quirk_holder))
		return
	var/mob/living/H = quirk_holder

	var/searched_slowdown = 0.7 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 170%
	var/user_slowdown = (abs(get_size(H) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		H.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy_super/proc/check_mob_size()
	if(!isliving(quirk_holder))
		return
	var/mob/living/owner = quirk_holder
	if(get_size(owner) < 0.8) // Самый маленький размер для сверхтяжёлых квирков - это 80%
		to_chat(owner, "Вы поняли, что ваш необъятный вес делает невозможным становление слишком маленьким.")
		owner.update_size(0.8)

/datum/quirk/bluemoon_heavy_super/on_spawn()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.throw_range = 1
	H.throw_speed = 0.5
	update_size_movespeed()
	check_mob_size()

/datum/quirk/bluemoon_giant_body
	name = "Пожиратель"
	desc = "Вы крупны и очень прожорливы. Из-за особенностей вашей анатомии ваше тело крайне чувствительно к урону, однако передвигается на порядок быстрее. \
	В дополнение к этому вы можете есть любую пищу и не толстеть, однако ваш голод силён, а переедание вызывает выделение в кровь особой смеси реагентов. \
	Так же, по неизвестным науке причинам вы не можете быть сверхтяжёлым."
	value = 3
	mob_trait = TRAIT_BLUEMOON_GIANT_BODY
	medical_record_text = "Субъект проявляет признаки гигантизма и аномальной прожорливости, а также способность усваивать любую пищу."
	gain_text = span_notice("Вы чувствуете неумалимый голод.")
	lose_text = span_notice("Ваш голод проходит.")
	processing_quirk = TRUE

/datum/quirk/bluemoon_giant_body/add()
	// да, кушать можно всё, но нужно сильно больше
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food = null
	H.physiology.hunger_mod *= 2
	H.physiology.brute_mod *= 1.6 // убираем 60% от доп ХП (этап 1)
	H.physiology.burn_mod *= 1.6  // убираем 60% от доп ХП (этап 1)
	H.physiology.tox_mod *= 1.25
	// Действие на сборс сытости
	var/datum/action/innate/vomit/act_vomit = new
	act_vomit.Grant(H)
	// Add examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)

/datum/quirk/bluemoon_giant_body/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	//если персонаж объелся, он не толстеет, но начинаются очень весёлые последствия
	if(H.nutrition >= NUTRITION_LEVEL_WELL_FED)
		var/cur_size = get_size(H)
		var/reg_add = 0.1 * cur_size
		H.reagents.add_reagent(/datum/reagent/medicine/salglu_solution, reg_add) // немного полезного реагента
		H.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, reg_add) // тут всё понятно, накормили персонажа, он захотел... ну вы поняли)
		H.add_lust(4) // бует возбуждаться

		if (H.get_lust() >= H.get_lust_tolerance())
			H.mob_climax(forced_climax=TRUE)
			H.adjust_nutrition(-20)

		H.adjust_nutrition(-0.02) //голод будет падать быстрее

/datum/quirk/bluemoon_giant_body/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species

		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

		//удаляем все модификаторы урона и скорости
		H.remove_movespeed_modifier(/datum/movespeed_modifier/giant_quirk_boost)

		H.physiology.hunger_mod *= 0.5

		H.physiology.brute_mod *= 0.625 * (get_size(H) / 2)
		H.physiology.burn_mod *= 0.625 * (get_size(H) / 2)
		H.physiology.tox_mod *= 0.8 * (get_size(H) / 2)

		var/datum/action/innate/vomit/act_vomit = locate() in H.actions
		act_vomit.Remove(H)

		UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text
/datum/quirk/bluemoon_giant_body/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.ru_ego(TRUE)] явно мучает голод."


/datum/quirk/bluemoon_giant_body/proc/update_size_modifiers(new_size, cur_size)
	if (check_mob_size() && new_size != cur_size) // не даём уменьшиться, в т.ч. если мёртв
		var/mob/living/carbon/human/H= quirk_holder

		// убираем 80% от доп ХП (этап 2)
		//чем больше существо, тем больше модификатор урона, начиная 2 и т.д., таким образом нивилируется эффект размера. Модификатор в 0.8 даётся изначально, что бы не ломать умножение тут
		H.physiology.brute_mod *= max(new_size,2) / max(cur_size,2)
		H.physiology.burn_mod *=  max(new_size,2) / max(cur_size,2)
		H.physiology.tox_mod *=  max(new_size,2) / max(cur_size,2)

		var/user_slowdown = (abs(new_size - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/giant_quirk_boost, TRUE, user_slowdown * -0.8) // убираем 80% от замедления


/datum/quirk/bluemoon_giant_body/proc/check_mob_size()
	if(!isliving(quirk_holder))
		return FALSE

	var/mob/living/owner = quirk_holder

	if(get_size(owner) < 2)
		to_chat(owner, "Ваш размер невозможно изменить")
		owner.update_size(2)
		return FALSE
	return TRUE

/datum/quirk/bluemoon_giant_body/on_spawn()
	. = ..()
	var/mob/living/H = quirk_holder
	update_size_modifiers(get_size(H), 1)


/*
ПЕРЕМЕННЫЕ ДЛЯ МОДИФИКАТОРОВ СКОРОСТИ
*/

/datum/movespeed_modifier/heavy_mob_drag
	variable = TRUE

/datum/movespeed_modifier/heavy_quirk_slowdown
	variable = TRUE

/datum/movespeed_modifier/giant_quirk_boost
	variable = TRUE


/*
Действия
*/

/datum/action/innate/vomit
	name = "Vomit"
	desc = "Vomit some digested food from your body."
	icon_icon = 'icons/mob/actions/actions_xeno.dmi'
	button_icon_state = "alien_barf"

/datum/action/innate/vomit/Activate()
	var/mob/living/carbon/human/H = owner
	H.vomit(lost_nutrition = 50, stun = FALSE)
