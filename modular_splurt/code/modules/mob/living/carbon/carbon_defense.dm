
/mob/living/carbon/attacked_by(obj/item/I, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	. = ..()
	if(iswendigo(src) && user == pulling)
		to_chat(src, "<span class='danger'>I can't hit them, their grip is too strong!</span>")
		return FALSE
	if(iswendigo(src))
		var/mob/living/carbon/wendigo/W = src
		if(W.slaves.Find(user))
			to_chat(src, "<span class='danger'>I can't hit them, they're my master!</span>")
			return FALSE


