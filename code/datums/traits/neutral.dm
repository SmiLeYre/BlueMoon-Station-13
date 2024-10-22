//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "Агевзия"
	desc = "Вы не чувствуете вкуса! Ядовитая еда всё ещё будет иметь пагубное воздействие."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>Вы не чувствуете вкуса!</span>"
	lose_text = "<span class='notice'>Вы снова чувствуете вкус!</span>"
	medical_record_text = "Пациент страдает от авгезии и не способен чувствовать вкус."

/datum/quirk/snob
	name = "Сноб"
	desc = "Вас волнуют вещи утонченные, если комната выглядит некрасиво, она просто не стоит того, верно?"
	value = 0
	gain_text = "<span class='notice'>Вы считаете, что знаете, как должны выглядеть вещи.</span>"
	lose_text = "<span class='notice'>Кого вообще волнует декор?</span>"
	medical_record_text = "Пациент ведёт себя напыщенно."
	mob_trait = TRAIT_SNOB

/datum/quirk/pineapple_liker
	name = "Пристрастие к Ананасам"
	desc = "Вы обожаете плоды ананасового дерева. Вы никак не можете прекратить наслаждаться этим сладким вкусом!"
	value = 0
	gain_text = "<span class='notice'>У вас появляется сильное желание вкусить мякоти ананаса.</span>"
	lose_text = "<span class='notice'>По всей видимости, ваше отношение к ананасам возвращается к нейтральному.</span>"
	medical_record_text = "У пациента проявляется патологическая любовь к ананасам."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Неприязнь к Ананасам"
	desc = "Вы испытываете сильнейшее отвращение к плодам ананасового дерева. Серьёзно, кому они нравятся? И какой безумец посмел положить их на пиццу!?"
	value = 0
	gain_text = "<span class='notice'>Вы задумываетесь над тем, какому идиоту вообще могут понравиться ананасы...</span>"
	lose_text = "<span class='notice'>По всей видимости, ваше отношение к ананасам возвращается к нейтральному.</span>"
	medical_record_text = "Пациент прав в своей нелюбви к ананасам."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Извращенные Вкусы"
	desc = "Вам не нравится то, что нравится большинству и наоборот."
	value = 0
	gain_text = "<span class='notice'>Появляется желание съесть чего-нибудь странного.</span>"
	lose_text = "<span class='notice'>Вам снова нравится есть типичную пищу.</span>"
	medical_record_text = "Пациент демонстрирует атипичные предпочтения в пище."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/monochromatic
	name = "Монохромазия"
	desc = "Вы страдаете от цветовой слепоты и воспринимаете мир только в чёрных и белых тонах."
	value = 0
	medical_record_text = "Пациент подвержден практически полной цветовой слепоте."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective")
		to_chat(quirk_holder, "<span class='boldannounce'>Хм-м-м. Нет ничего незапятнанного в этих коридорах. Всё лишь оттенки серого...</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)

/datum/quirk/maso
	name = "Мазохизм"
	desc = "Вас возбуждает боль."
	value = 0
	mob_trait = TRAIT_MASO
	gain_text = "<span class='notice'>Вы хотите, чтобы вам причинили боль.</span>"
	lose_text = "<span class='notice'>Боль больше не так заводит.</span>"

/datum/quirk/libido
	name = "Нимфомания"
	desc = "Вы быстрее возбуждаетесь."
	value = 0
	mob_trait = TRAIT_NYMPHO
	gain_text = "<span class='notice'>У вас зудит в промежности.</span>"
	lose_text = "<span class='notice'>Вы более не чувствуете того приятного жжения.</span>"

/datum/quirk/libido/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.arousal_rate = 3 * initial(H.arousal_rate)

/datum/quirk/libido/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(!H)
		return
	H.arousal_rate = initial(H.arousal_rate)

/datum/quirk/longtimer
	name = "Матёрый Волк"
	desc = "Вы прошли долгий путь и пережили больше, чем остальные. Вы страдаете от жутких шрамов. Какова бы ни была причина, вы отказались от их удаления или аугментации."
	value = 0
	gain_text = "<span class='notice'>Ваше тело видало лучшие дни.</span>"
	lose_text = "<span class='notice'>Грехи можно смыть, но шрамы останутся...</span>"
	medical_record_text = "Пациент выразил отказ от удаления многочисленных шрамов."
	/// the minimum amount of scars we can generate
	var/min_scars = 3
	/// the maximum amount of scars we can generate
	var/max_scars = 7

/datum/quirk/longtimer/on_spawn()
	var/mob/living/carbon/C = quirk_holder
	C.generate_fake_scars(rand(min_scars, max_scars))

/datum/quirk/trashcan
	name = "Мусорный бак"
	desc = "Вы можете есть мусор."
	value = 0
	gain_text = "<span class='notice'>В голову приходит мысль пожевать банку из-под содовой.</span>"
	lose_text = "<span class='notice'>Вы больше не хотите есть мусор.</span>"
	mob_trait = TRAIT_TRASHCAN

// Moved Colorist quirk to a loadout item

/datum/quirk/salt_sensitive
	name = "Чувствительность к Натрию"
	desc = "Ваше тело чувствительно к натрию, потому обжигается при контакте с ним. Употребление крайне не рекомендуется."
	value = 0
	medical_record_text = "Пациенту не следует входить в контакт с натрием."
	mob_trait = TRAIT_SALT_SENSITIVE

/datum/quirk/dullahan
	name = "Дуллахан"
	desc = "Ваша голова отделена от тела."
	value = 0
	medical_record_text = "Пациент имеет неизвестного рода пространственную связь с собственной отделенной головой."

/datum/quirk/dullahan/post_add()
	quirk_holder.AddComponent(/datum/component/dullahan)

/datum/quirk/photographer
	name = "Фотограф"
	desc = "Вы знаете как пользоваться фотоаппаратом, сокращая время между фотографией."
	value = 0
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>Вы знаете всё о фотографиях.</span>"
	lose_text = "<span class='danger'>Вы забываете, как работают фотокамеры.</span>"
	medical_record_text = "Пациент упоминает фотографию, как хобби для снятия стресса."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/storage/photo_album/photo_album = new(get_turf(H))
	H.put_in_hands(photo_album)
	H.equip_to_slot(photo_album, ITEM_SLOT_BACKPACK)
	photo_album.persistence_id = "personal_[H.mind.key]" // this is a persistent album, the ID is tied to the account's key to avoid tampering
	photo_album.persistence_load()
	photo_album.name = "[H.real_name] Photo Album"
	var/obj/item/camera/camera = new(get_turf(H))
	camera.name = "[H.real_name] Camera"
	H.put_in_hands(camera)
	H.equip_to_slot(camera, ITEM_SLOT_BACKPACK) //SPLURT Edit
	H.regenerate_icons()

/datum/quirk/steel_ass
	name = "Стальные Булки"
	desc = "Вы ни разу не пропускали день ягодиц. У вас полный иммунитет ко всем формам ударов по заднице, и любой, кто попытается наградить вас шлепком, как правило, получит перелом кисти."
	value = 0
	mob_trait = TRAIT_STEEL_ASS
	gain_text = span_notice("Ваш зад может составить конкуренцию големскому.")
	lose_text = span_notice("Ваш зад ощущается более мягким и уязвимым к шлепкам.")

/datum/quirk/jiggly_ass
	name = "Булки Грома"
	desc = "Твоя задница, растягивающая штаны, настолько же приятна, насколько трудно удержать равновесие, когда ее шлепают!"
	value = 0
	mob_trait = TRAIT_JIGGLY_ASS
	gain_text = span_notice("Ваш зад кажется очень удобным для шлепков.")
	lose_text = span_notice("Ваша задница снова чувствует себя нормально.")

/datum/quirk/jiggly_ass/add()
	// Add examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine_holder))

/datum/quirk/jiggly_ass/remove()
	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text
/datum/quirk/jiggly_ass/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += span_lewd("[quirk_holder.ru_ego(TRUE)] заднице не помешает крепкий шлепок.")
