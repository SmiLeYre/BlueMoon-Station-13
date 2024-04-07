// перегруз. отказ от ренейминга и перекраса.
/obj/item/slimecross/stabilized/fetish/Initialize(mapload)
	. = ..()
	name = initial(name)
	add_atom_colour("#ffffff", FIXED_COLOUR_PRIORITY)
//	return ..()



////////////
/obj/item/slimecross/stabilized/fetish
	icon = 'modular_bluemoon/Fink/icons/obj/fetish.dmi'

/obj/item/slimecross/stabilized/fetish/grey
	name = "Плюшевый Слайм-Си"
	desc = "Очаровательная мягкая игрушка, напоминающая бога всех слаймов."
	icon_state = "grey"
	colour = "grey"

/obj/item/slimecross/stabilized/fetish/orange
	name = "Карманный рефрижератор «Благодать»"
	desc = "Механизм похожий на грелку-охладитель для носков."
	icon_state = "orange"
	colour = "orange"

/obj/item/slimecross/stabilized/fetish/silver
	name = "Чаша изгоя"
	desc = "Есть поверие, что с ней проще пережидать часы голода."
	icon_state = "silver"
	colour = "silver"

/obj/item/slimecross/stabilized/fetish/blue
	name = "Парадная трость мима"
	desc = "Гравировка на ручке: '      ' придаёт уверенности."
	icon_state = "blue"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	item_state = "stick"
	colour = "blue"

/obj/item/slimecross/stabilized/fetish/yellow
	name = "Погасший осколок"
	desc = "При касании ощущается лишь лёгкое покалывание."
	icon_state = "yellow"
	colour = "yellow"

/obj/item/slimecross/stabilized/fetish/darkpurple
	name = "Заводной куб жара"
	desc = "Латунный куб из множества шестерней, от которого веет теплом прямо в руки."
	icon_state = "darkpurple"
	colour = "darkpurple"

/obj/item/slimecross/stabilized/fetish/darkblue
	name = "Сердце океана"
	desc = "Ощущается мокрым, гладким и холодным."
	icon_state = "darkblue"
	colour = "darkblue"

/obj/item/slimecross/stabilized/fetish/sepia
	name = "Камень неопределенности"
	desc = "Он ощущается, то довольно тяжелым, то легким. И почему-то хочется, то в бар, то в храм."
	icon_state = "sepia"
	colour = "sepia"

/obj/item/slimecross/stabilized/fetish/gold
	name = "Ловец снов"
	desc = "Призывает питомцев из сна. Не использовать, если снятся кошмары!"
	icon_state = "gold"
	colour = "gold"
	var/mob_type
	var/datum/mind/saved_mind
	var/mob_name = "Familiar"

/obj/item/slimecross/stabilized/fetish/gold/proc/generate_mobtype()
	var/static/list/mob_spawn_pets = list()
	if(mob_spawn_pets.len <= 0)
		for(var/T in typesof(/mob/living/simple_animal))
			var/mob/living/simple_animal/SA = T
			switch(initial(SA.gold_core_spawnable))
				if(FRIENDLY_SPAWN)
					mob_spawn_pets += T
	mob_type = pick(mob_spawn_pets)

/obj/item/slimecross/stabilized/fetish/gold/Initialize(mapload)
	. = ..()
	generate_mobtype()

/obj/item/slimecross/stabilized/fetish/gold/attack_self(mob/user)
	var/choice = input(user, "Which do you want to reset?", "Familiar Adjustment") as null|anything in list("Familiar Location", "Familiar Species", "Familiar Sentience", "Familiar Name")
	if(!user.canUseTopic(src, BE_CLOSE))
		return
	if(isliving(user))
		var/mob/living/L = user
		if(L.has_status_effect(/datum/status_effect/stabilized/gold))
			L.remove_status_effect(/datum/status_effect/stabilized/gold)
	if(choice == "Familiar Location")
		to_chat(user, "<span class='notice'>You prod [src], and it shudders slightly.</span>")
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Species")
		to_chat(user, "<span class='notice'>You squeeze [src], and a shape seems to shift around inside.</span>")
		generate_mobtype()
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Sentience")
		to_chat(user, "<span class='notice'>You poke [src], and it lets out a glowing pulse.</span>")
		saved_mind = null
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Name")
		var/newname = reject_bad_name(stripped_input(user, "Would you like to change the name of [mob_name]", "Name change", mob_name, MAX_NAME_LEN), TRUE)
		if(newname)
			mob_name = newname
		to_chat(user, "<span class='notice'>You speak softly into [src], and it shakes slightly in response.</span>")
		START_PROCESSING(SSobj, src)

/obj/item/slimecross/stabilized/fetish/pyrite
	name = "СЛОВОХОНКОМАТЕРИ™"
	desc = "В начале было Слово, и Слово было HONK!"
	icon_state = "pyrite"
	colour = "pyrite"


/obj/item/slimecross/stabilized/fetish/green
	name = "Плоть многоликого"
	desc = "Живое и пульсирует. Дрожит от слова 'Крематорий'."
	icon_state = "green"
	colour = "green"

/obj/item/slimecross/stabilized/fetish/pink
	name = "Винтажный порно журнал «Запретный плод»"
	desc = "Сами страницы слиплись, открыть не получается."
	icon_state = "pink"
	colour = "pink"

/obj/item/slimecross/stabilized/fetish/oil
	name = "Ядерная бомбочка для ванны «Отец»"
	desc = "Внизу оболочки гравировка СССП и надпись от руки: 'Сильные душой - достигают небес.'"
	icon_state = "oil"
	colour = "oil"

/obj/item/slimecross/stabilized/fetish/lightpink
	name = "Ангел хранитель"
	desc = "Сделано из мрамора. На пьедестале написано 'primum non nocere.'"
	icon_state = "lightpink"
	colour = "lightpink"

/obj/item/slimecross/stabilized/fetish/adamantine
	name = "Cтальной презерватив"
	desc = "'С ним намного безопасней! 100% защиты, 99% прочности.' Даже не открыть."
	icon_state = "adamantine"
	colour = "adamantine"

//////

/obj/item/choice_beacon/box/fetish
	name = "choice box (fetish)"
	desc = "Contains 15 of a selected relics inside!"

/obj/item/choice_beacon/box/fetish/generate_display_names()
	var/static/list/fetish_list = list()
	if(!length(fetish_list))
		var/list/fetish_list_temp = subtypesof(/obj/item/slimecross/stabilized/fetish)
		for(var/V in fetish_list_temp) // отображение читаемых имён вместо /obj/gavno/zalupa
			var/atom/A = V
			fetish_list[initial(A.name)] = A
	return fetish_list

/obj/item/choice_beacon/box/fetish/spawn_option(choice,mob/user)
	user.put_in_hands(new choice)
	qdel(src)

