/mob/living/proc/surrender()
	set name = "> Сдаться"
	set category = "Эмоции.Специальные Действия"
	emote("surrender")

/mob/living/proc/emote_faint()
	set name = "> Потерять Сознание"
	set category = "Эмоции.Специальные Действия"
	emote("faint")

/mob/living/verb/emote_collapse()
	set name = "> Рухнуть "
	set category = "Эмоции.Специальные Действия"
	emote("collapse")

/mob/living/verb/emote_deathgasp()
	set name = "> Притвориться Мёртвым "
	set category = "Эмоции.Специальные Действия"
	emote("deathgasp")

/mob/living/verb/emote_facepalm1()
	set name = "~ Когтистая Ладонь-Лицо "
	set category = "Эмоции.Специальные Действия"
	emote("faceclaw")

/mob/living/verb/emote_facepalm2()
	set name = "~ Ладонь-Лицо "
	set category = "Эмоции.Специальные Действия"
	emote("facehand")

/mob/living/verb/emote_facepalm3()
	set name = "~ Копыто-Лицо "
	set category = "Эмоции.Специальные Действия"
	emote("facehoof")

/mob/living/proc/emote_wag()
	set name = "< Махать хвостом >"
	set category = "Эмоции.Специальные Действия"
	emote("wag")

/mob/living/verb/emote_salute()
	set name = "> Исполнить Воинское Приветствие "
	set category = "Эмоции.Специальные Действия"
	emote("salute")

/mob/living/verb/emote_dance()
	set name = "> Танцевать "
	set category = "Эмоции.Специальные Действия"
	emote("dance")

/mob/living/verb/emote_flip()
	set name = "> Сделать Кувырок "
	set category = "Эмоции.Специальные Действия"
	emote("flip")

/mob/living/proc/emote_rock()
	set name = "< Рошамбо: Камень >"
	set category = "Эмоции.Специальные Действия"
	emote("rock")

/mob/living/proc/emote_scissors()
	set name = "< Рошамбо: Ножницы >"
	set category = "Эмоции.Специальные Действия"
	emote("scissors")

/mob/living/proc/emote_paper()
	set name = "< Рошамбо: Бумага >"
	set category = "Эмоции.Специальные Действия"
	emote("paper")

/mob/living/verb/emote_tremble()
	set name = "~ Дрожать в ужасе "
	set category = "Эмоции.Специальные Действия"
	emote("tremble")

/mob/living/verb/emote_twitch()
	set name = "~ Сильно дёргаться "
	set category = "Эмоции.Специальные Действия"
	emote("twitch")

/mob/living/verb/emote_twitch_v()
	set name = "~ Сильно дёргаться "
	set category = "Эмоции.Специальные Действия"
	emote("twitch_s")

/mob/living/verb/emote_snap1()
	set name = "> Щелкнуть Пальцами "
	set category = "Эмоции.Специальные Действия"
	emote("snap")

/mob/living/verb/emote_snap2()
	set name = "> Пару раз Щёлкнуть Пальцами "
	set category = "Эмоции.Специальные Действия"
	emote("snap2")

/mob/living/verb/emote_snap3()
	set name = "> Особым образом Щёлкнуть Пальцами "
	set category = "Эмоции.Специальные Действия"
	emote("snap3")

/mob/living/verb/emote_signal()
	set name = "~ Показать несколько пальцев "
	set category = "Эмоции.Специальные Действия"
	var/Cnt = input("Руки должны быть свободны", "Показать несколько пальцев", 1) in list(1,2,3,4,5,6,7,8,9,10)
	emote("signal-[Cnt]")

/mob/living/verb/emote_slap()
	set name = "> Шлепнуть "
	set category = "Эмоции.Специальные Действия"
	emote("slap")

/mob/living/verb/emote_lick()
	set name = "> Облизать "
	set category = "Эмоции.Специальные Действия"
	emote("lick")

/mob/living/verb/emote_laugh1()
	set name = "> Смеяться 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh")

/mob/living/verb/emote_laugh2()
	set name = "> Смеяться 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh2")

/mob/living/verb/emote_laugh3()
	set name = "> Смеяться 3 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh3")

/mob/living/verb/emote_laugh4()
	set name = "> Смеяться 4 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh4")

/mob/living/verb/emote_laugh5()
	set name = "> Смеяться 5 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh5")

/mob/living/verb/emote_laugh6()
	set name = "> Смеяться 6 "
	set category = "Эмоции.Звуковые Действия"
	emote("laugh6")

/mob/living/verb/emote_laugh7()
	set name = "> Смеяться 7 "
	set category = "Эмоции.Звуковые Действия"
	emote("cackle")

/mob/living/verb/emote_laugh8()
	set name = "> Смеяться 8 "
	set category = "Эмоции.Звуковые Действия"
	emote("cluwne")

/mob/living/verb/emote_giggle()
	set name = "> Хихикать "
	set category = "Эмоции.Звуковые Действия"
	emote("giggle")

/mob/living/verb/emote_msqueak()
	set name = "> Пищать словно Крыска "
	set category = "Эмоции.Звуковые Действия"
	emote("msqueak")

/mob/living/verb/emote_kiss()
	set name = "> Поцеловать "
	set category = "Эмоции.Простые Действия"
	emote("kiss")

/mob/living/verb/emote_ara1()
	set name = "> Ара 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("ara")

/mob/living/verb/emote_ara2()
	set name = "> Ара 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("ara2")

/mob/living/verb/emote_weh1()
	set name = "> Вех 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("weh")

/mob/living/verb/emote_weh2()
	set name = "> Вех 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("weh2")

/mob/living/verb/emote_weh3()
	set name = "> Вех 3 "
	set category = "Эмоции.Звуковые Действия"
	emote("weh3")

/mob/living/verb/emote_weh4()
	set name = "> Вех 4 "
	set category = "Эмоции.Звуковые Действия"
	emote("weh4")

/mob/living/verb/emote_scream()
	set name = "> Кричать "
	set category = "Эмоции.Звуковые Действия"
	emote("scream")

/mob/living/verb/emote_scratch()
	set name = "~ Почесаться "
	set category = "Эмоции.Простые Действия"
	emote("scratch")

/mob/living/verb/emote_blush()
	set name = "~ Краснеть "
	set category = "Эмоции.Простые Действия"
	emote("blush")

/mob/living/verb/emote_blink1()
	set name = "~ Моргать "
	set category = "Эмоции.Простые Действия"
	emote("blink")

/mob/living/verb/emote_blink2()
	set name = "~ Громко Моргать "
	set category = "Эмоции.Звуковые Действия"
	emote("blink2")

/mob/living/verb/emote_blink3()
	set name = "~ Быстро Моргать "
	set category = "Эмоции.Простые Действия"
	emote("blink3")

/mob/living/verb/emote_bow()
	set name = "~ Поклониться "
	set category = "Эмоции.Простые Действия"
	emote("bow")

/mob/living/verb/emote_choke()
	set name = "> Подавиться "
	set category = "Эмоции.Звуковые Действия"
	emote("choke")

/mob/living/verb/emote_chuckle()
	set name = "~ Усмехнуться "
	set category = "Эмоции.Звуковые Действия"
	emote("chuckle")

/mob/living/verb/emote_cough()
	set name = "> Кашлять "
	set category = "Эмоции.Звуковые Действия"
	emote("cough")

/mob/living/verb/emote_cry1()
	set name = "> Плакать 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("cry")

/mob/living/verb/emote_cry2()
	set name = "> Плакать 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("cry2")

/mob/living/verb/emote_clap1()
	set name = "> Хлопать 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("clap")

/mob/living/verb/emote_clap2()
	set name = "> Хлопать 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("clap1")

/mob/living/verb/emote_drool()
	set name = "~ Нести чепуху "
	set category = "Эмоции.Простые Действия"
	emote("drool")

/mob/living/verb/emote_frown()
	set name = "~ Хмуриться "
	set category = "Эмоции.Простые Действия"
	emote("frown")

/mob/living/verb/emote_gasp()
	set name = "> Задыхаться "
	set category = "Эмоции.Звуковые Действия"
	emote("gasp")

/mob/living/verb/emote_glare()
	set name = "~ Смотреть с ненавистью "
	set category = "Эмоции.Простые Действия"
	emote("glare")

/mob/living/verb/emote_groan()
	set name = "~ Болезненный вздох "
	set category = "Эмоции.Простые Действия"
	emote("groan")

/mob/living/verb/emote_grin()
	set name = "~ Оскалиться в улыбке "
	set category = "Эмоции.Простые Действия"
	emote("grin")

/mob/living/verb/emote_look()
	set name = "~ Посмотреть "
	set category = "Эмоции.Простые Действия"
	emote("look")

/mob/living/verb/emote_nod()
	set name = "~ Кивнуть "
	set category = "Эмоции.Простые Действия"
	emote("nod")

/mob/living/verb/emote_moan()
	set name = "> Постанывать "
	set category = "Эмоции.Звуковые Действия"
	emote("moan")

/mob/living/verb/emote_shake()
	set name = "~ Трясти головой "
	set category = "Эмоции.Простые Действия"
	emote("shake")

/mob/living/verb/emote_sigh()
	set name = "> Вздыхать "
	set category = "Эмоции.Звуковые Действия"
	emote("sigh")

/mob/living/verb/emote_smile1()
	set name = "~ Улыбнуться "
	set category = "Эмоции.Простые Действия"
	emote("smile")

/mob/living/verb/emote_honk()
	set name = "~ Хонкнуть "
	set category = "Эмоции.Звуковые Действия"
	emote("honk")

/mob/living/verb/emote_smile2()
	set name = "~ Слабо Улыбнуться "
	set category = "Эмоции.Простые Действия"
	emote("wsmile")

/mob/living/verb/emote_sneeze()
	set name = "> Чихнуть "
	set category = "Эмоции.Звуковые Действия"
	emote("sneeze")

/mob/living/verb/emote_grunt()
	set name = "~ Ворчать "
	set category = "Эмоции.Простые Действия"
	emote("grumble")

/mob/living/verb/emote_sniff()
	set name = "~ Понюхать "
	set category = "Эмоции.Звуковые Действия"
	emote("sniff")

/mob/living/verb/emote_snore1()
	set name = "> Тихо Храпеть "
	set category = "Эмоции.Простые Действия"
	emote("snore")

/mob/living/verb/emote_snore2()
	set name = "> Громко Храпеть "
	set category = "Эмоции.Звуковые Действия"
	emote("snore2")

/mob/living/verb/emote_shrug()
	set name = "~ Пожать плечами "
	set category = "Эмоции.Простые Действия"
	emote("shrug")

/mob/living/verb/emote_stare()
	set name = "~ Пялиться "
	set category = "Эмоции.Простые Действия"
	emote("stare")

/mob/living/verb/emote_wave()
	set name = "~ Помахать "
	set category = "Эмоции.Простые Действия"
	emote("wave")

/mob/living/verb/emote_whimper()
	set name = "~ Хныкать "
	set category = "Эмоции.Простые Действия"
	emote("whimper")

/mob/living/verb/emote_whistle()
	set name = "> Свистеть "
	set category = "Эмоции.Простые Действия"
	emote("whistle")

/mob/living/verb/emote_wink()
	set name = "~ Подмигнуть "
	set category = "Эмоции.Простые Действия"
	emote("wink")

/mob/living/verb/emote_yawn()
	set name = "> Зевать "
	set category = "Эмоции.Звуковые Действия"
	emote("yawn")

/mob/living/verb/emote_eyebrow1()
	set name = "~ Приподнять бровь "
	set category = "Эмоции.Простые Действия"
	emote("eyebrow")

/mob/living/verb/emote_eyebrow2()
	set name = "~ Громко Приподнять бровь "
	set category = "Эмоции.Звуковые Действия"
	emote("eyebrow2")

/mob/living/verb/emote_eyebrow3()
	set name = "~ Музыкально Приподнять бровь "
	set category = "Эмоции.Звуковые Действия"
	emote("eyebrow3")

/mob/living/verb/emote_fart()
	set name = "~ Пернуть "
	set category = "Эмоции.Звуковые Действия"
	emote("fart")

/mob/living/verb/emote_peep1()
	set name = "~ Пискнуть по-птичьи 1 "
	set category = "Эмоции.Звуковые Действия"
	emote("peep")

/mob/living/verb/emote_peep2()
	set name = "~ Пискнуть по-птичьи 2 "
	set category = "Эмоции.Звуковые Действия"
	emote("peep2")

/mob/living/verb/emote_airguitar()
	set name = "~ Воображаемая гитара "
	set category = "Эмоции.Простые Действия"
	emote("airguitar")

/mob/living/verb/emote_jump()
	set name = "~ Прыгать "
	set category = "Эмоции.Простые Действия"
	emote("jump")

/mob/living/verb/emote_burp()
	set name = "~ Рыгнуть "
	set category = "Эмоции.Звуковые Действия"
	emote("burp")

/mob/living/verb/emote_mumble()
	set name = "~ Бормотать "
	set category = "Эмоции.Простые Действия"
	emote("mumble")

/mob/living/verb/emote_ffff()
	set name = "~ Пробормотать "
	set category = "Эмоции.Звуковые Действия"
	emote("ffff")

/mob/living/verb/emote_point()
	set name = "~ Показать пальцем "
	set category = "Эмоции.Простые Действия"
	emote("point")

/mob/living/verb/emote_raise()
	set name = "~ Поднять руку "
	set category = "Эмоции.Простые Действия"
	emote("raise")

/mob/living/verb/emote_shiver()
	set name = "~ Дрожать "
	set category = "Эмоции.Простые Действия"
	emote("shiver")

/mob/living/verb/emote_pale()
	set name = "~ Бледнеть "
	set category = "Эмоции.Простые Действия"
	emote("pale")

/mob/living/verb/emote_hug()
	set name = "~ Обниматься "
	set category = "Эмоции.Простые Действия"
	emote("hug")

/mob/living/verb/emote_handshake()
	set name = "~ Пожать Руку "
	set category = "Эмоции.Простые Действия"
	emote("handshake")

/mob/living/proc/emote_suka1()
	set name = "< Сука! >"
	set category = "Эмоции.Звуковые Действия"
	emote("suka")

/mob/living/proc/emote_suka2()
	set name = "< Агрессивное Сука! >"
	set category = "Эмоции.Звуковые Действия"
	emote("suka2")

/mob/living/proc/emote_ura1()
	set name = "< Ура! >"
	set category = "Эмоции.Звуковые Действия"
	emote("ura")

/mob/living/proc/emote_ura2()
	set name = "< Громкое Ура! >"
	set category = "Эмоции.Звуковые Действия"
	emote("ura2")

/mob/living/proc/emote_ura3()
	set name = "< Очень Громкое Ура! >"
	set category = "Эмоции.Звуковые Действия"
	emote("ura3")

/mob/living/proc/emote_chitter1()
	set name = "< Читтер! >"
	set category = "Эмоции.Звуковые Действия"
	emote("chitter")

/mob/living/proc/emote_chitter2()
	set name = "< Читтер Иначе! >"
	set category = "Эмоции.Звуковые Действия"
	emote("chitter2")

/mob/living/proc/emote_awoo()
	set name = "< Выть >"
	set category = "Эмоции.Звуковые Действия"
	emote("awoo")

/mob/living/proc/emote_growl1()
	set name = "< Рычать >"
	set category = "Эмоции.Звуковые Действия"
	emote("growl")

/mob/living/proc/emote_growl2()
	set name = "< Рычать Агрессивно >"
	set category = "Эмоции.Звуковые Действия"
	emote("growl2")

/mob/living/proc/emote_growl3()
	set name = "< Рычать Иначе >"
	set category = "Эмоции.Звуковые Действия"
	emote("rawr")

/mob/living/proc/emote_purr()
	set name = "< Мурчать >"
	set category = "Эмоции.Звуковые Действия"
	emote("purr")

/mob/living/proc/emote_hiss()
	set name = "< Шипеть >"
	set category = "Эмоции.Звуковые Действия"
	emote("hiss")

/mob/living/proc/emote_warble()
	set name = "< Трель >"
	set category = "Эмоции.Звуковые Действия"
	emote("warble")

/mob/living/proc/emote_wurble()
	set name = "< Труль >"
	set category = "Эмоции.Звуковые Действия"
	emote("wurble")

/mob/living/proc/emote_squish()
	set name = "< Хлюпать >"
	set category = "Эмоции.Звуковые Действия"
	emote("squish")

/mob/living/proc/emote_ping()
	set name = "< Звенеть >"
	set category = "Эмоции.Звуковые Действия"
	emote("ping")

/mob/living/proc/emote_beep()
	set name = "< Пищать >"
	set category = "Эмоции.Звуковые Действия"
	emote("beep")

/mob/living/proc/emote_buzz()
	set name = "< Жужжать >"
	set category = "Эмоции.Звуковые Действия"
	emote("buzz")

/mob/living/proc/emote_buzz2()
	set name = "< Жужжать раздраженно >"
	set category = "Эмоции.Звуковые Действия"
	emote("buzz2")

/mob/living/proc/emote_hack()
	set name = "< Взламываться >"
	set category = "Эмоции.Звуковые Действия"
	emote("hack")

/mob/living/proc/emote_syndicate()
	set name = "< Задание Синдиката >"
	set category = "Эмоции.Звуковые Действия"
	emote("syndicate")

/mob/living/proc/emote_jacket1()
	set name = "< Какое время? >"
	set category = "Эмоции.Звуковые Действия"
	emote("jacket")

/mob/living/proc/emote_jacket2()
	set name = "< Нужна Помощь? >"
	set category = "Эмоции.Звуковые Действия"
	emote("jacket2")

/mob/living/proc/emote_bulldozer1()
	set name = "< Ты перед Стеной! >"
	set category = "Эмоции.Звуковые Действия"
	emote("bulldozer")

/mob/living/proc/emote_bulldozer2()
	set name = "< Оставайся Жив! >"
	set category = "Эмоции.Звуковые Действия"
	emote("bulldozer2")

/mob/living/proc/emote_cloaker1()
	set name = "< Агрессивное Приближение! >"
	set category = "Эмоции.Звуковые Действия"
	emote("cloaker")

/mob/living/proc/emote_cloaker2()
	set name = "< Не бей себя! >"
	set category = "Эмоции.Звуковые Действия"
	emote("cloaker2")

/mob/living/proc/emote_cloaker3()
	set name = "< Причина Ареста >"
	set category = "Эмоции.Звуковые Действия"
	emote("cloaker3")

/mob/living/proc/emote_cloaker4()
	set name = "< Безопасное Слово >"
	set category = "Эмоции.Простые Действия"
	emote("cloaker4")

/mob/living/proc/emote_protect()
	set name = "< Император Защищает >"
	set category = "Эмоции.Простые Действия"
	emote("protect")

/mob/living/proc/emote_meow()
	set name = "< Мяу >"
	set category = "Эмоции.Простые Действия"
	emote("meow")

/mob/living/proc/emote_mewo()
	set name = "< Мияу >"
	set category = "Эмоции.Простые Действия"
	emote("mewo")
