/mob/living/carbon/wendigo/examine(mob/user)
	var/t_He = ru_who(TRUE)
	var/t_His = ru_ego(TRUE)
	var/t_his = ru_ego()
	var/t_him = ru_na()

	. = list("<span class='info'>*---------*\nThis is [icon2html(src, user)] \a <EM>[src]</EM>!")

	if(handcuffed)
		. += "<span class='warning'>[t_He] is [icon2html(handcuffed, user)] handcuffed!</span>"
	if(legcuffed)
		. += "<span class='warning'>[t_He] has [icon2html(legcuffed, user)] leg cuffs!</span>"
	if(head)
		. += "[t_He] is wearing [head.get_examine_string(user)] on [t_his] head."
	if(wear_neck)
		. += "[t_He] is wearing [wear_neck.get_examine_string(user)] around [t_his] neck."

	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "[t_He] is holding [I.get_examine_string(user)] in [t_his] [get_held_index_name(get_held_index_of_item(I))]."

	if(back)
		. += "[t_He] has [back.get_examine_string(user)] on [t_his] back."

	if(stat == DEAD)
		. += "<span class='deadsay'>[t_He] is limp and unresponsive, with no signs of life.</span>"

	var/list/msg = ("<span class='warning'>")
	var/temp_hp = getBruteLoss()
	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY))
		if(temp_hp)
			if(temp_hp <= 25) msg += "[t_He] has minor bruising.\n"
			else if(temp_hp <= 75) msg += "[t_He] has <B>moderate</B> bruising!\n"
			else msg += "<B>[t_He] has severe bruising!</B>\n"
		temp_hp = getFireLoss()
		if(temp_hp)
			if(temp_hp <= 25) msg += "[t_He] has minor burns.\n"
			else if(temp_hp <= 50) msg += "[t_He] has <B>moderate</B> burns!\n"
			else msg += "<B>[t_He] has severe burns!</B>\n"
	if(fire_stacks > 0)
		msg += "[t_He] is covered in something flammable.\n"
	if(fire_stacks < 0)
		msg += "[t_He] looks a little soaked.\n"
	if(pulledby)
		if(pulledby.grab_state)
			msg += "[t_He] is restrained by [pulledby]'s grip.\n"

	msg += "</span>"
	. += msg

	if(stat == UNCONSCIOUS)
		. += "[t_He] isn't responding to anything around [t_him] and seems to be asleep."
	else if(InCritical())
		. += "[t_His] breathing is shallow and labored."


	if(fake_breast_size < 16)
		. += "You see a pair of breasts. You estimate them to be [ascii2text(round(fake_breast_size)+63)]-cups."
	else if(!fake_breast_size && gender == FEMALE)
		. += "You see a pair of breasts. They're small and flatchested, however."
	else
		. += "You see [pick("some serious honkers", "a real set of badonkers", "some dobonhonkeros", "massive dohoonkabhankoloos", "two big old tonhongerekoogers", "a couple of giant bonkhonagahoogs", "a pair of humongous hungolomghnonoloughongous")]. Their volume is way beyond cupsize now, measuring in about [round(fake_breast_size)]cm in diameter."

	if(fake_penis_size)
		. += "You see a flaccid human penis. You estimate it's about [round(fake_penis_size, 0.25)] inch[round(fake_penis_size, 0.25) != 1 ? "es" : ""] long."	//would put girth here but lazy

	if(connected_link)
		if(connected_link.souls.len > 5)
			. += "<span class='warning'><B>[t_His] eyes are glowing a deadly red.</B></span>"
		else
			var/A = "<span class='deadsay'>"
			switch(connected_link.souls.len)
				if(0)
					A += "[t_He] looks malnourished and weak."
				if(1)
					A += "[t_He] looks hungry."
				if(2 to 4)
					A += "[t_He] is salivating."
				if(5)
					A += "[t_His] eyes are glowing red."
			. += "[A]</span>"
	else
		. += "<span class='deadsay'>[t_He] looks lost.</span>"

	SEND_SIGNAL(src, COMSIG_PARENT_EXAMINE, .)
	. += "*---------*</span>"
