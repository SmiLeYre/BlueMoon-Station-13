#define CHARGE_COMPLETED		2

/obj/structure/carp_rift/summon_carp(mob/user)
	if(carp_stored <= 0)//Not enough carp points
		return FALSE
	var/carp_ask = alert("Become a carp?", "Help bring forth the horde?", "Yes", "No")
	if(carp_ask == "No" || !src || QDELETED(src) || QDELETED(user))
		return FALSE
	if(carp_stored <= 0)
		to_chat(user, "<span class='warning'>The rift already summoned enough carp!</span>")
		return FALSE
	var/mob/living/simple_animal/hostile/carp/dragon/newcarp = new /mob/living/simple_animal/hostile/carp/dragon(loc)
	newcarp.key = user.key
	var/datum/antagonist/space_dragon/S = dragon.mind.has_antag_datum(/datum/antagonist/space_dragon)
	if(S)
		S.carp += newcarp.mind
	to_chat(newcarp, "<span class='boldwarning'>You have arrived in order to assist the space dragon with securing the rifts.  Do not jeopardize the mission, and protect the rifts at all costs!</span>")
	carp_stored--
	if(carp_stored <= 0 && charge_state < CHARGE_COMPLETED)
		icon_state = "carp_rift"
		light_color = LIGHT_COLOR_BLUE
		update_light()
	return TRUE

/mob/living/simple_animal/hostile/carp/dragon
	name = "dragon space carp"
	health = 70
	maxHealth = 70

#undef CHARGE_COMPLETED
