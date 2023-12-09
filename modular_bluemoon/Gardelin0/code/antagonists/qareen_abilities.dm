/mob/living/simple_animal/qareen/verb/switch_gender()
	set name = "Switch Gender"
	set desc = "Allows you to set your gender."
	set category = "Qareen"

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You cannot toggle your gender while unconcious!"))
		return

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("None", "Male", "Female", "Both"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = TRUE
			gender = PLURAL
			icon_state = "qareen_futa_idle"
			icon_idle = "qareen_futa_idle"
			icon_reveal = "qareen_futa_revealed"
			icon_stun = "qareen_futa_stun"
			icon_drain = "qareen_futa_draining"
		if("Male")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = FALSE
			gender = MALE
			icon_state = "qareen_male_idle"
			icon_idle = "qareen_male_idle"
			icon_reveal = "qareen_male_revealed"
			icon_stun = "qareen_male_stun"
			icon_drain = "qareen_male_draining"
		if("Female")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = TRUE
			gender = FEMALE
			icon_state = "qareen_female_idle"
			icon_idle = "qareen_female_idle"
			icon_reveal = "qareen_female_revealed"
			icon_stun = "qareen_female_stun"
			icon_drain = "qareen_female_draining"
		if("None")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = FALSE
			gender = NEUTER
			icon_state = "qareen_none_idle"
			icon_idle = "qareen_none_idle"
			icon_reveal = "qareen_none_revealed"
			icon_stun = "qareen_none_stun"
			icon_drain = "qareen_none_draining"

	update_spooky_icon()

/mob/living/simple_animal/qareen/verb/visibility()
	set name = "Toggle Invisibility"
	set desc = "Allows you to become visible."
	set category = "Qareen"

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You cannot toggle your gender while unconcious!"))
		return

	revealed = !revealed
	if(revealed)
		to_chat(src, "<span class='revendanger'>You have been revealed!</span>")
		invisibility = 0
	else
		to_chat(src, "<span class='revendanger'>You are invisible again!</span>")
		invisibility = 50
	update_spooky_icon()

/mob/living/simple_animal/qareen/verb/toggle_name()
	set name = "Set Name"
	set desc = "Allows you to change your name."
	set category = "Qareen"

	var/choice = input("What was your name?") as text
	src.name = choice

/mob/living/simple_animal/qareen/verb/changing_color()
	set name = "Change Color"
	set desc = "Allows you to change color."
	set category = "Qareen"

	var/C = input(src, "Select Color", "Select color", "#ffffff") as color|null
	color = C
	update_spooky_icon()
