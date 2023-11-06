//Dogs.

/mob/living/simple_animal/pet/dog
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "bops"
	response_disarm_simple = "bop"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks!", "woofs!", "yaps.","pants.")
	emote_see = list("мотает головой.", "гоняется за хвостиком.","дрожит.")
	faction = list("dog")
	see_in_dark = 5
	speak_chance = 1
	turns_per_move = 10
	var/held_icon = "corgi"

	footstep_type = FOOTSTEP_MOB_CLAW

	vocal_bark_id = "bullet"
	vocal_speed = 6

/mob/living/simple_animal/pet/dog/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/wuv, "yaps happily!", EMOTE_AUDIBLE, /datum/mood_event/pet_animal, "growls!", EMOTE_AUDIBLE)
	AddElement(/datum/element/mob_holder, held_icon)
	AddElement(/datum/element/strippable, GLOB.strippable_corgi_items)

//Corgis and pugs are now under one dog subtype

/mob/living/simple_animal/pet/dog/corgi
	name = "\improper corgi"
	real_name = "corgi"
	desc = "It's a corgi."
	icon_state = "corgi"
	icon_living = "corgi"
	icon_dead = "corgi_dead"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/corgi = 3, /obj/item/stack/sheet/animalhide/corgi = 1)
	childtype = list(/mob/living/simple_animal/pet/dog/corgi/puppy = 95, /mob/living/simple_animal/pet/dog/corgi/puppy/void = 5)
	animal_species = /mob/living/simple_animal/pet/dog
	gold_core_spawnable = FRIENDLY_SPAWN
	collar_type = "corgi"
	var/obj/item/inventory_head
	var/obj/item/inventory_back
	var/shaved = FALSE
	var/nofur = FALSE 		//Corgis that have risen past the material plane of existence.

/mob/living/simple_animal/pet/dog/corgi/Destroy()
	QDEL_NULL(inventory_head)
	QDEL_NULL(inventory_back)
	return ..()

/mob/living/simple_animal/pet/dog/corgi/handle_atom_del(atom/A)
	if(A == inventory_head)
		inventory_head = null
		update_corgi_fluff()
		regenerate_icons()
	if(A == inventory_back)
		inventory_back = null
		update_corgi_fluff()
		regenerate_icons()
	return ..()

/mob/living/simple_animal/pet/dog/pug
	name = "\improper pug"
	real_name = "pug"
	desc = "It's a pug."
	icon = 'icons/mob/pets.dmi'
	icon_state = "pug"
	icon_living = "pug"
	icon_dead = "pug_dead"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/pug = 3)
	gold_core_spawnable = FRIENDLY_SPAWN
	collar_type = "pug"
	held_icon = "pug"

/mob/living/simple_animal/pet/dog/corgi/exoticcorgi
	name = "Exotic Corgi"
	desc = "As cute as it is colorful!"
	icon = 'icons/mob/pets.dmi'
	icon_state = "corgigrey"
	icon_living = "corgigrey"
	icon_dead = "corgigrey_dead"
	animal_species = /mob/living/simple_animal/pet/dog/corgi/exoticcorgi
	nofur = TRUE

/mob/living/simple_animal/pet/dog/Initialize(mapload)
	. = ..()
	var/dog_area = get_area(src)
	for(var/obj/structure/bed/dogbed/D in dog_area)
		if(!D.owner)
			D.update_owner(src)
			break

/mob/living/simple_animal/pet/dog/corgi/Initialize(mapload)
	. = ..()
	regenerate_icons()

/mob/living/simple_animal/pet/dog/corgi/exoticcorgi/Initialize(mapload)
		. = ..()
		var/newcolor = rgb(rand(0, 255), rand(0, 255), rand(0, 255))
		add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)

/mob/living/simple_animal/pet/dog/corgi/death(gibbed)
	..(gibbed)
	regenerate_icons()

GLOBAL_LIST_INIT(strippable_corgi_items, create_strippable_list(list(
	/datum/strippable_item/corgi_head,
	/datum/strippable_item/corgi_back,
	/datum/strippable_item/corgi_collar,
	/datum/strippable_item/corgi_id,
)))

/datum/strippable_item/corgi_head
	key = STRIPPABLE_ITEM_HEAD

/datum/strippable_item/corgi_head/get_item(atom/source)
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	return corgi_source.inventory_head

/datum/strippable_item/corgi_head/finish_equip(atom/source, obj/item/equipping, mob/user)
	if(!..())
		return FALSE
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return FALSE

	corgi_source.place_on_head(equipping, user)

/datum/strippable_item/corgi_head/finish_unequip(atom/source, mob/user)
	..()
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	finish_unequip_mob(corgi_source.inventory_head, corgi_source, user)
	corgi_source.inventory_head = null
	corgi_source.update_corgi_fluff()
	corgi_source.regenerate_icons()

/datum/strippable_item/corgi_back
	key = STRIPPABLE_ITEM_BACK

/datum/strippable_item/corgi_back/get_item(atom/source)
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	return corgi_source.inventory_back

/datum/strippable_item/corgi_back/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if (!.)
		return FALSE

	if (!ispath(equipping.dog_fashion, /datum/dog_fashion/back))
		to_chat(user, "<span class='warning'>You set [equipping] on [source]'s back, but it falls off!</span>")
		equipping.forceMove(source.drop_location())
		if (prob(25))
			step_rand(equipping)
		dance_rotate(source, set_original_dir = TRUE)

		return FALSE

	return TRUE

/datum/strippable_item/corgi_back/finish_equip(atom/source, obj/item/equipping, mob/user)
	if(!..())
		return FALSE
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return FALSE

	equipping.forceMove(corgi_source)
	corgi_source.inventory_back = equipping
	corgi_source.update_corgi_fluff()
	corgi_source.regenerate_icons()

/datum/strippable_item/corgi_back/finish_unequip(atom/source, mob/user)
	..()
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	finish_unequip_mob(corgi_source.inventory_back, corgi_source, user)
	corgi_source.inventory_back = null
	corgi_source.update_corgi_fluff()
	corgi_source.regenerate_icons()

/datum/strippable_item/corgi_collar
	key = STRIPPABLE_ITEM_CORGI_COLLAR

/datum/strippable_item/corgi_collar/get_item(atom/source)
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	return corgi_source.pcollar

/datum/strippable_item/corgi_collar/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if (!.)
		return FALSE

	if (!istype(equipping, /obj/item/clothing/neck/petcollar))
		to_chat(user, "<span class='warning'>That's not a collar.</span>")
		return FALSE

	return TRUE

/datum/strippable_item/corgi_collar/finish_equip(atom/source, obj/item/equipping, mob/user)
	if(!..())
		return FALSE
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return FALSE

	corgi_source.add_collar(equipping, user)
	corgi_source.update_corgi_fluff()

/datum/strippable_item/corgi_collar/finish_unequip(atom/source, mob/user)
	..()
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	finish_unequip_mob(corgi_source.pcollar, corgi_source, user)
	corgi_source.pcollar = null
	corgi_source.update_corgi_fluff()
	corgi_source.regenerate_icons()

/datum/strippable_item/corgi_id
	key = STRIPPABLE_ITEM_ID

/datum/strippable_item/corgi_id/get_item(atom/source)
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	return corgi_source.access_card

/datum/strippable_item/corgi_id/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if (!.)
		return FALSE

	if (!istype(equipping, /obj/item/card/id))
		to_chat(user, "<span class='warning'>You can't pin [equipping] to [source]!</span>")
		return FALSE

	return TRUE

/datum/strippable_item/corgi_id/finish_equip(atom/source, obj/item/equipping, mob/user)
	if(!..())
		return FALSE
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return FALSE

	equipping.forceMove(source)
	corgi_source.access_card = equipping

/datum/strippable_item/corgi_id/finish_unequip(atom/source, mob/user)
	..()
	var/mob/living/simple_animal/pet/dog/corgi/corgi_source = source
	if (!istype(corgi_source))
		return

	finish_unequip_mob(corgi_source.access_card, corgi_source, user)
	corgi_source.access_card = null
	corgi_source.update_corgi_fluff()
	corgi_source.regenerate_icons()

/mob/living/simple_animal/pet/dog/corgi/getarmor(def_zone, type)
	var/armorval = 0

	if(def_zone)
		if(def_zone == BODY_ZONE_HEAD)
			if(inventory_head)
				armorval = inventory_head.armor.getRating(type)
		else
			if(inventory_back)
				armorval = inventory_back.armor.getRating(type)
		return armorval
	else
		if(inventory_head)
			armorval += inventory_head.armor.getRating(type)
		if(inventory_back)
			armorval += inventory_back.armor.getRating(type)
	return armorval*0.5

/mob/living/simple_animal/pet/dog/corgi/attackby(obj/item/O, mob/user, params)
	if (istype(O, /obj/item/razor))
		if (shaved)
			to_chat(user, "<span class='warning'>You can't shave this corgi, it's already been shaved!</span>")
			return
		if (nofur)
			to_chat(user, "<span class='warning'> You can't shave this corgi, it doesn't have a fur coat!</span>")
			return
		user.visible_message("[user] starts to shave [src] using \the [O].", "<span class='notice'>You start to shave [src] using \the [O]...</span>")
		if(do_after(user, 50, target = src))
			user.visible_message("[user] shaves [src]'s hair using \the [O].")
			playsound(loc, 'sound/items/welder2.ogg', 20, 1)
			shaved = TRUE
			icon_living = "[initial(icon_living)]_shaved"
			icon_dead = "[initial(icon_living)]_shaved_dead"
			if(stat == CONSCIOUS)
				icon_state = icon_living
			else
				icon_state = icon_dead
		return
	..()
	update_corgi_fluff()

//Corgis are supposed to be simpler, so only a select few objects can actually be put
//to be compatible with them. The objects are below.
//Many  hats added, Some will probably be removed, just want to see which ones are popular.
// > some will probably be removed

/mob/living/simple_animal/pet/dog/corgi/proc/place_on_head(obj/item/item_to_add, mob/user)
	if(inventory_head)
		if(user)
			to_chat(user, "<span class='warning'>You can't put more than one hat on [src]!</span>")
		return
	if(!item_to_add)
		user.visible_message("<span class='notice'>[user] pets [src].</span>", "<span class='notice'>You rest your hand on [src]'s head for a moment.</span>")
		if(flags_1 & HOLOGRAM_1)
			return
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, src, /datum/mood_event/pet_animal, src)
		return

	if(user && !user.temporarilyRemoveItemFromInventory(item_to_add))
		to_chat(user, "<span class='warning'>\The [item_to_add] is stuck to your hand, you cannot put it on [src]'s head!</span>")
		return

	var/valid = FALSE
	if(ispath(item_to_add.dog_fashion, /datum/dog_fashion/head))
		valid = TRUE

	//Various hats and items (worn on his head) change Ian's behaviour. His attributes are reset when a hat is removed.

	if(valid)
		if(health <= 0)
			to_chat(user, "<span class='notice'>There is merely a dull, lifeless look in [real_name]'s eyes as you put the [item_to_add] on [ru_na()].</span>")
		else if(user)
			user.visible_message("<span class='notice'>[user] puts [item_to_add] on [real_name]'s head. [src] looks at [user] and barks once.</span>",
				"<span class='notice'>You put [item_to_add] on [real_name]'s head. [src] gives you a peculiar look, then wags [ru_ego()] tail once and barks.</span>",
				"<span class='hear'>You hear a friendly-sounding bark.</span>")
		item_to_add.forceMove(src)
		src.inventory_head = item_to_add
		update_corgi_fluff()
		regenerate_icons()
	else
		to_chat(user, "<span class='warning'>You set [item_to_add] on [src]'s head, but it falls off!</span>")
		item_to_add.forceMove(drop_location())
		if(prob(25))
			step_rand(item_to_add)
		dance_rotate(src, set_original_dir = TRUE)

	return valid



/mob/living/simple_animal/pet/dog/corgi/proc/update_corgi_fluff()
	// First, change back to defaults
	name = real_name
	desc = initial(desc)
	// BYOND/DM doesn't support the use of initial on lists.
	speak = list("YAP", "Woof!", "Bark!", "AUUUUUU")
	speak_emote = list("barks", "woofs")
	emote_hear = list("barks!", "woofs!", "yaps.","pants.")
	emote_see = list("мотает головой.", "гоняется за хвостиком.","дрожит.")
	desc = initial(desc)
	set_light(0)

	if(inventory_head && inventory_head.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_head.dog_fashion(src)
		DF.apply(src)

	if(inventory_back && inventory_back.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_back.dog_fashion(src)
		DF.apply(src)

//IAN! SQUEEEEEEEEE~
/mob/living/simple_animal/pet/dog/corgi/Ian
	name = "Ian"
	real_name = "Ian"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "It's the HoP's beloved corgi."
	var/turns_since_scan = 0
	var/obj/movement_target
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE
	var/age = 0
	var/record_age = 1
	var/memory_saved = FALSE
	var/saved_head //path

/mob/living/simple_animal/pet/dog/corgi/Ian/Initialize(mapload)
	. = ..()
	//parent call must happen first to ensure IAN
	//is not in nullspace when child puppies spawn
	Read_Memory()
	if(age == 0)
		var/turf/target = get_turf(loc)
		if(target)
			var/mob/living/simple_animal/pet/dog/corgi/puppy/P = new /mob/living/simple_animal/pet/dog/corgi/puppy(target)
			P.name = "Ian"
			P.real_name = "Ian"
			P.gender = MALE
			P.desc = "It's the HoP's beloved corgi puppy."
			Write_Memory(FALSE)
			return INITIALIZE_HINT_QDEL
	else if(age == record_age)
		icon_state = "old_corgi"
		icon_living = "old_corgi"
		icon_dead = "old_corgi_dead"
		desc = "At a ripe old age of [record_age], Ian's not as spry as he used to be, but he'll always be the HoP's beloved corgi." //RIP
		turns_per_move = 20
		RemoveElement(/datum/element/mob_holder, held_icon)
		AddElement(/datum/element/mob_holder, "old_corgi")

/mob/living/simple_animal/pet/dog/corgi/Ian/BiologicalLife(delta_time, times_fired)
	if(!(. = ..()))
		return
	if(!stat && SSticker.current_state == GAME_STATE_FINISHED && !memory_saved)
		Write_Memory(FALSE)
		memory_saved = TRUE

/mob/living/simple_animal/pet/dog/corgi/Ian/death()
	if(!memory_saved)
		Write_Memory(TRUE)
	..()

/mob/living/simple_animal/pet/dog/corgi/Ian/proc/Read_Memory()
	set waitfor = FALSE
	var/saved_color
	if(fexists("data/npc_saves/Ian.sav")) //legacy compatability to convert old format to new
		var/savefile/S = new /savefile("data/npc_saves/Ian.sav")
		S["age"] 		>> age
		S["record_age"]	>> record_age
		S["saved_head"] >> saved_head
		fdel("data/npc_saves/Ian.sav")
	else
		var/json_file = file("data/npc_saves/Ian.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		age = json["age"]
		record_age = json["record_age"]
		saved_head = json["saved_head"]
		saved_color = json["color"]
	if(isnull(age))
		age = 0
	if(isnull(record_age))
		record_age = 1
	if(saved_head)
		place_on_head(new saved_head)
	if(!isnull(saved_color))
		add_atom_colour(json_decode(saved_color), FIXED_COLOUR_PRIORITY)

/mob/living/simple_animal/pet/dog/corgi/Ian/proc/Write_Memory(dead)
	var/json_file = file("data/npc_saves/Ian.json")
	var/list/file_data = list()
	if(!dead)
		file_data["age"] = age + 1
		if((age + 1) > record_age)
			file_data["record_age"] = record_age + 1
		else
			file_data["record_age"] = record_age
		if(inventory_head)
			file_data["saved_head"] = inventory_head.type
		else
			file_data["saved_head"] = null
		if(color)
			file_data["color"] = json_encode(color)
		else
			file_data["color"] = null
	else
		file_data["age"] = 0
		file_data["record_age"] = record_age
		file_data["saved_head"] = null
		file_data["color"] = null
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))

/mob/living/simple_animal/pet/dog/corgi/Ian/BiologicalLife()
	if(!(. = ..()))
		return
	INVOKE_ASYNC(src, .proc/corgi_ai_behavior)

/mob/living/simple_animal/pet/dog/corgi/Ian/proc/corgi_ai_behavior()
	//Feeding, chasing food, FOOOOODDDD
	if(!stat && CHECK_MULTIPLE_BITFIELDS(mobility_flags, MOBILITY_STAND|MOBILITY_MOVE) && !buckled)
		turns_since_scan++
		if(turns_since_scan > 5)
			turns_since_scan = 0
			if((movement_target) && !(isturf(movement_target.loc) || ishuman(movement_target.loc) ))
				movement_target = null
				stop_automated_movement = 0
			if( !movement_target || !(movement_target.loc in oview(src, 3)) )
				movement_target = null
				stop_automated_movement = 0
				for(var/obj/item/reagent_containers/food/snacks/S in oview(src,3))
					if(isturf(S.loc) || ishuman(S.loc))
						movement_target = S
						break
			if(movement_target)
				stop_automated_movement = 1
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)
				sleep(3)
				step_to(src,movement_target,1)

				if(movement_target?.loc)		//Not redundant due to sleeps, Item can be gone in 6 decisecomds
					if (movement_target.loc.x < src.x)
						setDir(WEST)
					else if (movement_target.loc.x > src.x)
						setDir(EAST)
					else if (movement_target.loc.y < src.y)
						setDir(SOUTH)
					else if (movement_target.loc.y > src.y)
						setDir(NORTH)
					else
						setDir(SOUTH)

					if(!Adjacent(movement_target)) //can't reach food through windows.
						return

					if(isturf(movement_target.loc) )
						movement_target.attack_animal(src)
					else if(ishuman(movement_target.loc) )
						if(prob(20))
							emote("me", EMOTE_VISIBLE, "stares at [movement_target.loc]'s [movement_target] with a sad puppy-face")

		if(prob(1))
			emote("me", EMOTE_VISIBLE, pick("подпрыгивает на месте.","гоняется за хвостиком!"))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					setDir(i)
					sleep(1)

/mob/living/simple_animal/pet/dog/corgi/Ian/narsie_act()
	playsound(src, 'sound/magic/demon_dies.ogg', 75, TRUE)
	var/mob/living/simple_animal/pet/dog/corgi/narsie/N = new(loc)
	N.setDir(dir)
	gib()

/mob/living/simple_animal/pet/dog/corgi/narsie
	name = "Nars-Ian"
	desc = "Ia! Ia!"
	icon_state = "narsian"
	icon_living = "narsian"
	icon_dead = "narsian_dead"
	faction = list("dog", "cult")
	gold_core_spawnable = NO_SPAWN
	nofur = TRUE
	unique_pet = TRUE

/mob/living/simple_animal/pet/dog/corgi/narsie/BiologicalLife(delta_time, times_fired)
	if(!(. = ..()))
		return
	for(var/mob/living/simple_animal/pet/P in range(1, src))
		if(P != src && prob(5))
			visible_message("<span class='warning'>[src] devours [P]!</span>", \
			"<span class='cult big bold'>DELICIOUS SOULS</span>")
			playsound(src, 'sound/magic/demon_attack1.ogg', 75, TRUE)
			narsie_act()
			P.gib()

/mob/living/simple_animal/pet/dog/corgi/narsie/update_corgi_fluff()
	..()
	speak = list("Tari'karat-pasnar!", "IA! IA!", "BRRUUURGHGHRHR")
	speak_emote = list("growls", "barks ominously")
	emote_hear = list("barks echoingly!", "woofs hauntingly!", "yaps in an eldritch manner.", "mutters something unspeakable.")
	emote_see = list("communes with the unnameable.", "ponders devouring some souls.", "shakes.")

/mob/living/simple_animal/pet/dog/corgi/narsie/narsie_act()
	adjustBruteLoss(-maxHealth)


/mob/living/simple_animal/pet/dog/corgi/regenerate_icons()
	..()
	if(inventory_head)
		var/image/head_icon
		var/datum/dog_fashion/DF = new inventory_head.dog_fashion(src)

		if(!DF.obj_icon_state)
			DF.obj_icon_state = inventory_head.icon_state
		if(!DF.obj_alpha)
			DF.obj_alpha = inventory_head.alpha
		if(!DF.obj_color)
			DF.obj_color = inventory_head.color

		if(health <= 0)
			head_icon = DF.get_overlay(dir = EAST)
			head_icon.pixel_y = -8
			head_icon.transform = turn(head_icon.transform, 180)
		else
			head_icon = DF.get_overlay()

		add_overlay(head_icon)

	if(inventory_back)
		var/image/back_icon
		var/datum/dog_fashion/DF = new inventory_back.dog_fashion(src)

		if(!DF.obj_icon_state)
			DF.obj_icon_state = inventory_back.icon_state
		if(!DF.obj_alpha)
			DF.obj_alpha = inventory_back.alpha
		if(!DF.obj_color)
			DF.obj_color = inventory_back.color

		if(health <= 0)
			back_icon = DF.get_overlay(dir = EAST)
			back_icon.pixel_y = -11
			back_icon.transform = turn(back_icon.transform, 180)
		else
			back_icon = DF.get_overlay()
		add_overlay(back_icon)

	return



/mob/living/simple_animal/pet/dog/corgi/puppy
	name = "\improper corgi puppy"
	real_name = "corgi"
	desc = "It's a corgi puppy!"
	icon_state = "puppy"
	icon_living = "puppy"
	icon_dead = "puppy_dead"
	density = FALSE
	pass_flags = PASSMOB
	mob_size = MOB_SIZE_SMALL
	collar_type = "puppy"
	childtype = null

	vocal_pitch = 1.6

//puppies cannot wear anything.
/mob/living/simple_animal/pet/dog/corgi/puppy/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		to_chat(usr, "<span class='warning'>You can't fit this on [src]!</span>")
		return
	..()


/mob/living/simple_animal/pet/dog/corgi/puppy/void		//Tribute to the corgis born in nullspace
	name = "\improper void puppy"
	real_name = "voidy"
	desc = "A corgi puppy that has been infused with deep space energy. It's staring back..."
	icon_state = "void_puppy"
	icon_living = "void_puppy"
	icon_dead = "void_puppy_dead"
	nofur = TRUE
	unsuitable_atmos_damage = 0
	minbodytemp = TCMB
	maxbodytemp = T0C + 40
	held_icon = "void_puppy"

	vocal_pitch = 0.6

/mob/living/simple_animal/pet/dog/corgi/puppy/void/Process_Spacemove(movement_dir = 0)
	return 1	//Void puppies can navigate space.


//LISA! SQUEEEEEEEEE~
/mob/living/simple_animal/pet/dog/corgi/Lisa
	name = "Lisa"
	real_name = "Lisa"
	gender = FEMALE
	desc = "She's tearing you apart."
	gold_core_spawnable = NO_SPAWN
	unique_pet = TRUE
	icon_state = "lisa"
	icon_living = "lisa"
	icon_dead = "lisa_dead"
	var/turns_since_scan = 0
	var/puppies = 0
	held_icon = "lisa"

//Lisa already has a cute bow!
/mob/living/simple_animal/pet/dog/corgi/Lisa/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		to_chat(usr, "<span class='danger'>[src] already has a cute bow!</span>")
		return
	..()

/mob/living/simple_animal/pet/dog/corgi/Lisa/BiologicalLife(delta_time, times_fired)
	if(!(. = ..()))
		return

	make_babies()

	if(!stat && CHECK_MULTIPLE_BITFIELDS(mobility_flags, MOBILITY_STAND|MOBILITY_MOVE) && !buckled)
		if(prob(1))
			emote("me", EMOTE_VISIBLE, pick("подпрыгивает на месте.","гоняется за хвостиком."))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					setDir(i)
					sleep(1)

/mob/living/simple_animal/pet/dog/pug/BiologicalLife(delta_time, times_fired)
	if(!(. = ..()))
		return
	if(!stat && CHECK_MULTIPLE_BITFIELDS(mobility_flags, MOBILITY_STAND|MOBILITY_MOVE) && !buckled)
		if(prob(1))
			emote("me", EMOTE_VISIBLE, pick("гоняется за хвостиком."))
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					setDir(i)
					sleep(1)
