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

/*
ПЕРЕМЕННЫЕ ДЛЯ МОДИФИКАТОРОВ СКОРОСТИ
*/

/datum/movespeed_modifier/heavy_mob_drag
	variable = TRUE

/datum/movespeed_modifier/heavy_quirk_slowdown
	variable = TRUE
