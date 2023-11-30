GLOBAL_VAR_INIT(bluemoon_criminal_quirk_warden_name, "") // имя для вардена, чтобы во всех записях было одинаковым
GLOBAL_VAR_INIT(bluemoon_criminal_quirk_sergeants_names, "")
GLOBAL_VAR_INIT(bluemoon_criminal_quirk_hos_name, "")
GLOBAL_VAR_INIT(bluemoon_criminal_quirk_commander_name, "")

#define ISSUER_TYPE_SECURITY_OFFICER 	1 // типы написания для корректировки послесловий, чтобы коммандер не писал "я увольняюсь"
#define ISSUER_TYPE_SECURITY_WARDEN		2
#define ISSUER_TYPE_SECURITY_SERGEANT 	3
#define ISSUER_TYPE_SECURITY_HEAD 		4
#define ISSUER_TYPE_COMMANDER			5
#define ISSUER_TYPE_INTERN 				6

/datum/quirk/bluemoon_criminal
	name = "Нарушитель закона"
	desc = "Пока вы были вне станции, вы успели что-то натворить, а может даже и в прошлые смены. В вашем личном деле будет находиться запись о нарушении (или даже нескольких) \
	статей из 100-ой и 200-ой категорий. Нужно будет как-то решить вопрос со службой безопасности... В добавок, ваш персонаж может не знать, что именно он натворил. \
	Если повезёт, статус ареста с начала смены не будет выставлен вовсе, оставляя только заметку в базе, которую могут не заметить."
	value = 0

/datum/quirk/bluemoon_criminal/on_spawn()
	. = ..()
	if(!GLOB.bluemoon_criminal_quirk_warden_name)
		GLOB.bluemoon_criminal_quirk_warden_name = random_unique_name(pick(MALE,FEMALE))
		GLOB.bluemoon_criminal_quirk_sergeants_names = random_unique_name(pick(MALE,FEMALE))
		GLOB.bluemoon_criminal_quirk_hos_name = random_unique_name(pick(MALE,FEMALE))
		GLOB.bluemoon_criminal_quirk_commander_name = random_unique_name(pick(MALE,FEMALE))

	addtimer(CALLBACK(src, .proc/create_security_crime), 1 MINUTES, FALSE)

/datum/quirk/bluemoon_criminal/proc/create_security_crime()
	var/datum/data/record/target_records = find_record("name", quirk_holder.name, GLOB.data_core.security)
	if(target_records)
		var/crime // полная информация о нарушении, нужна только в конце

		// Переменные для жертв преступлений

		var/victim_name = "WRONG, REPORT2DEV"
		switch(rand(1,80))
			if(1 to 20)
				victim_name = random_unique_name(MALE)
			if(21 to 40)
				victim_name = random_unique_name(FEMALE)
			if(41 to 50)
				victim_name = "[pick(GLOB.posibrain_names)]"
				if(prob(50))
					victim_name += "-[rand(1,999)]"
			if(51 to 55)
				victim_name = random_unique_lizard_name(MALE)
			if(56 to 60)
				victim_name = random_unique_lizard_name(FEMALE)
			if(61 to 65)
				victim_name = random_unique_moth_name()
//				if(71 to 80) (нет файла)
//					victim_name = random_unique_arachnid_name()
			if(66 to 70)
				victim_name = random_unique_plasmaman_name()
			if(71 to 75)
				victim_name = vox_name()
			if(76 to 80)
				victim_name = random_unique_ethereal_name()

		var/list/victim_job_generic = list(
			"офицер СБ","врач","старший сотрудник","ботаник","ассистент","бармен","повар","библиотекарь","механик","психолог","священник","продавец","уборщик")

		var/list/victim_job_senior = list(
			"СЕ", "СИ", "Старший Инженер", "Главный Инженер", "КМ", "Квартирмейстер", "Каптёр", "СМО", "Старший Врач", "Главврач", "Офицер Командования", "Офицер Мостика")

		var/list/victim_job_command = list(
			"ГП", "ХОП", "Глава Персонала", "Капитан", "Адмирал НТ", "Директор Сектора", "Администратор",
			"НТР", "Представитель Корпорации", "Представитель НТ", "Представитель Синдиката", "Адмирал Синдиката")

		var/victim_job = pick(victim_job_generic)

		// Места преступлений

		var/possible_random_places = pick("бара","кафе","брига","мостика","медицинского отсека","сада","инженерного отсека","голодека","общежития","жилого комплекса","бильярдной","клуба","VR-зала","развлекательного центра")

		// Фактическая информация о заметке в базе данных

		var/crime_number = "???" // Номер статьи
		var/crime_description = "-" // Описание нарушения
		var/crime_time = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)  //"[rand(0,23)]:[rand(0,59)]:[rand(0,59)]"
		var/crime_issued_by_officer = "[random_unique_name(pick(MALE,FEMALE))]"
		var/crime_issued_by_officer_type = ISSUER_TYPE_SECURITY_OFFICER

		switch(rand(1,10))
			if(1 to 5)
				crime_issued_by_officer = "Central Command Security Officer [random_unique_name(pick(MALE,FEMALE))]"
			if(6)
				crime_issued_by_officer = "Central Command Warden [GLOB.bluemoon_criminal_quirk_warden_name]"
				crime_issued_by_officer_type = ISSUER_TYPE_SECURITY_WARDEN
			if(7)
				crime_issued_by_officer = "Central Command Security Sergeant [GLOB.bluemoon_criminal_quirk_sergeants_names]"
				crime_issued_by_officer_type = ISSUER_TYPE_SECURITY_SERGEANT
			if(8)
				crime_issued_by_officer = "Central Command Head Of Security [GLOB.bluemoon_criminal_quirk_hos_name]"
				crime_issued_by_officer_type = ISSUER_TYPE_SECURITY_HEAD
			if(9)
				crime_issued_by_officer = "Central Command Commander [GLOB.bluemoon_criminal_quirk_commander_name]"
				crime_issued_by_officer_type = ISSUER_TYPE_COMMANDER
			if(10)
				crime_issued_by_officer = "Central Command Intern [random_unique_name(pick(MALE,FEMALE))]"
				crime_issued_by_officer_type = ISSUER_TYPE_INTERN

		if(prob(60))
			target_records.fields["criminal"] = "*Arrest*"

		var/i = 1
		switch(rand(1,10))
			if(1 to 6)
				i = 1
			if(7 to 9)
				i = 2
			if(10)
				i = 3
		while(i > 0)

			// Сообщения игроку в случае, если он знает, что совершил преступление.

			var/know_about_crime = FALSE // заголовок
			var/know_about_crime_title = pick(
			"Вы нарушили закон!", "Вы вами охотятся арбитры!", "Ваши нарушения не остались без внимания!", "О вас не забыли!", "О вас не забудут!", \
			"Вы в розыске!", "За вами охотится охрана!", "Охрана на хвосте!", "WOOP, WOOP - THIS IS SOUND OF THE POLICE!")
			var/know_about_crime_description // описание ниже заголовка

			if(prob(50))
				know_about_crime = TRUE

			// Нарушения для базы данных

			switch(rand(1,19))
				// СТАТЬИ 100-ОЙ КАТЕГОРИИ
				if(1) // Порча имущества (ПЕРЕДЕЛАТЬ В ВАНДАЛИЗМ)
					crime_number = "100"
					crime_description = pick(\
					"Порча [pick("имущества","личных вещей","пожитков")] [pick("[victim_name]","[victim_name] ([victim_job])")]")

					know_about_crime_description = pick("С трудом помнится прошлый вечер... Кажется, вы что-то ломали у [possible_random_places].")
				if(2) // Угрозы насилием
					crime_number = "101-1"
					crime_description = pick(\
					"[pick("Выкрикивал[quirk_holder.ru_a()] угрозы в адрес", "Угрозы", "Угрожал[quirk_holder.ru_a()]", "Угрозы насилием", "Угрозы физической расправы", "Обещал[quirk_holder.ru_a()] избить", "Обещал[quirk_holder.ru_a()] нанести увечья",)] [victim_name] ([victim_job])")

					know_about_crime = TRUE // Если спросят, кому угрожал, чтобы помнили хоть что-то
					know_about_crime_description = pick("Кажется, вы наговорили много лишнего в адрес [victim_name]... Кажется, это был [victim_job]? Даже обещали побить или что-то сломать. Уже тяжело вспомнить, из-за чего.")

				if(3) // Оскорбления младших глав
					victim_job = pick(victim_job_senior)

					crime_number = "101-2"
					crime_description = pick(\
					"[pick("Выкрикивал[quirk_holder.ru_a()] оскорбительные выражения о", "Очень много ругани о", "Оскорбление", "Оскорбления", "Унижение личного достоинства")] [victim_name] ([victim_job])")

					know_about_crime_description = pick("Кажется, вы наговорили много лишнего и оскорбительного в адрес [victim_name]... Кажется, это был [victim_job]?...")

				if(4) // Оскорбления младших сотрудников
					crime_number = "102"
					crime_description = pick(\
					"[pick("Выкрикивал[quirk_holder.ru_a()] оскорбительные выражения о", "Очень много ругани о", "Оскорбление", "Оскорбления", "Унижение личного достоинства")] [victim_name] ([victim_job])")

					know_about_crime_description = pick("Кажется, вы наговорили много лишнего и оскорбительного в адрес [victim_name]... Это кажется был [victim_job]?")

				if(5) // Хулиганство
					crime_number = "104"
					crime_description = pick(\
					"[pick("Писал","Наносил")] [quirk_holder.ru_a()] оскорбительные надписи у [possible_random_places]", \
					"[pick("Разукрашивал","Портил")][quirk_holder.ru_a()] [pick("пол","стёкла","потолок (как?)","стены","шлюзы")] у [possible_random_places]", \
					"Написал[quirk_holder.ru_a()] \"[pick("СБ свиньи","СБ пидарасы","нахуй СБ","ГСБ хуесос","ГСБ пидорас","детектив ЧМО","СБ гандоны","щиткурити")]\" [pick("перед","напротив","рядом","неподалёку от")] [pick("корпуса охраны","брига","отсека охраны")]")

				if(6) // Засорение эфира
					crime_number = "106" // TODO ПРОНОУНСЫ
					crime_description = pick(\
					"[pick("Засорял[quirk_holder.ru_a()] эфир", "Неприлично спорил[quirk_holder.ru_a()] в радиоканал", "Засорение рации", "Долго руга[quirk_holder.ru_sya()] в радио")]")

					know_about_crime_description = pick("Вы весело покатались на мехе.")

				if(7) // Незаконное пребывание
					crime_number = "108" // TODO ПРОНОУНСЫ
					crime_description = pick(\
					"[pick("Отказыва[quirk_holder.ru_sya()] выходить из [possible_random_places] после требований покинуть зону от персонала", \
					"Не выходил[quirk_holder.ru_a()] из [possible_random_places] по требованию от сотрудников СБ")]")

					know_about_crime_description = pick("Вас просили выйти из [possible_random_places], от чего вы отказывались.")

				// СТАТЬИ 200-ОЙ КАТЕГОРИИ
				if(8) // Оскорбления глав/корпораций
					var/major_disgrace = FALSE
					var/major_name = pick("НаноТрейзен", "НТ", "Синдиката", "Триглава", "Корпорации")
					if(prob(50))
						major_disgrace = TRUE
						crime_description = pick(\
						"[pick("Выкрикивал[quirk_holder.ru_a()] оскорбительные выражения о", "Очень много руficerгани о", "Оскорбление", "Оскорбления", "Распространние недостоверных слухов о", "Распространение клеветы о", "Распространение слухов о", "Клевета в адрес", "Оскорбление сотрудников")] [major_name]")

					else
						victim_job = pick(victim_job_command)

					crime_number = "201-1"
					crime_description = pick(\
					"[pick("Выкрикивал[quirk_holder.ru_a()] оскорбительные выражения о", "Очень много ругани о", "Оскорбление", "Оскорбления", "Унижение личного достоинства")] [victim_name] ([victim_job])")

					if(major_disgrace)
						know_about_crime_description = pick("Вы не так давно кричали оскорбления в адрес [major_name]... За вами ведь не придут? Да?")
					else
						know_about_crime_description = pick("Кажется, вы наговорили много лишнего и оскорбительного в адрес [victim_name]... Кажется, это был [victim_job]?")
				if(9) // Драка
					var/punched = FALSE

					crime_number = "202"
					crime_description = pick(\
					"[pick("Толкал[quirk_holder.ru_a()]","Пихал[quirk_holder.ru_a()]","Толкнул[quirk_holder.ru_a()]")] [victim_name] ([victim_job])")

					if(prob(60))
						punched = TRUE
						crime_description = pick(\
						"[pick("Побил[quirk_holder.ru_a()]","Вступил[quirk_holder.ru_a()] в драку с","Нападение на","Напал[quirk_holder.ru_a()] на","Атаковал[quirk_holder.ru_a()]","Ударил[quirk_holder.ru_a()]","Ударил[quirk_holder.ru_a()] несколько раз")] [victim_name] ([victim_job])")


					if(punched)
						know_about_crime_description = pick("Вы [pick("устроили драку","подрались")] с [victim_name] ([victim_job])")
						know_about_crime_description += pick(\
						", но уже плохо помните, за что.", " за оскорбление вашего родственника. Повезло, что вас оттащили друзья - иначе синяками бы не отделался.",\
						" из-за какой-то хрени... Даже стыдно сейчас.", " из-за разных политических взглядов. С такими иначе не получается.")
					else
						know_about_crime_description = pick("Вы пару раз толкнули [victim_name] ([victim_job])")
						know_about_crime_description += pick(\
						", но уже плохо помните, за что.", " за оскорбление вашего родственника.",\
						" из-за какой-то хрени... Даже стыдно сейчас.", " из-за разных политических взглядов.")
				if(10) // Нежелательный контакт
					victim_job = pick(victim_job_generic + victim_job_senior + victim_job_command)

					crime_number = "202-1"
					crime_description = pick(\
					"[pick("Приставал[quirk_holder.ru_a()] к", "Постоянно трётся рядом с", "Сексуальное домогательство", "Унизительные сексуальные комментарии по отношению к")] [victim_name]")

					know_about_crime_description = pick("Кажется, вы были не в себе, когда пытались флиртовать с [victim_name]...")
				if(11) // Превышение самообороны
					crime_number = "202-2"
					crime_description = pick(\
					"Во время драки с [victim_name] превысил[quirk_holder.ru_a()] самооборону, чуть не убив", \
					"Добивал[quirk_holder.ru_a()] лежавшего на полу [victim_name] после нападения на себя", \
					"Вырывал[quirk_holder.ru_a()] [victim_name] из рук СБ и наносил[quirk_holder.ru_a()] удары в месть за нападение", \
					"Избивал[quirk_holder.ru_a()] нападавшего, когда он сдался")

					know_about_crime_description = pick("Вы помните, как на вас напал какой-то обмудок, из-за чего вы жёстко его избили. Охране это не понравилось, но удалось уйти.")
				if(12) // Неисполнение приказа
					crime_number = "203"
					crime_description = pick(\
					"Очень долго не покидал[quirk_holder.ru_a()] место преступления после требований офицеров охраны", \
					"Отказ от выполнения приказа в одной из смен, убытков нет", \
					"Неподчинение офицеру на таможне в требовании показать сумку. Куда-то пропал[quirk_holder.ru_a()] вместе с ней в толпе")

					know_about_crime_description = pick(\
					"Вы помните, как на вас напал какой-то обмудок, из-за чего вы жёстко его избили. Охране это не понравилось, но удалось уйти.",\
					"На вас кто-то напал и пришлось защититься, но кажется, вы превысили самооборону...",\
					"Этот мудила, что влетев на вас с ножом, явно не ожидал, что один удар ногой сложит его пополам. Интересно, после пятого удара ногой в голову он вообще живой остался?")

				if(13) // Нарушение регуляций
					crime_number = "203-1"
					crime_description = pick(\
					"Спорил[quirk_holder.ru_a()] с главой, отказываясь надевать средства индивидуальной защиты", \
					"Во время биологической угроыз не носила маску, в том числе после требований сотрудников охраны и медбея", "Курил[quirk_holder.ru_a()] в медбее")

					know_about_crime_description = pick("Кажется, вы в какой-то момент нарушали регуляции.")

				if(14) // Нарушение техники безопасности
					crime_number = "204"
					crime_description = pick(\
					"Постоянно оставляет открытыми шкафчики со снаряжением", "Бросает снаряжение отдела на пол для общего доступа", \
					"Таскал[quirk_holder.ru_a()] тело по полу, оставляя кровавый след", \
					"Во время биологической угроыз не носила маску, в том числе после требований сотрудников охраны и медбея", "Курил[quirk_holder.ru_a()] в медбее")

					know_about_crime_description = pick("Кажется, вы в какой-то момент нарушали технику безопасности.")

				if(15) // Игнорирование служебных обязанностей
					crime_number = "204-1"
					crime_description = pick(\
					"Игнорирование требований вернуться к работе в повышенный код угрозы", \
					"Опаздание на работу", \
					"Пренебрежение служебными обязанностями в повышенный уровень угрозы")

					know_about_crime_description = pick("Кажется, вы в какой-то момент пренебрегали служебными обязанностями.")

				if(16) // Незаконное пилотирование
					crime_number = "205"
					crime_description = pick(\
					"Ката[quirk_holder.ru_sya()] на чужом экзокостюме без привязки к доступу", \
					"Убегал[quirk_holder.ru_a()] на мехе, не возвращал, пострадавших нет", \
					"Угнал[quirk_holder.ru_a()] мех с роботехнической палубы")

					know_about_crime_description = pick("Вы не так давно весело покатались на мехе! Ещё веселее было смеяться над охраной, что не могла вас догнать... Правда, без меха уже не смешно.")

				if(17) // Вандализм
					crime_number = "206"
					crime_description = pick(\
					"[pick("Ломал","Бил","Крушил","Повреждал")][quirk_holder.ru_a()] [pick("стёкла","столы","горшки","лампочки")] у [possible_random_places]", \
					"Устроил[quirk_holder.ru_a()] погром у [possible_random_places]", \
					"Дебоширил[quirk_holder.ru_a()] у [possible_random_places]")

					know_about_crime_description = pick(\
					"С трудом помнится прошлый вечер... Кажется, вы что-то ломали у [possible_random_places].", \
					"Вы хорошо повеселились у [possible_random_places] с друзьями, но охрана вас разогнала. Что если они помнят вас?", \
					"Вы устроили драку у [possible_random_places], в процессе пустив в ход мебель. Чудо, что удалось избежать тогда задержания!")

				if(18) // Неуважение к умершим
					crime_number = "206-1"
					crime_description = pick(\
					"[pick("Нелицеприятно","Оскорбительно","Грубо","Отвратительно")] [pick("шутил[quirk_holder.ru_a()]","выража[quirk_holder.ru_sya()]","высказыва[quirk_holder.ru_sya()]","отзыва[quirk_holder.ru_sya()]","говорил[quirk_holder.ru_a()]")] о [pick("погибших","умерших","усопших","кадаврах","трупах","ушедших","мертвых")]")

					know_about_crime_description = pick(\
					"Вы неплохо пошутили над фактом смерти, но возможно, кто-то запомнил этот поступок. Ведь так нельзя.", \
					"Вы попробовали разрядить ужасную атмосферу чёрной шуткой, но кажется, не все могли оценить... Плохое чувство.")

				if(19) // Мелкая кража
					crime_number = "207"
					crime_description = pick(\
					"[pick("Совершил[quirk_holder.ru_a()]","Произвел[quirk_holder.ru_a()]")] кражу [pick("фамильной ценности","личных вещей","предметов","пожитков")] [pick("[victim_name]","[victim_name] ([victim_job])")]", \
					"[pick("Украл[quirk_holder.ru_a()]", "Своровал[quirk_holder.ru_a()]","Выкрал[quirk_holder.ru_a()]")] [pick("фамильную ценность","личные вещей","предметы","пожитки")] у  [pick("[victim_name]","[victim_name] ([victim_job])")]")

					know_about_crime_description = pick(\
					"Вы помните, как что-то украли у [victim_name]... Кажется, он [victim_job].", \
					"[victim_name], [victim_job] что-то кричал о том, что его обокрали. Вы были рядом. На вас ведь не подумают? Верно?")

			// Оповещаем цель, если ей повезло помнить свои нарушения
			if(know_about_crime)
				to_chat(quirk_holder, span_userdanger(know_about_crime_title))
				to_chat(quirk_holder, span_danger(know_about_crime_description))

			// Различные дополнения от различных должностей
			crime_description += ". "
			switch(crime_issued_by_officer_type)
				if(ISSUER_TYPE_SECURITY_OFFICER, ISSUER_TYPE_SECURITY_SERGEANT)
					if(prob(70))
						if(prob(70))
							crime_description += "[pick("Оформить не успели - поставьте там нужный статус и комментарий, как наказание понесёт",\
								"На запросы не отзыва[quirk_holder.ru_sya()]. Сделайте что нужно и поставьте статус, а также комментарий, как наказание понесёт", \
								"Наказание не понесено", "Оформить наказание не успели", "Оформить наказание позже с занесением в комментарии", "Пока писали и подтвержила ордер, смена кончилась", \
								"Смена заканчивается, потом оформите", "На допрос не яви[quirk_holder.ru_sya()]", \
								"Наказание не [pick("назначено","оформлено")] - [pick("произведите","оформите","накажите","сделайте что нужно")] и поставьте отметку в комментарии со статусом нужным")]."
						else
							crime_description += "[pick(\
								"Ордер сделайте пожалуйста кто-нибудь, ГСБ болеет и подписать не может", "Моя смена кончилась, пока-пока", "Я увольняюсь", "Наказывайте сами, я в этом участие принимать не буду",\
								"Какой срок ставать не сказали", crime_number,
								"Наказание не [pick("назначено","оформлено")] - [pick("произведите","оформите","накажите","сделайте что нужно")] и поставьте отметку в комментарии со статусом нужным")]."
				if(ISSUER_TYPE_SECURITY_WARDEN)
					if(prob(85))
						crime_description += "[pick("Оформить не успели - поставьте там нужный статус и комментарий, как наказание понесёт",\
							"На запросы на отзыва[quirk_holder.ru_sya()]. Сделайте что нужно и поставьте статус, а также комментарий, как наказание понесёт",\
							"Наказание не понесено", "Оформить наказание не успели", "Оформить наказание позже с занесением в комментарии",\
							"Смена заканчивается, потом оформите", "На допрос не яви[quirk_holder.ru_sya()]", \
							"Наказание не [pick("назначено","оформлено")] - [pick("произведите","оформите","накажите","сделайте что нужно")] и поставьте отметку в комментарии со статусом нужным")]."
				if(ISSUER_TYPE_SECURITY_HEAD)
					crime_description += "[pick("Клянусь Богом, я снесу башню тому офицеру, что [quirk_holder.ru_ego()] отпустил. Коллеги, пожалуйста, закончите работу",\
						"У офицеров проблемы с дисциплиной, решаем по мере возможного. Наказание не выдано, выдайте самостоятельно. Рассчитываю на вас",\
						"Наказание не понесено", "Оформить наказание не успели, субъект скрылся", "Оформить наказание позже с занесением в комментарии",\
						"На допрос не яви[quirk_holder.ru_sya()]", "Это последний день, когда я заполняю за этих дегенератов базу данных",\
						"Наказание не [pick("назначено","оформлено")] - [pick("произведите","оформите","накажите","сделайте что нужно")] и поставьте отметку в комментарии со статусом нужным")]."
				if(ISSUER_TYPE_COMMANDER)
					if(prob(50))
						crime_description += "[pick("Если вы это читаете, то возможно, ГСБ уже уволен за халатность",\
							"Поправьте, если статью неправильно указал, у меня другие дела помимо этой чертовой базы данных",\
							"Я надеюсь, что НТР доволен тем, что я делаю, сидя и строча в базе данных заместо всего персонала Службы Безопасности",\
							"Наказание не [pick("назначено","оформлено")] - [pick("произведите","оформите","накажите","сделайте что нужно")] и поставьте отметку в комментарии со статусом нужным")]."
				if(ISSUER_TYPE_INTERN)
					crime_description = "[pick(crime_number, "я кушать хочу...", "???", "Накажите там", "---")]"

			// Добавление записи в БД
			crime = GLOB.data_core.createCrimeEntry(crime_number, crime_description, crime_issued_by_officer, crime_time)
			GLOB.data_core.addMinorCrime(target_records.fields["id"], crime)
			// Когда i = 0, добавление новых нарушений прекращается
			i -= 1

	REMOVE_TRAIT(quirk_holder, mob_trait, ROUNDSTART_TRAIT)

#undef ISSUER_TYPE_SECURITY_OFFICER
#undef ISSUER_TYPE_SECURITY_WARDEN
#undef ISSUER_TYPE_SECURITY_SERGEANT
#undef ISSUER_TYPE_SECURITY_HEAD
#undef ISSUER_TYPE_COMMANDER
#undef ISSUER_TYPE_INTERN
